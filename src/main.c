#include <stdio.h>

#include "logger.h"

#include "init.h"
#include "parser.h"

int main(int argc, char* argv[])
{
    mgitcmd_t cmd = parse(argc, argv);
    LOG_DEBUG("Parsed command: %s", cmd.name);

    init();

    return 0;
}
