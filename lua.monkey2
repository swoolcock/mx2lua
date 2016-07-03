Namespace lua

#Import "<libc>"

Using libc

#Import "lua.hpp"

#Import "luadist/src/lapi.c"
#Import "luadist/src/lauxlib.c"
#Import "luadist/src/lbaselib.c"
#Import "luadist/src/lbitlib.c"
#Import "luadist/src/lcode.c"
#Import "luadist/src/lcorolib.c"
#Import "luadist/src/lctype.c"
#Import "luadist/src/ldblib.c"
#Import "luadist/src/ldebug.c"
#Import "luadist/src/ldo.c"
#Import "luadist/src/ldump.c"
#Import "luadist/src/lfunc.c"
#Import "luadist/src/lgc.c"
#Import "luadist/src/linit.c"
#Import "luadist/src/liolib.c"
#Import "luadist/src/llex.c"
#Import "luadist/src/lmathlib.c"
#Import "luadist/src/lmem.c"
#Import "luadist/src/loadlib.c"
#Import "luadist/src/loadlib_rel.c"
#Import "luadist/src/lobject.c"
#Import "luadist/src/lopcodes.c"
#Import "luadist/src/loslib.c"
#Import "luadist/src/lparser.c"
#Import "luadist/src/lstate.c"
#Import "luadist/src/lstring.c"
#Import "luadist/src/lstrlib.c"
#Import "luadist/src/ltable.c"
#Import "luadist/src/ltablib.c"
#Import "luadist/src/ltm.c"
#Import "luadist/src/lundump.c"
#Import "luadist/src/lutf8lib.c"
#Import "luadist/src/lvm.c"
#Import "luadist/src/lzio.c"

Extern

' types
Struct lua_Integer
End
Struct lua_Number
End
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
Alias lua_Alloc:Void Ptr(ud:Void Ptr, pt:Void Ptr, osize:size_t, nsize:size_t)
Alias lua_CFunction:Int(L:lua_State Ptr)
Alias lua_KFunction:Int(L:lua_State Ptr, status:Int, ctx:lua_KContext)
Alias lua_Reader:Utf8String(L:lua_State Ptr, data:Void Ptr, size:size_t Ptr)
Alias lua_Writer:Int(L:lua_State Ptr, p:Void Ptr, sz:size_t, ud:Void Ptr)
Alias lua_Hook:Void(L:lua_State Ptr, ar:lua_Debug Ptr)

