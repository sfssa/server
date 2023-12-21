#include "../atpdxy/base/fileappender.h"
#include <iostream>
#include <string.h>

void testFileAppender(){
    atpdxy::FileAppender appender("log.txt");
    const char* data = "hello world";
    size_t len = strlen(data);
    appender.append(data, len);
    appender.flush();
}

int main()
{
    testFileAppender();
    return 0;
}

