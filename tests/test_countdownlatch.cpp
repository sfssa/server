#include "../atpdxy/base/countdownlatch.h"
#include <thread>
#include <iostream>
#include <vector>
#include "../atpdxy/base/utils.h"

void test(atpdxy::CountDownLatch& countDownLatch){
    std::cout << "Thread " << atpdxy::GetThreadId() << " start" << std::endl;
    countDownLatch.countDown();
    std::cout << "Thread " << atpdxy::GetThreadId() << " finish" << std::endl;
}

int main()
{
    std::vector<std::thread> thrs;
    int count = 5;
    atpdxy::CountDownLatch latch(count);
    thrs.reserve(count);
    for(int i = 0; i < count; ++i){
        thrs[i] = std::thread(test, std::ref(latch));
    }

    // 阻塞主线程，等待创建的线程都被唤醒后继续执行主线程
    latch.wait();
    std::cout << "All threads have start, Main thread continue" << std::endl;
    for(int i = 0; i < count; ++i){
        thrs[i].join();
    }

    std::cout << "All threads have finish" << std::endl;
    return 0;
}

