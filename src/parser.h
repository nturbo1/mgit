#ifndef SRC_PARSER_H
#define SRC_PARSER_H

struct mgitcmd
{
    char* name;
};
typedef struct mgitcmd mgitcmd_t;

mgitcmd_t parse(int argc, char* argv[]);

#endif
