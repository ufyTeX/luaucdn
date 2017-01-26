#include "ucdn.h"

#include <stdint.h>

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

int get_unicode_version(lua_State *L) {
  lua_pushstring(L, ucdn_get_unicode_version());
  return 1;
}

int get_bidi_class(lua_State *L) {
  uint32_t c = lua_tointeger(L, 1);
  lua_pushinteger(L, ucdn_get_bidi_class(c));
  return 1;
}

int paired_bracket_type(lua_State *L) {
  uint32_t c = lua_tointeger(L, 1);
  lua_pushinteger(L, ucdn_paired_bracket_type(c));
  return 1;
}

int paired_bracket(lua_State *L) {
  uint32_t c = lua_tointeger(L, 1);
  lua_pushinteger(L, ucdn_paired_bracket(c));
  return 1;
}

int compat_decompose(lua_State *L) {
  uint32_t c = lua_tointeger(L, 1);

  uint32_t decomposed[18];
  unsigned int len = ucdn_compat_decompose(c, decomposed);

  lua_newtable(L);
  unsigned int i;
  for (i = 0; i < len; i++) {
    lua_pushinteger(L, i+1);
    lua_pushinteger(L, decomposed[i]);
    lua_settable(L,-3);
  }

  return 1;
}

static const struct luaL_Reg lib_table [] = {
  {"get_unicode_version", get_unicode_version},
  {"get_bidi_class", get_bidi_class},
  {"paired_bracket_type", paired_bracket_type},
  {"paired_bracket", paired_bracket},
  {"compat_decompose", compat_decompose},
  {NULL, NULL}
};

int luaopen_luaucdn (lua_State *L) {
  lua_newtable(L);
  luaL_setfuncs(L, lib_table,0);

  return 1;
}

