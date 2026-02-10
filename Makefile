include make/configs.common.mk

all: debug

#################################### THIRD-PARTY LIBS ####################################
include make/sha1.mk

LIB_FLAGS := -Lsha1 -lsha1

CFLAGS += -Wshadow

INCLUDES := -Isrc/include -Isha1

SRC_DIR := src
BUILD_DIR := build
BUILD_DEBUG_DIR := $(BUILD_DIR)/debug
BUILD_RELEASE_DIR := $(BUILD_DIR)/release

SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ_DEBUG := $(SRC:$(SRC_DIR)/%.c=$(BUILD_DEBUG_DIR)/%.o)
OBJ_RELEASE := $(SRC:$(SRC_DIR)/%.c=$(BUILD_RELEASE_DIR)/%.o)

TARGET_DEBUG=$(BUILD_DEBUG_DIR)/mgit
TARGET_RELEASE=$(BUILD_RELEASE_DIR)/mgit

debug: CFLAGS += $(DEBUG_FLAGS)
debug: $(TARGET_DEBUG)

release: CFLAGS += $(RELEASE_FLAGS)
release: $(TARGET_RELEASE)

$(TARGET_DEBUG): $(OBJ_DEBUG) $(SHA1_LIB) | $(BUILD_DEBUG_DIR)
	$(CC) $(CFLAGS) $^ $(LIB_FLAGS) -o $@

$(TARGET_RELEASE): $(OBJ_RELEASE) $(SHA1_LIB) | $(BUILD_RELEASE_DIR)
	$(CC) $(CFLAGS) $^ $(LIB_FLAGS) -o $@

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
