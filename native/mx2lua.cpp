/*
The MIT License (MIT)

Copyright (c) 2016 Shane Woolcock

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
#ifndef _MX2LUA_CPP_
#define _MX2LUA_CPP_

#include <memory>

#include "mx2lua.h"

void *mx2lua_pushuserdata(lua_State *L, void *ud, int size) {
  void *ptr = lua_newuserdata(L, (size_t)size);
  memcpy(ptr, ud, (size_t)size);
  return ptr;
}

bool mx2lua_checkstack(lua_State *L, int n) {
  return lua_checkstack(L, n) != 0;
}

bool mx2lua_compare(lua_State *L, int index1, int index2, int op) {
  return lua_compare(L, index1, index2, op) != 0;
}

int mx2lua_geti(lua_State *L, int index, int i) {
  return lua_geti(L, index, (lua_Integer)i);
}

int mx2lua_getfield(lua_State *L, int index, bbString k) {
  return lua_getfield(L, index, k.c_str());
}

int mx2lua_getglobal(lua_State *L, bbString name) {
  return lua_getglobal(L, name.c_str());
}

bool mx2lua_getmetatable(lua_State *L, int index) {
  return lua_getmetatable(L, index) != 0;
}

bool mx2lua_isboolean(lua_State *L, int index) {
  return lua_isboolean(L, index) != 0;
}

bool mx2lua_iscfunction(lua_State *L, int index) {
  return lua_iscfunction(L, index) != 0;
}

bool mx2lua_isfunction(lua_State *L, int index) {
  return lua_isfunction(L, index) != 0;
}

bool mx2lua_isinteger(lua_State *L, int index) {
  return lua_isinteger(L, index) != 0;
}

bool mx2lua_islightuserdata(lua_State *L, int index) {
  return lua_islightuserdata(L, index) != 0;
}

bool mx2lua_isnil(lua_State *L, int index) {
  return lua_isnil(L, index) != 0;
}

bool mx2lua_isnone(lua_State *L, int index) {
  return lua_isnone(L, index) != 0;
}

bool mx2lua_isnoneornil(lua_State *L, int index) {
  return lua_isnoneornil(L, index) != 0;
}

bool mx2lua_isnumber(lua_State *L, int index) {
  return lua_isnumber(L, index) != 0;
}

bool mx2lua_isstring(lua_State *L, int index) {
  return lua_isstring(L, index) != 0;
}

bool mx2lua_istable(lua_State *L, int index) {
  return lua_istable(L, index) != 0;
}

bool mx2lua_isthread(lua_State *L, int index) {
  return lua_isthread(L, index) != 0;
}

bool mx2lua_isuserdata(lua_State *L, int index) {
  return lua_isuserdata(L, index) != 0;
}

bool mx2lua_isyieldable(lua_State *L) {
  return lua_isyieldable(L) != 0;
}

bool mx2lua_numbertointeger(float n, int *i) {
  lua_Integer li = 0;
  int rv = lua_numbertointeger((lua_Number)n, &li);
  *i = (int)li;
  return rv != 0;
}

void mx2lua_pushboolean(lua_State *L, bool b) {
  lua_pushboolean(L, b ? 1 : 0);
}

void mx2lua_pushinteger(lua_State *L, int n) {
  lua_pushinteger(L, (lua_Integer)n);
}

bbString mx2lua_pushlstring(lua_State *L, bbString s, int len) {
  const char *rv = lua_pushlstring(L, s.c_str(), (size_t)len);
  if (rv == NULL) return bbString();
  return bbString(rv);
}

void mx2lua_pushnumber(lua_State *L, float n) {
  lua_pushnumber(L, (lua_Number)n);
}

bbString mx2lua_pushstring(lua_State *L, bbString s) {
  const char *rv = lua_pushstring(L, s.c_str());
  if (rv == NULL) return bbString();
  return bbString(rv);
}

bool mx2lua_rawequal(lua_State *L, int index1, int index2) {
  return lua_rawequal(L, index1, index2) != 0;
}

int mx2lua_rawgeti(lua_State *L, int index, int n) {
  return lua_rawgeti(L, index, (lua_Integer)n);
}

int mx2lua_rawlen(lua_State *L, int index) {
  return (int)lua_rawlen(L, index);
}

void mx2lua_rawseti(lua_State *L, int index, int i) {
  lua_rawseti(L, index, (lua_Integer)i);
}

void mx2lua_register(lua_State *L, bbString name, lua_CFunction f) {
  lua_register(L, name.c_str(), f);
}

void mx2lua_setfield(lua_State *L, int index, bbString k) {
  lua_setfield(L, index, k.c_str());
}

void mx2lua_setglobal(lua_State *L, bbString name) {
  lua_setglobal(L, name.c_str());
}

void mx2lua_seti(lua_State *L, int index, int n) {
  lua_seti(L, index, (lua_Integer)n);
}

int mx2lua_stringtonumber(lua_State *L, bbString s) {
  return (int)lua_stringtonumber(L, s.c_str());
}

bool mx2lua_toboolean(lua_State *L, int index) {
  return lua_toboolean(L, index) != 0;
}

int mx2lua_tointeger(lua_State *L, int index) {
  return (int)lua_tointeger(L, index);
}

int mx2lua_tointegerx(lua_State *L, int index, bool *isnum) {
  int isnumint = 0;
  int rv = (int)lua_tointegerx(L, index, &isnumint);
  if (isnum != NULL) {
    *isnum = isnumint != 0;
  }
  return rv;
}

float mx2lua_tonumber(lua_State *L, int index) {
  return (float)lua_tonumber(L, index);
}

float mx2lua_tonumberx(lua_State *L, int index, bool *isnum) {
  int isnumint = 0;
  float rv = (float)lua_tonumberx(L, index, &isnumint);
  if (isnum != NULL) {
    *isnum = isnumint != 0;
  }
  return rv;
}

bbString mx2lua_tostring(lua_State *L, int index) {
  return bbString(lua_tostring(L, index));
}

float mx2lua_version(lua_State *L) {
  const lua_Number *ptr = lua_version(L);
  if (ptr != NULL) {
    return (float)(*ptr);
  }
  return 0;
}

void mx2luaL_argcheck(lua_State *L, int cond, int arg, bbString extramsg) {
  luaL_argcheck(L, cond, arg, extramsg.c_str());
}

void mx2luaL_argerror(lua_State *L, int arg, bbString extramsg) {
  luaL_argerror(L, arg, extramsg.c_str());
}

int mx2luaL_callmeta(lua_State *L, int obj, bbString e) {
  return luaL_callmeta(L, obj, e.c_str());
}

int mx2luaL_checkinteger(lua_State *L, int arg) {
  return (int)luaL_checkinteger(L, arg);
}

bbString mx2luaL_checklstring(lua_State *L, int arg, int *l) {
  size_t sz;
  const char *rv = luaL_checklstring(L, arg, &sz);
  if (l != NULL) {
    *l = (int)sz;
  }
  if (rv == NULL) return bbString();
  return bbString(rv);
}

float mx2luaL_checknumber(lua_State *L, int arg) {
  return (float)luaL_checknumber(L, arg);
}

int mx2luaL_checkoption(lua_State *L, int arg, bbString def, bbArray<bbString> lst) {
  // return luaL_checkoption(L, arg, def.c_str(), ...);
  return 0;
}

void mx2luaL_checkstack(lua_State *L, int sz, bbString msg) {
  luaL_checkstack(L, sz, msg.c_str());
}

bbString mx2luaL_checkstring(lua_State *L, int arg) {
  const char *rv = luaL_checkstring(L, arg);
  if (rv == NULL) return bbString();
  return bbString(rv);
}

void *mx2luaL_checkudata(lua_State *L, int arg, bbString tname) {
  return luaL_checkudata(L, arg, tname.c_str());
}

bool mx2luaL_dofile(lua_State *L, bbString filename) {
  return luaL_dofile(L, filename.c_str()) != 0;
}

bool mx2luaL_dostring(lua_State *L, bbString str) {
  return luaL_dostring(L, str.c_str()) != 0;
}

int mx2luaL_fileresult(lua_State *L, int stat, bbString filename) {
  return luaL_fileresult(L, stat, filename.c_str());
}

int mx2luaL_getmetafield(lua_State *L, int obj, bbString e) {
  return luaL_getmetafield(L, obj, e.c_str());
}

int mx2luaL_getmetatable(lua_State *L, bbString tname) {
  return luaL_getmetatable(L, tname.c_str());
}

bool mx2luaL_getsubtable(lua_State *L, int idx, bbString fname) {
  return luaL_getsubtable(L, idx, fname.c_str()) != 0;
}

bbString mx2luaL_gsub(lua_State *L, bbString s, bbString p, bbString r) {
  const char *rv = luaL_gsub(L, s.c_str(), p.c_str(), r.c_str());
  if (rv == NULL) return bbString();
  return bbString(rv);
}

int mx2luaL_len(lua_State *L, int index) {
  return (int)luaL_len(L, index);
}

int mx2luaL_loadfile(lua_State *L, bbString filename) {
  return luaL_loadfile(L, filename.c_str());
}

int mx2luaL_loadfilex(lua_State *L, bbString filename, bbString mode) {
  return luaL_loadfilex(L, filename.c_str(), mode.c_str());
}

int mx2luaL_loadstring(lua_State *L, bbString s) {
  return luaL_loadstring(L, s.c_str());
}

int mx2luaL_newmetatable(lua_State *L, bbString tname) {
  return luaL_newmetatable(L, tname.c_str());
}

int mx2luaL_optinteger(lua_State *L, int arg, int d) {
  return (int)luaL_optinteger(L, arg, (lua_Integer)d);
}

bbString mx2luaL_optlstring(lua_State *L, int arg, bbString d, int *l) {
  size_t sz;
  const char *rv = luaL_optlstring(L, arg, d.c_str(), &sz);
  if (l != NULL) {
    *l = (int)sz;
  }
  if (rv == NULL) return bbString();
  return bbString(rv);
}

float mx2luaL_optnumber(lua_State *L, int arg, float d) {
  return (float)luaL_optnumber(L, arg, (lua_Number)d);
}

bbString mx2luaL_optstring(lua_State *L, int arg, bbString d) {
  const char *rv = luaL_optstring(L, arg, d.c_str());
  if (rv == NULL) return bbString();
  return bbString(rv);
}

void mx2luaL_requiref(lua_State *L, bbString modname, lua_CFunction openf, int glb) {
  luaL_requiref(L, modname.c_str(), openf, glb);
}

void mx2luaL_setmetatable(lua_State *L, bbString tname) {
  luaL_setmetatable(L, tname.c_str());
}

void *mx2luaL_testudata(lua_State *L, int arg, bbString tname) {
  return luaL_testudata(L, arg, tname.c_str());
}

bbString mx2luaL_tolstring(lua_State *L, int idx, int *len) {
  size_t sz;
  const char *rv = luaL_tolstring(L, idx, &sz);
  if (len != NULL) {
    *len = (int)sz;
  }
  if (rv == NULL) return bbString();
  return bbString(rv);
}

void mx2luaL_traceback(lua_State *L, lua_State *L1, bbString msg, int level) {
  luaL_traceback(L, L1, msg.c_str(), level);
}

bbString mx2luaL_typename(lua_State *L, int index) {
  const char *rv = luaL_typename(L, index);
  if (rv == NULL) return bbString();
  return bbString(rv);
}

#endif
