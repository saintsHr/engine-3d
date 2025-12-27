# ====================================================
# Variables
# ====================================================
SRC := $(shell find src -name "*.c")
OBJ := $(patsubst src/%.c,build/%.o,$(SRC))
DEP := $(OBJ:.o=.d)

CC := gcc
AR := ar
RM := rm -rf

INCLUDE := -Iinclude -Iglfw

DEPFLAGS := -MMD -MP
CFLAGS := $(INCLUDE) -Wall -Wextra $(DEPFLAGS)
RELEASEFLAGS := $(INCLUDE) -O3 $(DEPFLAGS)

TARGET := solus
LIB := lib/lib$(TARGET).a

# ====================================================
# Main Rules
# ====================================================
.PHONY: all release clean

all: $(LIB)

release: CFLAGS := $(RELEASEFLAGS)
release: $(LIB)

# ====================================================
# Library
# ====================================================
$(LIB): $(OBJ)
	@mkdir -p lib
	$(AR) rcs $@ $(OBJ)

# ====================================================
# Object Compiling
# ====================================================
build/%.o: src/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# ====================================================
# Automatic Dependencies
# ====================================================
-include $(DEP)

# ====================================================
# Cleaning
# ====================================================
clean:
	$(RM) build lib