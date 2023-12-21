#include "./countdownlatch.h"

namespace atpdxy{

CountDownLatch::CountDownLatch(const int count)
    :m_mutex(), m_cond(m_mutex),m_count(count){

}

void CountDownLatch::wait(){
    Mutex::Lock lock(m_mutex);
    while(m_count > 0){
        m_cond.wait();
    }
}

void CountDownLatch::countDown(){
    Mutex::Lock lock(m_mutex);
    --m_count;
    if(m_count == 0){
        m_cond.notifyAll();
    }
}

}
