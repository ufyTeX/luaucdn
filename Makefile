CFLAGS = -O2 -fpic -std=c99 `pkg-config --cflags lua`

# Guide to building Lua Modules: http://lua-users.org/wiki/BuildingModules
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
    LIBFLAGS = -bundle -undefined dynamic_lookup -all_load
else
    LIBFLAGS = -shared
endif

DOCS_DIR := api
BUILD_DIR := build
C_SRC_ROOT := src/luaucdn
SOURCES := ucdn.c luaucdn.c
OBJECTS := $(SOURCES:%.c=$(BUILD_DIR)/%.o)

all: dirs luaucdn.so

luaucdn.so: $(OBJECTS)
	$(CC) $(LDFLAGS) $(LIBFLAGS) $(OBJECTS) -o $@

$(BUILD_DIR)/%.o: $(C_SRC_ROOT)/%.c
	$(CC) $(CFLAGS) -o $@ -c $<

dirs: ${BUILD_DIR}

${BUILD_DIR}:
	mkdir -p ${BUILD_DIR}

spec: all
	busted .

clean:
	rm -rf build *.so

lint:
	luacheck src spec

doc:
	ldoc -d ${DOCS_DIR}  .

.PHONY: all clean test dirs lint spec doc
