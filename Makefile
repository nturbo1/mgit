CC := gcc

CFLAGS := -std=c17 -Wall -Wextra -Werror -Wpedantic
CFLAGS += -Wshadow

DEBUG_FLAGS := -O0 -g3 -DDEBUG -fno-omit-frame-pointer

RELEASE_FLAGS := -O2 -DNDEBUG

INCLUDES := -Isrc/include

SRC_DIR := src
BUILD_DIR := build
BUILD_DEBUG_DIR := $(BUILD_DIR)/debug
BUILD_RELEASE_DIR := $(BUILD_DIR)/release

SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ_DEBUG := $(SRC:$(SRC_DIR)/%.c=$(BUILD_DEBUG_DIR)/%.o)
OBJ_RELEASE := $(SRC:$(SRC_DIR)/%.c=$(BUILD_RELEASE_DIR)/%.o)

TARGET_DEBUG=$(BUILD_DEBUG_DIR)/mgit
TARGET_RELEASE=$(BUILD_RELEASE_DIR)/mgit

######################################### RECIPES #########################################

all: debug

debug: CFLAGS += $(DEBUG_FLAGS)
debug: $(TARGET_DEBUG)

release: CFLAGS += $(RELEASE_FLAGS)
release: $(TARGET_RELEASE)

$(TARGET_DEBUG): $(OBJ_DEBUG) | $(BUILD_DEBUG_DIR)
	$(CC) $(CFLAGS) $^ -o $@

$(TARGET_RELEASE): $(OBJ_RELEASE) | $(BUILD_RELEASE_DIR)
	$(CC) $(CFLAGS) $^ -o $@

$(BUILD_DEBUG_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DEBUG_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(BUILD_RELEASE_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_RELEASE_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DEBUG_DIR): $(BUILD_DIR)
	mkdir -p $(BUILD_DEBUG_DIR)

$(BUILD_RELEASE_DIR): $(BUILD_DIR)
	mkdir -p $(BUILD_RELEASE_DIR)

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all debug release clean build