' main library
Function lua_absindex:Int(L:lua_State Ptr, idx:Int)
Function lua_arith:Void(L:lua_State Ptr, op:Int)
Function lua_atpanic:lua_CFunction(L:lua_State Ptr, panicf:lua_CFunction)
Function lua_call:Void(L:lua_State Ptr, nargs:Int, nresults:Int)
Function lua_callk:Void(L:lua_State Ptr, nargs:Int, nresults:Int, ctx:lua_KContext, k:lua_KFunction)
Function lua_close:Void(L:lua_State Ptr)
Function lua_checkstack:Int(L:lua_State Ptr, n:Int)
Function lua_compare:Int(L:lua_State Ptr, index1:Int, index2:Int, op:Int)
Function lua_concat:Void(L:lua_State Ptr, n:Int)
Function lua_copy:Void(L:lua_State Ptr, fromidx:Int, toidx:Int)
Function lua_createtable:Void(L:lua_State Ptr, narr:Int, nrec:Int)
Function lua_dump:Int(L:lua_State Ptr, writer:lua_Writer, data:Void Ptr, strip:Int)
Function lua_error:Int(L:lua_State Ptr)
Function lua_gc:Int(L:lua_State Ptr, what:Int, data:Int)
Function lua_getallocf:lua_Alloc(L:lua_State Ptr, ud:Void Ptr Ptr)
Function lua_getfield:Int(L:lua_State Ptr, index:Int, k:Utf8String)
Function lua_getextraspace:Void Ptr(L:lua_State Ptr)
Function lua_getglobal:Int(L:lua_State Ptr, name:Utf8String)
Function lua_geti:Int(L:lua_State Ptr, index:Int, i:lua_Integer)
Function lua_getmetatable:Int(L:lua_State Ptr, index:Int)
Function lua_gettable:Int(L:lua_State Ptr, index:Int)
Function lua_gettop:Int(L:lua_State Ptr)
Function lua_getuservalue:Int(L:lua_State Ptr, index:Int)
Function lua_insert:Void(L:lua_State Ptr, index:Int)
Function lua_isboolean:Int(L:lua_State Ptr, index:Int)
Function lua_iscfunction:Int(L:lua_State Ptr, index:Int)
Function lua_isfunction:Int(L:lua_State Ptr, index:Int)
Function lua_isinteger:Int(L:lua_State Ptr, index:Int)
Function lua_islightuserdata:Int(L:lua_State Ptr, index:Int)
Function lua_isnil:Int(L:lua_State Ptr, index:Int)
Function lua_isnone:Int(L:lua_State Ptr, index:Int)
Function lua_isnoneornil:Int(L:lua_State Ptr, index:Int)
Function lua_isnumber:Int(L:lua_State Ptr, index:Int)
Function lua_isstring:Int(L:lua_State Ptr, index:Int)
Function lua_istable:Int(L:lua_State Ptr, index:Int)
Function lua_isthread:Int(L:lua_State Ptr, index:Int)
Function lua_isuserdata:Int(L:lua_State Ptr, index:Int)
Function lua_isyieldable:Int(L:lua_State Ptr, index:Int)
Function lua_len:Void(L:lua_State Ptr, index:Int)
Function lua_load:Int(L:lua_State Ptr, reader:lua_Reader, data:Void Ptr, chunkname:Utf8String, mode:Utf8String)
Function lua_newstate:lua_State Ptr(f:lua_Alloc, ud:Void Ptr)
Function lua_newtable:Void(L:lua_State Ptr)
Function lua_newthread:lua_State Ptr(L:lua_State Ptr)
Function lua_newuserdata:Void Ptr(L:lua_State Ptr, size:size_t)
Function lua_next:Int(L:lua_State Ptr, index:Int)
Function lua_numbertointeger:Int(n:lua_Number, i:lua_Integer Ptr)
Function lua_pcall:Int(L:lua_State Ptr, nargs:Int, nresults:Int, msgh:Int)
Function lua_pcallk:Int(L:lua_State Ptr, nargs:Int, nresults:Int, msgh:Int, ctx:lua_KContext, k:lua_KFunction)
Function lua_pop:Void(L:lua_State Ptr, n:Int)
Function lua_pushboolean:Void(L:lua_State Ptr, b:Int)
Function lua_pushcclosure:Void(L:lua_State Ptr, fn:lua_CFunction, n:Int)
Function lua_pushcfunction:Void(L:lua_State Ptr, f:lua_CFunction)
'varargs lua_pushfstring
Function lua_pushglobaltable:Void(L:lua_State Ptr)
Function lua_pushinteger:Void(L:lua_State Ptr, n:lua_Integer)
Function lua_pushlightuserdata:Void(L:lua_State Ptr, p:Void Ptr)
Function lua_pushliteral:Utf8String(L:lua_State Ptr, s:Utf8String)
Function lua_pushlstring:Utf8String(L:lua_State Ptr, s:Utf8String, len:size_t)
Function lua_pushnil:Void(L:lua_State Ptr)
Function lua_pushnumber:Void(L:lua_State Ptr, n:lua_Number)
Function lua_pushstring:Utf8String(L:lua_State Ptr, s:Utf8String)
Function lua_pushthread:Int(L:lua_State Ptr)
Function lua_pushvalue:Void(L:lua_State Ptr, index:Int)
'va_list lua_pushvfstring
Function lua_rawequal:Int(L:lua_State Ptr, index1:Int, index2:Int)
Function lua_rawget:Int(L:lua_State Ptr, index:Int)
Function lua_rawgeti:Int(L:lua_State Ptr, index:Int, n:lua_Integer)
Function lua_rawgetp:Int(L:lua_State Ptr, index:Int, p:Void Ptr)
Function lua_rawlen:size_t(L:lua_State Ptr, index:Int)
Function lua_rawset:Void(L:lua_State Ptr, index:Int)
Function lua_rawseti:Void(L:lua_State Ptr, index:Int, i:lua_Integer)
Function lua_rawsetp:Void(L:lua_State Ptr, index:Int, p:Void Ptr)
Function lua_register:Void(L:lua_State Ptr, name:Utf8String, f:lua_CFunction)
Function lua_remove:Void(L:lua_State Ptr, index:Int)
Function lua_replace:Void(L:lua_State Ptr, index:Int)
Function lua_resume:Int(L:lua_State Ptr, from:lua_State Ptr, nargs:Int)
Function lua_rotate:Void(L:lua_State Ptr, idx:Int, n:Int)
Function lua_setallocf:Void(L:lua_State Ptr, f:lua_Alloc, ud:Void Ptr)
Function lua_setfield:Void(L:lua_State Ptr, index:Int, k:Utf8String)
Function lua_setglobal:Void(L:lua_State Ptr, name:Utf8String)
Function lua_seti:Void(L:lua_State Ptr, index:Int, n:lua_Integer)
Function lua_setmetatable:Void(L:lua_State Ptr, index:Int)
Function lua_settable:Void(L:lua_State Ptr, index:Int)
Function lua_settop:Void(L:lua_State Ptr, index:Int)
Function lua_setuservalue:Void(L:lua_State Ptr, index:Int)
Function lua_status:Void(L:lua_State Ptr)
Function lua_stringtonumber:size_t(L:lua_State Ptr, s:Utf8String)
Function lua_toboolean:Int(L:lua_State Ptr, index:Int)
Function lua_tocfunction:lua_CFunction(L:lua_State Ptr, index:Int)
Function lua_tointeger:lua_Integer(L:lua_State Ptr, index:Int)
Function lua_tointegerx:lua_Integer(L:lua_State Ptr, index:Int, isnum:Int Ptr)
Function lua_tolstring:Utf8String(L:lua_State Ptr, index:Int, len:size_t Ptr)
Function lua_tonumber:lua_Number(L:lua_State Ptr, index:Int)
Function lua_tonumberx:lua_Number(L:lua_State Ptr, index:Int, isnum:Int Ptr)
Function lua_topointer:Void Ptr(L:lua_State Ptr, index:Int)
Function lua_tostring:Utf8String(L:lua_State Ptr, index:Int)
Function lua_tothread:lua_State Ptr(L:lua_State Ptr, index:Int)
Function lua_touserdata:Void Ptr(L:lua_State Ptr, index:Int)
Function lua_type:Int(L:lua_State Ptr, index:Int)
Function lua_typename:Utf8String(L:lua_State Ptr, tp:Int)
Function lua_upvalueindex:Int(i:Int)
Function lua_version:lua_Number Ptr(L:lua_State Ptr)
Function lua_xmove:Void(from:lua_State Ptr, _to:lua_State Ptr, n:Int)
Function lua_yield:Int(L:lua_State Ptr, nresults:Int)
Function lua_yieldk:Int(L:lua_State Ptr, nresults:Int, ctx:lua_KContext, k:lua_KFunction)

