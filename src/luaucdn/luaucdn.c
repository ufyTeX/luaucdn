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
  uint32_t c = lua_tounsigned(L, 1);
  lua_pushinteger(L, ucdn_get_bidi_class(c));
  return 1;
}

int paired_bracket_type(lua_State *L) {
  uint32_t c = lua_tounsigned(L, 1);
  lua_pushinteger(L, ucdn_paired_bracket_type(c));
  return 1;
}

int paired_bracket(lua_State *L) {
  uint32_t c = lua_tounsigned(L, 1);
  lua_pushinteger(L, ucdn_paired_bracket(c));
  return 1;
}

static const struct luaL_Reg lib_table [] = {
  {"get_unicode_version", get_unicode_version},
  {"get_bidi_class", get_bidi_class},
  {"paired_bracket_type", paired_bracket_type},
  {"paired_bracket", paired_bracket},
  {NULL, NULL}
};

int luaopen_luaucdn (lua_State *L) {
  lua_newtable(L);
  luaL_setfuncs(L, lib_table,0);

  return 1;
}

