#include "./fileappender.h"
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <sys/stat.h>
#include <unistd.h>

namespace atpdxy{

// fopen函数负责打开一个文件，a指用追加的方式打开文件描述符，e指当程序执行了exec函数时会关闭文件描述符
FileAppender::FileAppender(const std::string& filename)
    :m_filePtr(fopen(filename.c_str(), "ae")){
    // setbuffer函数用来为文件描述符设置缓冲区
    setbuffer(m_filePtr, m_buffer, sizeof(m_buffer));
}

FileAppender::~FileAppender(){
    fclose(m_filePtr);
}

void FileAppender::flush(){
    fflush(m_filePtr);
}

void FileAppender::append(const char* logcontent, const size_t len){
    // 发送的数据
    size_t hasSend = write(logcontent, len);
    // 剩余需要发送的数目
    size_t remainToSend = len - hasSend;
    while(remainToSend > 0){
        int n = write(logcontent + hasSend, remainToSend);
        // 发送数量为零有可能是数据都发送完毕，也有可能是出现了错误
        if(n == 0){
            // 检查文件流的错误
            int err = ferror(m_filePtr);
            if(err){
                // 出现错误err = 1，输出提示
                fprintf(stderr, "Appender::append() failed!\n ");
                break;
            }
            hasSend += n;
            remainToSend = len - hasSend;
        }
    }
}

size_t FileAppender::write(const char* logcontent, const size_t len){
    return fwrite_unlocked(logcontent, sizeof(char), len, m_filePtr);
}

}
