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
#include "lua-5.3.3/src/lua.h"
#include "lua-5.3.3/src/lualib.h"
#include "lua-5.3.3/src/lauxlib.h"
#ifdef __cplusplus
}
#endif

#include "bbstring.h"
#include "bbarray.h"

void *mx2lua_pushuserdata(lua_State *L, void *ud, int size);
bool mx2lua_checkstack(lua_State *L, int n);
bool mx2lua_compare(lua_State *L, int index1, int index2, int op);
int mx2lua_geti(lua_State *L, int index, int i);
int mx2lua_getfield(lua_State *L, int index, bbString k);
int mx2lua_getglobal(lua_State *L, bbString name);
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
bbString mx2lua_pushlstring(lua_State *L, bbString s, int len);
void mx2lua_pushnumber(lua_State *L, float n);
bbString mx2lua_pushstring(lua_State *L, bbString s);
bool mx2lua_rawequal(lua_State *L, int index1, int index2);
int mx2lua_rawgeti(lua_State *L, int index, int n);
int mx2lua_rawlen(lua_State *L, int index);
void mx2lua_rawseti(lua_State *L, int index, int i);
void mx2lua_register(lua_State *L, bbString name, lua_CFunction f);
void mx2lua_setfield(lua_State *L, int index, bbString k);
void mx2lua_setglobal(lua_State *L, bbString name);
void mx2lua_seti(lua_State *L, int index, int n);
int mx2lua_stringtonumber(lua_State *L, bbString s);
bool mx2lua_toboolean(lua_State *L, int index);
int mx2lua_tointeger(lua_State *L, int index);
int mx2lua_tointegerx(lua_State *L, int index, bool *isnum);
bbString mx2lua_tolstring(lua_State *L, int index, int *len);
float mx2lua_tonumber(lua_State *L, int index);
float mx2lua_tonumberx(lua_State *L, int index, bool *isnum);
bbString mx2lua_tostring(lua_State *L, int index);
bbString mx2lua_typename(lua_State *L, int tp);
float mx2lua_version(lua_State *L);

void mx2luaL_argcheck(lua_State *L, int cond, int arg, bbString extramsg);
void mx2luaL_argerror(lua_State *L, int arg, bbString extramsg);
int mx2luaL_callmeta(lua_State *L, int obj, bbString e);
int mx2luaL_checkinteger(lua_State *L, int arg);
bbString mx2luaL_checklstring(lua_State *L, int arg, int *l);
float mx2luaL_checknumber(lua_State *L, int arg);
int mx2luaL_checkoption(lua_State *L, int arg, bbString def, bbArray<bbString> lst);
void mx2luaL_checkstack(lua_State *L, int sz, bbString msg);
bbString mx2luaL_checkstring(lua_State *L, int arg);
void *mx2luaL_checkudata(lua_State *L, int arg, bbString tname);
bool mx2luaL_dofile(lua_State *L, bbString filename);
bool mx2luaL_dostring(lua_State *L, bbString str);
int mx2luaL_fileresult(lua_State *L, int stat, bbString filename);
int mx2luaL_getmetafield(lua_State *L, int obj, bbString e);
int mx2luaL_getmetatable(lua_State *L, bbString tname);
bool mx2luaL_getsubtable(lua_State *L, int idx, bbString fname);
bbString mx2luaL_gsub(lua_State *L, bbString s, bbString p, bbString r);
int mx2luaL_len(lua_State *L, int index);
int mx2luaL_loadfile(lua_State *L, bbString filename);
int mx2luaL_loadfilex(lua_State *L, bbString filename, bbString mode);
int mx2luaL_loadstring(lua_State *L, bbString s);
int mx2luaL_newmetatable(lua_State *L, bbString tname);
int mx2luaL_optinteger(lua_State *L, int arg, int d);
bbString mx2luaL_optlstring(lua_State *L, int arg, bbString d, int *l);
float mx2luaL_optnumber(lua_State *L, int arg, float d);
bbString mx2luaL_optstring(lua_State *L, int arg, bbString d);
void mx2luaL_requiref(lua_State *L, bbString modname, lua_CFunction openf, int glb);
void mx2luaL_setmetatable(lua_State *L, bbString tname);
void *mx2luaL_testudata(lua_State *L, int arg, bbString tname);
bbString mx2luaL_tolstring(lua_State *L, int idx, int *len);
void mx2luaL_traceback(lua_State *L, lua_State *L1, bbString msg, int level);
bbString mx2luaL_typename(lua_State *L, int index);

#endif
