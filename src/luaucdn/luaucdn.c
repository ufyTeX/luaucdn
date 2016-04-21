#include "ucdn.h"

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

static const struct luaL_Reg lib_table [] = {
  {NULL, NULL}
};

int luaopen_luaucdn (lua_State *L) {
  lua_newtable(L);
  luaL_setfuncs(L, lib_table,0);

  return 1;
}

