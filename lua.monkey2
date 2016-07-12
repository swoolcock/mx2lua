#Rem
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
#End

Namespace lua

#Import "api.monkey2"

#Import "native/lua-5.3.3/src/lapi.c"
#Import "native/lua-5.3.3/src/lauxlib.c"
#Import "native/lua-5.3.3/src/lbaselib.c"
#Import "native/lua-5.3.3/src/lbitlib.c"
#Import "native/lua-5.3.3/src/lcode.c"
#Import "native/lua-5.3.3/src/lcorolib.c"
#Import "native/lua-5.3.3/src/lctype.c"
#Import "native/lua-5.3.3/src/ldblib.c"
#Import "native/lua-5.3.3/src/ldebug.c"
#Import "native/lua-5.3.3/src/ldo.c"
#Import "native/lua-5.3.3/src/ldump.c"
#Import "native/lua-5.3.3/src/lfunc.c"
#Import "native/lua-5.3.3/src/lgc.c"
#Import "native/lua-5.3.3/src/linit.c"
#Import "native/lua-5.3.3/src/liolib.c"
#Import "native/lua-5.3.3/src/llex.c"
#Import "native/lua-5.3.3/src/lmathlib.c"
#Import "native/lua-5.3.3/src/lmem.c"
#Import "native/lua-5.3.3/src/loadlib.c"
#Import "native/lua-5.3.3/src/lobject.c"
#Import "native/lua-5.3.3/src/lopcodes.c"
#Import "native/lua-5.3.3/src/loslib.c"
#Import "native/lua-5.3.3/src/lparser.c"
#Import "native/lua-5.3.3/src/lstate.c"
#Import "native/lua-5.3.3/src/lstring.c"
#Import "native/lua-5.3.3/src/lstrlib.c"
#Import "native/lua-5.3.3/src/ltable.c"
#Import "native/lua-5.3.3/src/ltablib.c"
#Import "native/lua-5.3.3/src/ltm.c"
#Import "native/lua-5.3.3/src/lundump.c"
#Import "native/lua-5.3.3/src/lutf8lib.c"
#Import "native/lua-5.3.3/src/lvm.c"
#Import "native/lua-5.3.3/src/lzio.c"

#Import "native/mx2lua.h"
#Import "native/mx2lua.cpp"

Extern

' consts
Alias LuaType:Int
Const LUA_TNONE:LuaType
Const LUA_TNIL:LuaType
Const LUA_TBOOLEAN:LuaType
Const LUA_TLIGHTUSERDATA:LuaType
Const LUA_TNUMBER:LuaType
Const LUA_TSTRING:LuaType
Const LUA_TTABLE:LuaType
Const LUA_TFUNCTION:LuaType
Const LUA_TUSERDATA:LuaType
Const LUA_TTHREAD:LuaType

' types
Struct lua_Unsigned
End
Struct lua_KContext
End
Struct lua_State
End
Struct lua_Debug
End
Struct luaL_Reg
End
Struct luaL_Stream
End
Struct luaL_Buffer
End
Alias lua_Alloc:Void Ptr(ud:Void Ptr, pt:Void Ptr, osize:Int, nsize:Int)
Alias lua_CFunction:Int(L:lua_State Ptr)
Alias lua_KFunction:Int(L:lua_State Ptr, status:Int, ctx:lua_KContext)
Alias lua_Reader:Utf8String(L:lua_State Ptr, data:Void Ptr, size:Int Ptr)
Alias lua_Writer:Int(L:lua_State Ptr, p:Void Ptr, sz:Int, ud:Void Ptr)
Alias lua_Hook:Void(L:lua_State Ptr, ar:lua_Debug Ptr)

