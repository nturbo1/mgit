#include <stdio.h>
#include "logger.h"

int main(int argc, char* argv[])
{
    printf("argc: %d\n", argc);
    printf("argv[0]: %s\n", argv[0]);

    LOG_FIXME("Logging fixme!", NULL);
    LOG_DEBUG("Logging debug!", NULL);
    LOG_INFO("Logging info!", NULL);
    LOG_WARN("Logging warn!", NULL);
    LOG_ERROR("Logging error!", NULL);
    LOG_FATAL("Logging fatal!", NULL);

    return 0;
}
