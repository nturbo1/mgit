#include "file.h"

#include <stdio.h>
#include <stddef.h>
#include <sys/types.h>
#include <linux/limits.h>
#include <string.h>
#include <errno.h>
#include <sys/stat.h>

int mkdir_p(const char* dirpath, mode_t mode)
{
    char tmp[PATH_MAX];
    char* p = NULL;
    size_t len;

    snprintf(tmp, sizeof(tmp), "%s", dirpath);
    len = strlen(tmp);

    if (tmp[len - 1] == '/')
    {
        tmp[len - 1] = '\0';
    }

    for (p = tmp + 1; *p; p++)
    {
        if (*p == '/')
        {
            *p = '\0';
            if (mkdir(dirpath, mode) == -1 && errno != EEXIST)
            {
                return -1;
            }
            *p = '/';
        }
    }

    if (mkdir(dirpath, mode) == -1 && errno != EEXIST)
    {
        return -1;
    }

    return 0;
}
