#include "./mutex.h"
namespace atpdxy{


Semaphore::Semaphore(const size_t count){
    if(sem_init(&m_semaphore, 0, count)){
        throw std::logic_error("error in Semaphore::Semaphore()");
    }    
}

Semaphore::~Semaphore(){
    sem_destroy(&m_semaphore);
}

void Semaphore::wait(){
    if(sem_wait(&m_semaphore)){
        throw std::logic_error("error in Semaphore::wait");
    }
}

void Semaphore::notifyOne(){
    if(sem_post(&m_semaphore)){
        throw std::logic_error("error in Semaphore::notifyOne");
    }
}

}