' main library
Function lua_absindex:Int(L:lua_State Ptr, idx:Int)
Function lua_arith:Void(L:lua_State Ptr, op:Int)
Function lua_atpanic:lua_CFunction(L:lua_State Ptr, panicf:lua_CFunction)
Function lua_call:Void(L:lua_State Ptr, nargs:Int, nresults:Int)
Function lua_callk:Void(L:lua_State Ptr, nargs:Int, nresults:Int, ctx:lua_KContext, k:lua_KFunction)
Function lua_close:Void(L:lua_State Ptr)
Function lua_checkstack:Bool(L:lua_State Ptr, n:Int) = "mx2lua_checkstack"
Function lua_compare:Bool(L:lua_State Ptr, index1:Int, index2:Int, op:Int) = "mx2lua_compare"
Function lua_concat:Void(L:lua_State Ptr, n:Int)
Function lua_copy:Void(L:lua_State Ptr, fromidx:Int, toidx:Int)
Function lua_createtable:Void(L:lua_State Ptr, narr:Int, nrec:Int)
Function lua_dump:Int(L:lua_State Ptr, writer:lua_Writer, data:Void Ptr, strip:Int)
Function lua_error:Int(L:lua_State Ptr)
Function lua_gc:Int(L:lua_State Ptr, what:Int, data:Int)
Function lua_getallocf:lua_Alloc(L:lua_State Ptr, ud:Void Ptr Ptr)
Function lua_getfield:Int(L:lua_State Ptr, index:Int, k:String) = "mx2lua_getfield"
Function lua_getextraspace:Void Ptr(L:lua_State Ptr)
Function lua_getglobal:Int(L:lua_State Ptr, name:String) = "mx2lua_getglobal"
Function lua_geti:Int(L:lua_State Ptr, index:Int, i:Int) = "mx2lua_geti"
Function lua_getmetatable:Bool(L:lua_State Ptr, index:Int) = "mx2lua_getmetatable"
Function lua_gettable:Int(L:lua_State Ptr, index:Int)
Function lua_gettop:Int(L:lua_State Ptr)
Function lua_getuservalue:Int(L:lua_State Ptr, index:Int)
Function lua_insert:Void(L:lua_State Ptr, index:Int)
Function lua_isboolean:Bool(L:lua_State Ptr, index:Int) = "mx2lua_isboolean"
Function lua_iscfunction:Bool(L:lua_State Ptr, index:Int) = "mx2lua_iscfunction"
Function lua_isfunction:Bool(L:lua_State Ptr, index:Int) = "mx2lua_isfunction"
Function lua_isinteger:Bool(L:lua_State Ptr, index:Int) = "mx2lua_isinteger"
Function lua_islightuserdata:Bool(L:lua_State Ptr, index:Int) = "mx2lua_islightuserdata"
Function lua_isnil:Bool(L:lua_State Ptr, index:Int) = "mx2lua_isnil"
Function lua_isnone:Bool(L:lua_State Ptr, index:Int) = "mx2lua_isnone"
Function lua_isnoneornil:Bool(L:lua_State Ptr, index:Int) = "mx2lua_isnoneornil"
Function lua_isnumber:Bool(L:lua_State Ptr, index:Int) = "mx2lua_isnumber"
Function lua_isstring:Bool(L:lua_State Ptr, index:Int) = "mx2lua_isstring"
Function lua_istable:Bool(L:lua_State Ptr, index:Int) = "mx2lua_istable"
Function lua_isthread:Bool(L:lua_State Ptr, index:Int) = "mx2lua_isthread"
Function lua_isuserdata:Bool(L:lua_State Ptr, index:Int) = "mx2lua_isuserdata"
Function lua_isyieldable:Bool(L:lua_State Ptr) = "mx2lua_isyieldable"
Function lua_len:Void(L:lua_State Ptr, index:Int)
'Function lua_load:Int(L:lua_State Ptr, reader:lua_Reader, data:Void Ptr, chunkname:Utf8String, mode:Utf8String)
Function lua_newstate:lua_State Ptr(f:lua_Alloc, ud:Void Ptr)
Function lua_newtable:Void(L:lua_State Ptr)
Function lua_newthread:lua_State Ptr(L:lua_State Ptr)
Function lua_newuserdata:Void Ptr(L:lua_State Ptr, size:Int)
Function lua_next:Int(L:lua_State Ptr, index:Int)
Function lua_numbertointeger:Int(n:Float, i:Int Ptr) = "mx2lua_numbertointeger"
Function lua_pcall:Int(L:lua_State Ptr, nargs:Int, nresults:Int, msgh:Int)
Function lua_pcallk:Int(L:lua_State Ptr, nargs:Int, nresults:Int, msgh:Int, ctx:lua_KContext, k:lua_KFunction)
Function lua_pop:Void(L:lua_State Ptr, n:Int)
Function lua_pushboolean:Void(L:lua_State Ptr, b:Bool) = "mx2lua_pushboolean"
Function lua_pushcclosure:Void(L:lua_State Ptr, fn:lua_CFunction, n:Int)
Function lua_pushcfunction:Void(L:lua_State Ptr, f:lua_CFunction)
'varargs lua_pushfstring
Function lua_pushglobaltable:Void(L:lua_State Ptr)
Function lua_pushinteger:Void(L:lua_State Ptr, n:Int) = "mx2lua_pushinteger"
Function lua_pushlightuserdata:Void(L:lua_State Ptr, p:Void Ptr)
Function lua_pushlstring:String(L:lua_State Ptr, s:String, len:Int) = "mx2lua_pushlstring"
Function lua_pushnil:Void(L:lua_State Ptr)
Function lua_pushnumber:Void(L:lua_State Ptr, n:Float) = "mx2lua_pushnumber"
Function lua_pushstring:String(L:lua_State Ptr, s:String) = "mx2lua_pushstring"
Function lua_pushthread:Int(L:lua_State Ptr)
Function lua_pushvalue:Void(L:lua_State Ptr, index:Int)
'va_list lua_pushvfstring
Function lua_rawequal:Bool(L:lua_State Ptr, index1:Int, index2:Int) = "mx2lua_rawequal"
Function lua_rawget:Int(L:lua_State Ptr, index:Int)
Function lua_rawgeti:Int(L:lua_State Ptr, index:Int, n:Int) = "mx2lua_rawgeti"
Function lua_rawgetp:Int(L:lua_State Ptr, index:Int, p:Void Ptr)
Function lua_rawlen:Int(L:lua_State Ptr, index:Int) = "mx2lua_rawlen"
Function lua_rawset:Void(L:lua_State Ptr, index:Int)
Function lua_rawseti:Void(L:lua_State Ptr, index:Int, i:Int) = "mx2lua_rawseti"
Function lua_rawsetp:Void(L:lua_State Ptr, index:Int, p:Void Ptr)
Function lua_register:Void(L:lua_State Ptr, name:String, f:lua_CFunction) = "mx2lua_register"
Function lua_remove:Void(L:lua_State Ptr, index:Int)
Function lua_replace:Void(L:lua_State Ptr, index:Int)
Function lua_resume:Int(L:lua_State Ptr, from:lua_State Ptr, nargs:Int)
Function lua_rotate:Void(L:lua_State Ptr, idx:Int, n:Int)
Function lua_setallocf:Void(L:lua_State Ptr, f:lua_Alloc, ud:Void Ptr)
Function lua_setfield:Void(L:lua_State Ptr, index:Int, k:String) = "mx2lua_setfield"
Function lua_setglobal:Void(L:lua_State Ptr, name:String) = "mx2lua_setglobal"
Function lua_seti:Void(L:lua_State Ptr, index:Int, n:Int) = "mx2lua_seti"
Function lua_setmetatable:Void(L:lua_State Ptr, index:Int)
Function lua_settable:Void(L:lua_State Ptr, index:Int)
Function lua_settop:Void(L:lua_State Ptr, index:Int)
Function lua_setuservalue:Void(L:lua_State Ptr, index:Int)
Function lua_status:Void(L:lua_State Ptr)
Function lua_stringtonumber:Int(L:lua_State Ptr, s:String) = "mx2lua_stringtonumber"
Function lua_toboolean:Bool(L:lua_State Ptr, index:Int) = "mx2lua_toboolean"
Function lua_tocfunction:lua_CFunction(L:lua_State Ptr, index:Int)
Function lua_tointeger:Int(L:lua_State Ptr, index:Int) = "mx2lua_tointeger"
Function lua_tointegerx:Int(L:lua_State Ptr, index:Int, isnum:Bool Ptr) = "mx2lua_tointegerx"
Function lua_tolstring:String(L:lua_State Ptr, index:Int, len:Int Ptr) = "mx2lua_tolstring"
Function lua_tonumber:Float(L:lua_State Ptr, index:Int) = "mx2lua_tonumber"
Function lua_tonumberx:Float(L:lua_State Ptr, index:Int, isnum:Bool Ptr) = "mx2lua_tonumberx"
Function lua_topointer:Void Ptr(L:lua_State Ptr, index:Int)
Function lua_tostring:String(L:lua_State Ptr, index:Int) = "mx2lua_tostring"
Function lua_tothread:lua_State Ptr(L:lua_State Ptr, index:Int)
Function lua_touserdata:Void Ptr(L:lua_State Ptr, index:Int)
Function lua_type:Int(L:lua_State Ptr, index:Int)
Function lua_typename:String(L:lua_State Ptr, tp:Int) = "mx2lua_typename"
Function lua_upvalueindex:Int(i:Int)
Function lua_version:Float(L:lua_State Ptr) = "mx2lua_version"
Function lua_xmove:Void(from:lua_State Ptr, _to:lua_State Ptr, n:Int)
Function lua_yield:Int(L:lua_State Ptr, nresults:Int)
Function lua_yieldk:Int(L:lua_State Ptr, nresults:Int, ctx:lua_KContext, k:lua_KFunction)

