#include <stdio.h>

#include <sha1.h>

#include "logger.h"

#include "init.h"
#include "parser.h"

int main(int argc, char* argv[])
{
    mgitcmd_t cmd = parse(argc, argv);
    LOG_DEBUG("Parsed command: %s", cmd.name);

    init();

    SHA1_CTX sha1_ctx;
    SHA1Init(&sha1_ctx);

    return 0;
}
