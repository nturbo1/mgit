#include "logger.h"

#include <stdio.h>
#include <stdarg.h>
#include <assert.h>

#ifdef DEBUG
loglvl_t g_loglvl = LOG_LEVEL_DEBUG;
#else
loglvl_t g_loglvl = LOG_LEVEL_INFO;
#endif

const char* lvl_name(loglvl_t lvl)
{
    switch (lvl)
    {
        case LOG_LEVEL_DEBUG:
            return "DEBUG";
        case LOG_LEVEL_INFO:
            return "INFO";
        case LOG_LEVEL_WARN:
            return "WARN";
        case LOG_LEVEL_ERROR:
            return "ERROR";
        case LOG_LEVEL_FATAL:
            return "FATAL";
        case LOG_LEVEL_FIXME:
            return "FIXME";
        default:
            return NULL;
    }
}

void log_write(loglvl_t lvl, const char* file, int line, const char* fmt, ...)
{
    if (lvl < g_loglvl)
    {
        return;
    }

    const char* lvlname = lvl_name(lvl);
    assert(lvlname && "Wrong lvlname passed");

    va_list args;
    va_start(args, fmt);

    fprintf(stderr, "[%s] %s:%d: ", lvlname, file, line);
    vfprintf(stderr, fmt, args);
    fprintf(stderr, "\n");

    va_end(args);
}
