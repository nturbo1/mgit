#include "parser.h"
#include "logger.h"

#include <stdio.h>
#include <stddef.h>

mgitcmd_t parse(int argc, char* argv[])
{
    if (argc < 2)
    {
        LOG_FIXME("Print out a help text", NULL);
    }

    mgitcmd_t cmd = {.name = argv[1]};

    return cmd;
}
