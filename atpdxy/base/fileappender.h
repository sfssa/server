#pragma once
#include <string>
#include "./noncopyable.h"

namespace atpdxy{

// 缓冲区大小
const size_t BUF_LENGTH = 65536;

class FileAppender : public Noncopyable
{
public:
    // 构造函数：filename-打开的文件
    FileAppender(const std::string& filename);
    // 析构函数
    ~FileAppender();
    // 向日志文件中追加日志函数：logline-指向待追加日志内容的指针；len-追加的日志内容长度
    void append(const char* logcontent, const size_t len);
    // 将缓冲区内日志输出到文件中的刷新函数：
    void flush();
private:
    // 实际执行向文件写入数据的操作：logcontent-指向待追加日志内容的指针；len-追加的日志内容的长度
    size_t write(const char* logcontent, const size_t len);
private:
    // 指向日志文件的指针
    FILE* m_filePtr;
    // 存储日志的缓冲区
    char m_buffer[BUF_LENGTH];
};

}
