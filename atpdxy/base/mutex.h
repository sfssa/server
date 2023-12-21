#pragma once
#include <memory>
#include <pthread.h>
#include <atomic>
#include <semaphore.h>
#include <stdexcept>
#include "noncopyable.h"

namespace atpdxy{

// 说明：构造函数中参数使用引用以及私有数据成员以引用的方式存在，目的是为了避免使用拷贝构造函数或者赋值构造函数
// 其中引用需要在成员初始化列表中完成初始化

// RAII实现锁的自动释放
template <class T>
class LockGuard{
public:
    // 构造函数中上锁并修改状态
    LockGuard(T& mutex)
        :m_mutex(mutex){
        m_mutex.lock();
        m_islocked = true;
    }
    // 析构函数中释放锁，会在unlock函数中修改锁状态
    ~LockGuard(){
        unlock();
    }
    // 上锁
    void lock(){
        if(!m_islocked){
            m_mutex.lock();
            m_islocked = true;
        }
    }
    // 解锁
    void unlock(){
        if(m_islocked){
            m_mutex.unlock();
            m_islocked = false;
        }
    }
private:
    // 互斥锁
    T& m_mutex;
    // 上锁和解锁会执行系统调用，为了避免每次上锁都会尝试
    // 执行系统调用，用m_islocked变量来追踪锁的状态
    bool m_islocked;
};

// 互斥量封装
class Mutex : public Noncopyable
{
public:
    // 将本类传入模板中，从而实现Mutex的RAII
    typedef LockGuard<Mutex> Lock;
    // 构造函数
    Mutex(){
        pthread_mutex_init(&m_mutex, nullptr);
    }
    // 析构函数
    ~Mutex(){
        pthread_mutex_destroy(&m_mutex);
    }
    // 加锁
    void lock(){
        pthread_mutex_lock(&m_mutex);
    }
    // 解锁
    void unlock(){
        pthread_mutex_unlock(&m_mutex);
    }
    // 返回mutex
    pthread_mutex_t* getMutex(){
        return &m_mutex;
    }
private:
    pthread_mutex_t m_mutex;
};

// 信号量封装
class Semaphore : Noncopyable{
public:
    // 构造函数
    Semaphore(const size_t count = 0);
    // 析构函数
    ~Semaphore();
    // 请求资源
    void wait();
    // 唤醒一个等待的线程
    void notifyOne();
private:
    sem_t m_semaphore;
};

// 条件变量封装
class Condition : public Noncopyable{
public:
    // 构造函数
    Condition(Mutex& mutex)
        :m_mutex(mutex){
        pthread_cond_init(&m_cond, nullptr);
    }
    // 析构函数
    ~Condition(){
        pthread_cond_destroy(&m_cond);
    }
    // 唤醒一个等待线程
    void notifyOne(){
        pthread_cond_signal(&m_cond);
    }
    // 唤醒所有等待线程
    void notifyAll(){
        pthread_cond_broadcast(&m_cond);
    }
    // 等待函数
    void wait(){
        pthread_cond_wait(&m_cond, m_mutex.getMutex());
    }
    // 等待固定时间函数
    bool waitForSeconds(int seconds){
        struct timespec time;
        clock_gettime(CLOCK_REALTIME, &time);
        time.tv_sec += static_cast<time_t>(seconds);
        return ETIMEDOUT == pthread_cond_timedwait(&m_cond, m_mutex.getMutex(), &time);
    }
    // 返回互斥锁
    Mutex* getMutex(){
        return &m_mutex;
    }
private:
    Mutex& m_mutex;
    pthread_cond_t m_cond;
};

// 读锁RAII
template <class T>
class ReadMutexLockGuard{
public:
    // 构造函数中上锁并修改锁状态
    ReadMutexLockGuard(T& mutex)
        :m_mutex(mutex){
        mutex.readLock();
        m_islocked = true;
    }
    // 析构函数释放锁
    ~ReadMutexLockGuard(){
        unlock();
    }
    //上读锁
    void lock(){
        if(!m_islocked){
            m_mutex.readLock();
            m_islocked = true;
        }
    }
    // 解锁
    void unlock(){
        if(m_islocked){
            m_mutex.unlock();
            m_islocked = false;
        }
    }
private:
    // 传入的互斥锁
    T& m_mutex;
    // 跟踪锁的状态
    bool m_islocked;
};

// 写锁RAII
template <class T>
class WriteMutexLockGuard{
public:
    // 构造函数，创建时上锁并修改锁状态
    WriteMutexLockGuard(T& mutex)
        :m_mutex(mutex){
        m_mutex.writeLock();
        m_islocked = true;
    }
    // 析构函数
    ~WriteMutexLockGuard(){
        m_mutex.unlock();
    }
    // 上写锁
    void lock(){
        if(!m_islocked){
            m_mutex.writeLock();
            m_islocked = true;
        }
    }
    // 解锁
    void unlock(){
        if(m_islocked){
            m_mutex.unlock();
            m_islocked = false;
        }
    }
private:
    // 互斥量
    T& m_mutex;
    // 跟踪锁状态
    bool m_islocked;
};

// 读写锁封装
class RWMutex : public Noncopyable{
public:
    // 将本类传入模板中，从而实现读锁的RAII
    typedef ReadMutexLockGuard<RWMutex> ReadLock;
    // 将本类传入模板中，从而实现写锁的RAII
    typedef WriteMutexLockGuard<RWMutex> WriteLock;
    // 构造函数
    RWMutex(){
        pthread_rwlock_init(&m_rwlock, nullptr);
    }
    // 析构函数
    ~RWMutex(){
        pthread_rwlock_destroy(&m_rwlock);
    }
    // 读锁
    void readLock(){
        pthread_rwlock_rdlock(&m_rwlock);
    }
    // 写锁
    void writeLock(){
        pthread_rwlock_wrlock(&m_rwlock);
    }
    // 解锁
    void unlock(){
        pthread_rwlock_unlock(&m_rwlock);
    }
private:
    pthread_rwlock_t m_rwlock;
};

// 自旋锁
class Spinlock{
public:
    typedef LockGuard<Spinlock> Lock;
    // 构造函数
    Spinlock(){
        pthread_spin_init(&m_spinlock, 0);
    }
    // 析构函数
    ~Spinlock(){
        pthread_spin_destroy(&m_spinlock);
    }
    // 上锁
    void lock(){
        pthread_spin_lock(&m_spinlock);
    }
    // 解锁
    void unlock(){
        pthread_spin_unlock(&m_spinlock);
    }
private:
    pthread_spinlock_t m_spinlock;
};

// 原子锁
class CASLock : public Noncopyable{
public:
    typedef LockGuard<CASLock> Lock;
    // 构造函数
    CASLock(){
        m_mutex.clear();
    }
    // 析构函数
    ~CASLock(){

    }
    // 上锁
    void lock(){
        while(std::atomic_flag_test_and_set_explicit(&m_mutex, std::memory_order_acquire));
    }
    // 解锁
    void unlock(){
        std::atomic_flag_clear_explicit(&m_mutex, std::memory_order_release);
    }
private:
    volatile std::atomic_flag m_mutex;
};

}
