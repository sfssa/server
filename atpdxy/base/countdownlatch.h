#pragma once

#include "./mutex.h"
#include "./noncopyable.h"

// CountDownLatch提供了多线程协调机制，使得某个线程或一组线程能够在
// 其他线程完成待定任务后再继续执行
// 本项目中确保传递给线程的func真的启动后才返回start函数

namespace atpdxy{

class CountDownLatch : public Noncopyable{
public:
    // 构造函数
    CountDownLatch(const int count);
    // 析构函数
    ~CountDownLatch() {}
    // 等待函数
    void wait();
    // 计数值-1
    void countDown();
private:
    // 互斥锁
    Mutex m_mutex;
    // 条件变量，用以唤醒等待的线程
    Condition m_cond;
    // 计数值
    int m_count;
};

}