' debug interface
Function lua_gethook:lua_Hook(L:lua_State Ptr)
Function lua_gethookcount:Int(L:lua_State Ptr)
Function lua_gethookmask:Int(L:lua_State Ptr)
Function lua_getinfo:Int(L:lua_State Ptr, what:Utf8String, ar:lua_Debug Ptr)
Function lua_getlocal:Utf8String(L:lua_State Ptr, ar:lua_Debug Ptr, n:Int)
Function lua_getstack:Int(L:lua_State Ptr, level:Int, ar:lua_Debug Ptr)
Function lua_getupvalue:Utf8String(L:lua_State Ptr, funcindex:Int, n:Int)
Function lua_sethook:Void(L:lua_State Ptr, f:lua_Hook, mask:Int, count:Int)
Function lua_setlocal:Utf8String(L:lua_State Ptr, ar:lua_Debug Ptr, n:Int)
Function lua_setupvalue:Utf8String(L:lua_State Ptr, funcindex:Int, n:Int)
Function lua_upvalueid:Void Ptr(L:lua_State Ptr, funcindex:Int, n:Int)
Function lua_upvaluejoin:Void(L:lua_State Ptr, funcindex1:Int, n1:Int, funcindex2:Int, n2:Int)

' auxilliary library
Function luaL_addchar:Void(B:luaL_Buffer Ptr, c:char_t)
Function luaL_addlstring:Void(B:luaL_Buffer Ptr, s:Utf8String, l:size_t)
Function luaL_addsize:Void(B:luaL_Buffer Ptr, n:size_t)
Function luaL_addstring:Void(B:luaL_Buffer Ptr, s:Utf8String)
Function luaL_addvalue:Void(B:luaL_Buffer Ptr)
Function luaL_argcheck:Void(L:lua_State Ptr, cond:Int, arg:Int, extramsg:Utf8String)
Function luaL_argerror:Void(L:lua_State Ptr, arg:Int, extramsg:Utf8String)
Function luaL_buffinit:Void(L:lua_State Ptr, B:luaL_Buffer Ptr)
Function luaL_buffinitsize:char_t Ptr(L:lua_State Ptr, B:luaL_Buffer Ptr, sz:size_t)
Function luaL_callmeta:Int(L:lua_State Ptr, obj:Int, e:Utf8String)
Function luaL_checkany:Void(L:lua_State Ptr, arg:Int)
Function luaL_checkinteger:lua_Integer(L:lua_State Ptr, arg:Int)
Function luaL_checklstring:Utf8String(L:lua_State Ptr, arg:Int, l:size_t Ptr)
Function luaL_checknumber:lua_Number(L:lua_State Ptr, arg:Int)
Function luaL_checkoption:Int(L:lua_State Ptr, arg:Int, def:Utf8String, lst:Utf8String[])
Function luaL_checkstack:Void(L:lua_State Ptr, sz:Int, msg:Utf8String)
Function luaL_checkstring:Utf8String(L:lua_State Ptr, arg:Int)
Function luaL_checktype:Void(L:lua_State Ptr, arg:Int, t:Int)
Function luaL_checkudata:Void Ptr(L:lua_State Ptr, arg:Int, tname:Utf8String)
Function luaL_checkversion:Void(L:lua_State Ptr)
Function luaL_dofile:Int(L:lua_State Ptr, filename:Utf8String)
Function luaL_dostring:Int(L:lua_State Ptr, str:Utf8String)
'varargs Function luaL_error:Int(L:lua_State Ptr, )
Function luaL_execresult:Int(L:lua_State Ptr, stat:Int)
Function luaL_fileresult:Int(L:lua_State Ptr, stat:Int, filename:Utf8String)
Function luaL_getmetafield:Int(L:lua_State Ptr, obj:Int, e:Utf8String)
Function luaL_getmetatable:Int(L:lua_State Ptr, tname:Utf8String)
Function luaL_getsubtable:Int(L:lua_State Ptr, idx:Int, fname:Utf8String)
Function luaL_gsub:Utf8String(L:lua_State Ptr, s:Utf8String, p:Utf8String, r:Utf8String)
Function luaL_len:lua_Integer(L:lua_State Ptr, index:Int)
Function luaL_loadbuffer:Int(L:lua_State Ptr, buff:Utf8String, sz:size_t, name:Utf8String)
Function luaL_loadbufferx:Int(L:lua_State Ptr, buff:Utf8String, sz:size_t, name:Utf8String, mode:Utf8String)
Function luaL_loadfile:Int(L:lua_State Ptr, filename:Utf8String)
Function luaL_loadfilex:Int(L:lua_State Ptr, filename:Utf8String, mode:Utf8String)
Function luaL_loadstring:Int(L:lua_State Ptr, s:Utf8String)
Function luaL_newlib:Void(L:lua_State Ptr, l:luaL_Reg[])
Function luaL_newlibtable:Void(L:lua_State Ptr, l:luaL_Reg[])
Function luaL_newmetatable:Int(L:lua_State Ptr, tname:Utf8String)
Function luaL_newstate:lua_State Ptr()
Function luaL_openlibs:Void(L:lua_State Ptr)
'macro Function luaL_opt
Function luaL_optinteger:lua_Integer(L:lua_State Ptr, arg:Int, d:lua_Integer)
Function luaL_optlstring:Utf8String(L:lua_State Ptr, arg:Int, d:Utf8String, l:size_t Ptr)
Function luaL_optnumber:lua_Number(L:lua_State Ptr, arg:Int, d:lua_Number)
Function luaL_optstring:Utf8String(L:lua_State Ptr, arg:Int, d:Utf8String)
Function luaL_prepbuffer:char_t Ptr(B:luaL_Buffer Ptr)
Function luaL_prepbuffsize:char_t Ptr(B:luaL_Buffer Ptr, sz:size_t)
Function luaL_pushresult:Void(B:luaL_Buffer Ptr)
Function luaL_pushresultsize:Void(B:luaL_Buffer Ptr, sz:size_t)
Function luaL_ref:Int(L:lua_State Ptr, t:Int)
Function luaL_requiref:Void(L:lua_State Ptr, modname:Utf8String, openf:lua_CFunction, glb:Int)
Function luaL_setfuncs:Void(L:lua_State Ptr, l:luaL_Reg Ptr, nup:Int)
Function luaL_setmetatable:Void(L:lua_State Ptr, tname:Utf8String)
Function luaL_testudata:Void Ptr(L:lua_State Ptr, arg:Int, tname:Utf8String)
Function luaL_tolstring:Utf8String(L:lua_State Ptr, idx:Int, len:size_t Ptr)
Function luaL_traceback:Void(L:lua_State Ptr, L1:lua_State Ptr, msg:Utf8String, level:Int)
Function luaL_typename:Utf8String(L:lua_State Ptr, index:Int)
Function luaL_unref:Void(L:lua_State Ptr, t:Int, ref:Int)
Function luaL_where:Void(L:lua_State Ptr, lvl:Int)
