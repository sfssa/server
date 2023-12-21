#include <iostream>
#include "../atpdxy/base/utils.h"
#include "../atpdxy/base/macro.h"

void testAssert(){
    // ATPDXY_ASSERT(false);
    ATPDXY_ASSERT2(false, "hello world");
}

void testBacktrace(){
    std::cout << atpdxy::BacktraceToString();
}

int main()
{
    testBacktrace();
    testAssert();
    return 0;
}

