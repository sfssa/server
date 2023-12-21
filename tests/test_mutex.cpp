#include "../atpdxy/base/mutex.h"
#include <iostream>
#include <thread>
#include <vector>
#include "../atpdxy/base/utils.h"

atpdxy::Mutex mutex;
atpdxy::Spinlock spinLock;
atpdxy::RWMutex rwmutex;
atpdxy::CASLock caslock;
atpdxy::Condition cond(mutex);
volatile static int count = 0;
// 结果读锁的结果不正确
void addCount(){
    for(int i = 0; i < 100000; ++i){
        // atpdxy::Mutex::Lock lock(mutex);
        // atpdxy::Spinlock::Lock lock(spinLock);
        // atpdxy::RWMutex::ReadLock lock(rwmutex);
        // atpdxy::CASLock::Lock lock(caslock);
        atpdxy::RWMutex::WriteLock lock(rwmutex);
        ++count;
    }
}

void testMutex(){
    std::vector<std::thread> arr;
    int n = 5;
    arr.reserve(n);
    for(int i = 0;i < n;++i){
        arr[i] = std::thread(addCount);
    }

    for(int i = 0;i < n; ++i){
        if(arr[i].joinable()){
            arr[i].join();
        }
    }
}

void testFunction(atpdxy::Condition& cond){
    std::cout << atpdxy::GetThreadId() << "---" << __LINE__ << "---" << __func__ << std::endl;
    {
        atpdxy::Mutex::Lock lock(mutex);
        std::cout << "Thread " << atpdxy::GetThreadId() << " is waitting" << std::endl;
        cond.wait();
        std::cout << "Thread " << atpdxy::GetThreadId() << " is awake" << std::endl;
    }
}

void testNotifyOne(atpdxy::Condition& cond){
    std::cout << atpdxy::GetThreadId() << "---" << __LINE__ << "---" << __func__ << std::endl;
    {
        atpdxy::Mutex::Lock lock(mutex);
        std::cout << "Thread " << atpdxy::GetThreadId() << "is notifyOne" << std::endl;
        cond.notifyOne();
    }
}

void testNotifyAll(atpdxy::Condition& cond){
    std::cout << atpdxy::GetThreadId() << "---" << __LINE__ << "---" << __func__ << std::endl;
    {
        atpdxy::Mutex::Lock lock(mutex);
        std::cout << "Thread " << atpdxy::GetThreadId() << "is notifyAll" << std::endl;
    }
}

void testWaitForSeconds(atpdxy::Condition& cond, int seconds){
    std::cout << atpdxy::GetThreadId() << "---" << __LINE__ << "---" << __func__ << std::endl;
    {
        atpdxy::Mutex::Lock lock(mutex);
        std::cout << "Thread" << atpdxy::GetThreadId() << "is waitforseconds: " << seconds << std::endl;
        if(cond.waitForSeconds(seconds)){
            std::cout << "Thread " << atpdxy::GetThreadId() << "wake up due to timeout" << std::endl;
        }else{
            std::cout << "Thread " << atpdxy::GetThreadId() << "wake up due to signal" << std::endl;
        }
    }
}

void testCondition(){
    std::cout << atpdxy::GetThreadId() << "---" << __LINE__ << "---" << __func__ << std::endl;
    std::thread t1(&testFunction, std::ref(cond));
    std::thread t2(&testWaitForSeconds, std::ref(cond),1);
    std::this_thread::sleep_for(std::chrono::seconds(1));
    std::thread t3(&testNotifyOne, std::ref(cond));
    std::thread t4(&testNotifyAll, std::ref(cond));

    t1.join();
    t2.join();
    t3.join();
    t4.join();
}

int main()
{
    // std::cout << "before function: " << count << std::endl;
    // testMutex();
    // std::cout << "after function: " << count << std::endl;
    testCondition();
    return 0;
}


