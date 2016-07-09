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
#ifndef _MX2LUA_H_
#define _MX2LUA_H_

#ifdef __cplusplus
extern "C" {
#endif
#include "luadist/src/lua.h"
#include "luadist/src/lualib.h"
#include "luadist/src/lauxlib.h"
#ifdef __cplusplus
}
#endif

void *mx2lua_pushuserdata(lua_State *L, void *ud, int size);
bool mx2lua_checkstack(lua_State *L, int n);
bool mx2lua_compare(lua_State *L, int index1, int index2, int op);
int mx2lua_geti(lua_State *L, int index, int i);
bool mx2lua_getmetatable(lua_State *L, int index);
bool mx2lua_isboolean(lua_State *L, int index);
bool mx2lua_iscfunction(lua_State *L, int index);
bool mx2lua_isfunction(lua_State *L, int index);
bool mx2lua_isinteger(lua_State *L, int index);
bool mx2lua_islightuserdata(lua_State *L, int index);
bool mx2lua_isnil(lua_State *L, int index);
bool mx2lua_isnone(lua_State *L, int index);
bool mx2lua_isnoneornil(lua_State *L, int index);
bool mx2lua_isnumber(lua_State *L, int index);
bool mx2lua_isstring(lua_State *L, int index);
bool mx2lua_istable(lua_State *L, int index);
bool mx2lua_isthread(lua_State *L, int index);
bool mx2lua_isuserdata(lua_State *L, int index);
bool mx2lua_isyieldable(lua_State *L);
bool mx2lua_numbertointeger(float n, int *i);
void mx2lua_pushboolean(lua_State *L, bool b);
void mx2lua_pushinteger(lua_State *L, int n);
const char *mx2lua_pushlstring(lua_State *L, const char *s, int len);
void mx2lua_pushnumber(lua_State *L, float n);
bool mx2lua_rawequal(lua_State *L, int index1, int index2);
int mx2lua_rawgeti(lua_State *L, int index, int n);
int mx2lua_rawlen(lua_State *L, int index);
void mx2lua_rawseti(lua_State *L, int index, int i);
void mx2lua_seti(lua_State *L, int index, int n);
int mx2lua_stringtonumber(lua_State *L, const char *s);
bool mx2lua_toboolean(lua_State *L, int index);
int mx2lua_tointeger(lua_State *L, int index);
int mx2lua_tointegerx(lua_State *L, int index, bool *isnum);
float mx2lua_tonumber(lua_State *L, int index);
float mx2lua_tonumberx(lua_State *L, int index, int *isnum);
float mx2lua_version(lua_State *L);
int mx2luaL_checkinteger(lua_State *L, int arg);
const char *mx2luaL_checklstring(lua_State *L, int arg, int *l);
float mx2luaL_checknumber(lua_State *L, int arg);

// int mx2luaL_checkoption(lua_State *L, int arg, const char *def, BBArray<const char *>) {
// }

bool mx2luaL_dofile(lua_State *L, const char *filename);
bool mx2luaL_dostring(lua_State *L, const char *str);
bool mx2luaL_getsubtable(lua_State *L, int idx, const char *fname);
int mx2luaL_len(lua_State *L, int index);
int mx2luaL_optinteger(lua_State *L, int arg, int d);
float mx2luaL_optnumber(lua_State *L, int arg, float d);
const char *mx2luaL_tolstring(lua_State *L, int idx, int *len);

#endif
