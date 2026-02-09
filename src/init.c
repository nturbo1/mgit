#include "init.h"

#include "file.h"
#include "logger.h"

#include <stddef.h>

int init()
{
    int ret = mkdir_p(".mgit", 0755);
    if (ret != 0)
    {
        LOG_ERROR("Failed to create '.git' directory", NULL);
    }

    return ret;
}
