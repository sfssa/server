#include "./utils.h"

namespace atpdxy{

pid_t GetThreadId(){
    return syscall(SYS_gettid);
}

void Backtrace(std::vector<std::string>& bt, int size, int skip){
    void** array = (void**)malloc(sizeof(void*) * size);
    size_t s = ::backtrace(array, size);
    char** strings = backtrace_symbols(array, s);
    
    if(strings == nullptr){
        std::cerr << "error in Backtrace: backtrace_symbols return nullptr" << std::endl;
        free(array);
        return;
    }

    for(size_t i = skip; i < s; ++i){
        bt.push_back(strings[i]);
    }
    free(strings);
    free(array);
}

std::string BacktraceToString(int size, int skip, const std::string& prefix){
    std::vector<std::string> bt;
    Backtrace(bt, size, skip);
    
    std::stringstream ss;
    for(const auto& entry : bt){
        ss << prefix << entry << std::endl;
    }
    return ss.str();
}

}
