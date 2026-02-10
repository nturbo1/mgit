CC := gcc

CFLAGS := -std=c17 -Wall -Wextra -Werror -Wpedantic

DEBUG_FLAGS := -O0 -g3 -DDEBUG -fno-omit-frame-pointer

RELEASE_FLAGS := -O2 -DNDEBUG
