CFLAGS = -O2 -fpic -std=c99 `pkg-config --cflags lua`

# Guide to building Lua Modules: http://lua-users.org/wiki/BuildingModules
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
    LIBFLAGS = -bundle -undefined dynamic_lookup -all_load
else
    LIBFLAGS = -shared
endif

# For compatibility with Luarocks
INST_PREFIX = /usr/local
INST_LIBDIR = $(INST_PREFIX)/lib/lua/5.2
INST_LUADIR = $(INST_PREFIX)/share/lua/5.2

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

# For use with Luarocks
install: luaucdn.so src/ucdn.lua
	cp luaucdn.so $(INST_LIBDIR)
	cp src/ucdn.lua $(INST_LUADIR)

.PHONY: all clean test dirs install lint spec doc