' debug interface
'Function lua_gethook:lua_Hook(L:lua_State Ptr)
'Function lua_gethookcount:Int(L:lua_State Ptr)
'Function lua_gethookmask:Int(L:lua_State Ptr)
'Function lua_getinfo:Int(L:lua_State Ptr, what:Utf8String, ar:lua_Debug Ptr)
'Function lua_getlocal:Utf8String(L:lua_State Ptr, ar:lua_Debug Ptr, n:Int)
'Function lua_getstack:Int(L:lua_State Ptr, level:Int, ar:lua_Debug Ptr)
'Function lua_getupvalue:Utf8String(L:lua_State Ptr, funcindex:Int, n:Int)
'Function lua_sethook:Void(L:lua_State Ptr, f:lua_Hook, mask:Int, count:Int)
'Function lua_setlocal:Utf8String(L:lua_State Ptr, ar:lua_Debug Ptr, n:Int)
'Function lua_setupvalue:Utf8String(L:lua_State Ptr, funcindex:Int, n:Int)
'Function lua_upvalueid:Void Ptr(L:lua_State Ptr, funcindex:Int, n:Int)
'Function lua_upvaluejoin:Void(L:lua_State Ptr, funcindex1:Int, n1:Int, funcindex2:Int, n2:Int)

' auxiliary library
'Function luaL_addchar:Void(B:luaL_Buffer Ptr, c:Int)
'Function luaL_addlstring:Void(B:luaL_Buffer Ptr, s:Utf8String, l:Int)
'Function luaL_addsize:Void(B:luaL_Buffer Ptr, n:Int)
'Function luaL_addstring:Void(B:luaL_Buffer Ptr, s:Utf8String)
'Function luaL_addvalue:Void(B:luaL_Buffer Ptr)
Function luaL_argcheck:Void(L:lua_State Ptr, cond:Int, arg:Int, extramsg:String) = "mx2luaL_argcheck"
Function luaL_argerror:Void(L:lua_State Ptr, arg:Int, extramsg:String) = "mx2luaL_argerror"
'Function luaL_buffinit:Void(L:lua_State Ptr, B:luaL_Buffer Ptr)
'Function luaL_buffinitsize:Int Ptr(L:lua_State Ptr, B:luaL_Buffer Ptr, sz:Int)
Function luaL_callmeta:Int(L:lua_State Ptr, obj:Int, e:String) = "mx2luaL_callmeta"
Function luaL_checkany:Void(L:lua_State Ptr, arg:Int)
Function luaL_checkinteger:Int(L:lua_State Ptr, arg:Int) = "mx2luaL_checkinteger"
Function luaL_checklstring:String(L:lua_State Ptr, arg:Int, l:Int Ptr) = "mx2luaL_checklstring"
Function luaL_checknumber:Float(L:lua_State Ptr, arg:Int) = "mx2luaL_checknumber"
Function luaL_checkoption:Int(L:lua_State Ptr, arg:Int, def:String, lst:String[]) = "mx2luaL_checkoption"
Function luaL_checkstack:Void(L:lua_State Ptr, sz:Int, msg:String) = "mx2luaL_checkstack"
Function luaL_checkstring:String(L:lua_State Ptr, arg:Int) = "mx2luaL_checkstring"
Function luaL_checktype:Void(L:lua_State Ptr, arg:Int, t:Int)
Function luaL_checkudata:Void Ptr(L:lua_State Ptr, arg:Int, tname:String) = "mx2luaL_checkudata"
Function luaL_checkversion:Void(L:lua_State Ptr)
Function luaL_dofile:Bool(L:lua_State Ptr, filename:String) = "mx2luaL_dofile"
Function luaL_dostring:Bool(L:lua_State Ptr, str:String) = "mx2luaL_dostring"
'varargs Function luaL_error:Int(L:lua_State Ptr, )
Function luaL_execresult:Int(L:lua_State Ptr, stat:Int)
Function luaL_fileresult:Int(L:lua_State Ptr, stat:Int, filename:String) = "mx2luaL_fileresult"
Function luaL_getmetafield:Int(L:lua_State Ptr, obj:Int, e:String) = "mx2luaL_getmetafield"
Function luaL_getmetatable:Int(L:lua_State Ptr, tname:String) = "mx2luaL_getmetatable"
Function luaL_getsubtable:Bool(L:lua_State Ptr, idx:Int, fname:String) = "mx2luaL_getsubtable"
Function luaL_gsub:String(L:lua_State Ptr, s:String, p:String, r:String) = "mx2luaL_gsub"
Function luaL_len:Int(L:lua_State Ptr, index:Int) = "mx2luaL_len"
'Function luaL_loadbuffer:Int(L:lua_State Ptr, buff:Utf8String, sz:Int, name:Utf8String)
'Function luaL_loadbufferx:Int(L:lua_State Ptr, buff:Utf8String, sz:Int, name:Utf8String, mode:Utf8String)
Function luaL_loadfile:Int(L:lua_State Ptr, filename:String) = "mx2luaL_loadfile"
Function luaL_loadfilex:Int(L:lua_State Ptr, filename:String, mode:String) = "mx2luaL_loadfilex"
Function luaL_loadstring:Int(L:lua_State Ptr, s:String) = "mx2luaL_loadstring"
Function luaL_newlib:Void(L:lua_State Ptr, l:luaL_Reg[])
Function luaL_newlibtable:Void(L:lua_State Ptr, l:luaL_Reg[])
Function luaL_newmetatable:Int(L:lua_State Ptr, tname:String) = "mx2luaL_newmetatable"
Function luaL_newstate:lua_State Ptr()
Function luaL_openlibs:Void(L:lua_State Ptr)
'macro Function luaL_opt
Function luaL_optinteger:Int(L:lua_State Ptr, arg:Int, d:Int) = "mx2luaL_optinteger"
Function luaL_optlstring:String(L:lua_State Ptr, arg:Int, d:String, l:Int Ptr) = "mx2luaL_optlstring"
Function luaL_optnumber:Float(L:lua_State Ptr, arg:Int, d:Float) = "mx2luaL_optnumber"
Function luaL_optstring:String(L:lua_State Ptr, arg:Int, d:String) = "mx2luaL_optstring"
Function luaL_prepbuffer:Int Ptr(B:luaL_Buffer Ptr)
Function luaL_prepbuffsize:Int Ptr(B:luaL_Buffer Ptr, sz:Int)
Function luaL_pushresult:Void(B:luaL_Buffer Ptr)
Function luaL_pushresultsize:Void(B:luaL_Buffer Ptr, sz:Int)
Function luaL_ref:Int(L:lua_State Ptr, t:Int)
Function luaL_requiref:Void(L:lua_State Ptr, modname:String, openf:lua_CFunction, glb:Int) = "mx2luaL_requiref"
Function luaL_setfuncs:Void(L:lua_State Ptr, l:luaL_Reg Ptr, nup:Int)
Function luaL_setmetatable:Void(L:lua_State Ptr, tname:String) = "mx2luaL_setmetatable"
Function luaL_testudata:Void Ptr(L:lua_State Ptr, arg:Int, tname:String) = "mx2luaL_testudata"
Function luaL_tolstring:String(L:lua_State Ptr, idx:Int, len:Int Ptr) = "mx2luaL_tolstring"
Function luaL_traceback:Void(L:lua_State Ptr, L1:lua_State Ptr, msg:String, level:Int) = "mx2luaL_traceback"
Function luaL_typename:String(L:lua_State Ptr, index:Int) = "mx2luaL_typename"
Function luaL_unref:Void(L:lua_State Ptr, t:Int, ref:Int)
Function luaL_where:Void(L:lua_State Ptr, lvl:Int)

Function mx2lua_pushuserdata:Void Ptr(L:lua_State Ptr, pointer:Void Ptr, size:Int)
