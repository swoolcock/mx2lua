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

Namespace lua.api

Using lua
Using libc..

#Rem monkeydoc Wrapper class for the lua_State struct, allowing for more OO-style usage.
  Also includes some utility methods for better MX2 integration.
#End
Class LuaState Final
Private
  Field L:lua_State Ptr

Public
  #Rem monkeydoc Returns the internal pointer to the lua_State instance.
  #End
  Property Pointer:lua_State Ptr()
    Return L
  End

  #Rem monkeydoc Creates a new lua state and returns an instance of the LuaState wrapper class.
    Uses the auxiliary library function luaL_newstate() and can optionally call luaL_openlibs() automatically, as well as creating the custom binding metatables.
    Note that this will be a disjointed state with its own global table.
    @param openLibs         Opens the standard libraries if enabled (defaults to True)
    @param createMetatables Creates MX2 binding metatables if enabled (defaults to True)
  #End
  Function NewState:LuaState(openLibs:Bool = True, createMetatables:Bool = True)
    Local L := luaL_newstate()
    If openLibs Then luaL_openlibs(L)
    If createMetatables Then
      luaL_newmetatable(L, "Object")
      lua_pushcfunction(L, Object_Index)
      lua_setfield(L, -2, "__index")
      lua_pushcfunction(L, Object_NewIndex)
      lua_setfield(L, -2, "__newindex")
      lua_pop(L, 1)

      luaL_newmetatable(L, "Struct")
      lua_pushcfunction(L, Struct_Index)
      lua_setfield(L, -2, "__index")
      lua_pushcfunction(L, Struct_NewIndex)
      lua_setfield(L, -2, "__newindex")
      lua_pop(L, 1)
    End
    Return New LuaState(L)
  End

  #Rem monkeydoc Creates an instance of the wrapper class for the given pointer.
  #End
  Method New(L:lua_State Ptr)
    Self.L = L
  End

  ' main library

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_absindex
  #End
  Method AbsIndex:Int(index:Int)
    Return lua_absindex(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_arith
  #End
  Method Arith:Void(op:Int)
    lua_arith(L, op)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_atpanic
  #End
  Method AtPanic:lua_CFunction(panicFuncPtr:lua_CFunction)
    Return lua_atpanic(L, panicFuncPtr)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_call
  #End
  Method Call:Void(argCount:Int, resultCount:Int)
    lua_call(L, argCount, resultCount)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_callk
  #End
  Method CallK:Void(argCount:Int, resultCount:Int, context:lua_KContext, kFuncPtr:lua_KFunction)
    lua_callk(L, argCount, resultCount, context, kFuncPtr)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_close
  #End
  Method Close:Void()
    lua_close(L)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_checkstack
  #End
  Method CheckStack:Bool(n:Int)
    Return lua_checkstack(L, n)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_compare
  #End
  Method Compare:Bool(index1:Int, index2:Int, op:Int)
    Return lua_compare(L, index1, index2, op)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_concat
  #End
  Method Concat:Void(n:Int)
    lua_concat(L, n)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_copy
  #End
  Method Copy:Void(fromIndex:Int, toIndex:Int)
    lua_copy(L, fromIndex, toIndex)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_createtable
  #End
  Method CreateTable:Void(arrayHint:Int, mapHint:Int)
    lua_createtable(L, arrayHint, mapHint)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_error
  #End
  Method Error:Int()
    Return lua_error(L)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_gc
  #End
  Method GC:Int(what:Int, data:Int)
    Return lua_gc(L, what, data)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_getfield
  #End
  Method GetField:Int(index:Int, key:String)
    Return lua_getfield(L, index, key)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_getextraspace
  #End
  Method GetExtraSpace:Void Ptr()
    Return lua_getextraspace(L)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_getglobal
  #End
  Method GetGlobal:Int(name:String)
    Return lua_getglobal(L, name)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_geti
  #End
  Method GetI:Int(index:Int, i:Int)
    Return lua_geti(L, index, i)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_getmetatable
  #End
  Method GetMetaTable:Bool(index:Int)
    Return lua_getmetatable(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_gettable
  #End
  Method GetTable:Int(index:Int)
    Return lua_gettable(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_gettop
  #End
  Method GetTop:Int()
    Return lua_gettop(L)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_getuservalue
  #End
  Method GetUserValue:Int(index:Int)
    Return lua_getuservalue(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_insert
  #End
  Method Insert:Void(index:Int)
    lua_insert(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_isboolean
  #End
  Method IsBoolean:Bool(index:Int)
    Return lua_isboolean(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_iscfunction
  #End
  Method IsCFunction:Bool(index:Int)
    Return lua_iscfunction(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_isfunction
  #End
  Method IsFunction:Bool(index:Int)
    Return lua_isfunction(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_isinteger
  #End
  Method IsInteger:Bool(index:Int)
    Return lua_isinteger(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_islightuserdata
  #End
  Method IsLightUserdata:Bool(index:Int)
    Return lua_islightuserdata(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_isnil
  #End
  Method IsNil:Bool(index:Int)
    Return lua_isnil(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_isnone
  #End
  Method IsNone:Bool(index:Int)
    Return lua_isnone(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_isnoneornil
  #End
  Method IsNoneOrNil:Bool(index:Int)
    Return lua_isnoneornil(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_isnumber
  #End
  Method IsNumber:Bool(index:Int)
    Return lua_isnumber(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_isstring
  #End
  Method IsString:Bool(index:Int)
    Return lua_isstring(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_istable
  #End
  Method IsTable:Bool(index:Int)
    Return lua_istable(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_isthread
  #End
  Method IsThread:Bool(index:Int)
    Return lua_isthread(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_isuserdata
  #End
  Method IsUserdata:Bool(index:Int)
    Return lua_isuserdata(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_isyieldable
  #End
  Method IsYieldable:Bool()
    Return lua_isyieldable(L)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_len
  #End
  Method Len:Void(index:Int)
    lua_len(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_newtable
  #End
  Method NewTable:Void()
    lua_newtable(L)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_newthread
  #End
  Method NewThread:LuaState()
    Return New LuaState(lua_newthread(L))
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_next
  #End
  Method NextElement:Int(index:Int)
    Return lua_next(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_numbertointeger
  #End
  Method NumberToInteger:Int(floatValue:Float, intPointer:Int Ptr)
    Return 0'lua_numbertointeger(L, floatValue, intPointer)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pcall
  #End
  Method PCall:Int(argCount:Int, resultCount:Int, messageHandlerIndex:Int)
    Return lua_pcall(L, argCount, resultCount, messageHandlerIndex)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pcallk
  #End
  Method PCallK:Int(argCount:Int, resultCount:Int, context:lua_KContext, kFuncPtr:lua_KFunction)
    Return 0'lua_pcallk(L, argCount, resultCount, context, kFuncPtr)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pop
  #End
  Method Pop:Void(count:Int)
    lua_pop(L, count)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pushboolean
  #End
  Method PushBoolean:Void(value:Bool)
    lua_pushboolean(L, value)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pushcclosure
  #End
  Method PushCClosure:Void(funcPtr:lua_CFunction, valueCount:Int)
    lua_pushcclosure(L, funcPtr, valueCount)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pushcfunction
  #End
  Method PushCFunction:Void(funcPtr:lua_CFunction)
    lua_pushcfunction(L, funcPtr)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pushglobaltable
  #End
  Method PushGlobalTable:Void()
    lua_pushglobaltable(L)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pushinteger
  #End
  Method PushInteger:Void(value:Int)
    lua_pushinteger(L, value)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pushlightuserdata
  #End
  Method PushLightUserdata:Void(address:Void Ptr)
    lua_pushlightuserdata(L, address)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pushlstring
  #End
  Method PushLString:String(str:String, length:Int)
    Return lua_pushlstring(L, str, length)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pushnil
  #End
  Method PushNil:Void()
    lua_pushnil(L)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pushnumber
  #End
  Method PushNumber:Void(value:Float)
    lua_pushnumber(L, value)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pushstring
  #End
  Method PushString:String(str:String)
    Return lua_pushstring(L, str)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pushthread
  #End
  Method PushThread:Int()
    Return lua_pushthread(L)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_pushvalue
  #End
  Method PushValue:Void(index:Int)
    lua_pushvalue(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_rawequal
  #End
  Method RawEqual:Bool(index1:Int, index2:Int)
    Return lua_rawequal(L, index1, index2)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_rawget
  #End
  Method RawGet:Int(index:Int)
    Return lua_rawget(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_rawgeti
  #End
  Method RawGetI:Int(index:Int, i:Int)
    Return lua_rawgeti(L, index, i)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_rawgetp
  #End
  Method RawGetP:Int(index:Int, p:Void Ptr)
    Return lua_rawgetp(L, index, p)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_rawlen
  #End
  Method RawLen:Int(index:Int)
    Return lua_rawlen(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_rawset
  #End
  Method RawSet:Void(index:Int)
    lua_rawset(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_rawseti
  #End
  Method RawSetI:Void(index:Int, i:Int)
    lua_rawseti(L, index, i)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_rawsetp
  #End
  Method RawSetP:Void(index:int, p:Void Ptr)
    lua_rawsetp(L, index, p)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_register
  #End
  Method Register:Void(name:String, funcPtr:lua_CFunction)
    lua_register(L, name, funcPtr)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_remove
  #End
  Method Remove:Void(index:Int)
    lua_remove(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_replace
  #End
  Method Replace:Void(index:Int)
    lua_replace(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_resume
  #End
  Method Resume:Int(fromState:lua_State Ptr, argCount:Int)
    Return lua_resume(L, fromState, argCount)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_rotate
  #End
  Method Rotate:Void(index:Int, count:Int)
    lua_rotate(L, index, count)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_setfield
  #End
  Method SetField:Void(index:Int, key:String)
    lua_setfield(L, index, key)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_setglobal
  #End
  Method SetGlobal:Void(name:String)
    lua_setglobal(L, name)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_seti
  #End
  Method SetI:Void(index:Int, n:Int)
    lua_seti(L, index, n)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_setmetatable
  #End
  Method SetMetatable:Void(index:Int)
    lua_setmetatable(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_settable
  #End
  Method SetTable:Void(index:Int)
    lua_settable(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_settop
  #End
  Method SetTop:Void(index:Int)
    lua_settop(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_setuservalue
  #End
  Method SetUserValue:Void(index:Int)
    lua_setuservalue(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_status
  #End
  Method Status:Void()
    lua_status(L)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_stringtonumber
  #End
  Method StringToNumber:Int(str:String)
    Return lua_stringtonumber(L, str)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_toboolean
  #End
  Method ToBoolean:Bool(index:Int)
    Return lua_toboolean(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_tocfunction
  #End
  Method ToCFunction:lua_CFunction(index:Int)
    Return lua_tocfunction(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_tointeger
  #End
  Method ToInteger:Int(index:Int)
    Return lua_tointeger(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_tointegerx
  #End
  Method ToIntegerX:Int(index:Int, isInt:Bool Ptr)
    Return lua_tointegerx(L, index, isInt)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_tolstring
  #End
  Method ToLString:String(index:Int, length:Int Ptr)
    Return ""'lua_tolstring(L, index, length)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_tonumber
  #End
  Method ToNumber:Float(index:Int)
    Return lua_tonumber(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_tonumberx
  #End
  Method ToNumberX:Float(index:Int, isNumber:Bool Ptr)
    Return lua_tonumberx(L, index, isNumber)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_topointer
  #End
  Method ToPointer:Void Ptr(index:Int)
    Return Null'lua_topointer(index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_tostring
  #End
  Method ToString:String(index:Int)
    Return lua_tostring(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_tothread
  #End
  Method ToThread:lua_State Ptr(index:Int)
    Return lua_tothread(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_touserdata
  #End
  Method ToUserdata:Void Ptr(index:Int)
    Return lua_touserdata(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_type
  #End
  Method Type:Int(index:Int)
    Return lua_type(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_typename
  #End
  Method TypeName:String(type:Int)
    Return ""'lua_typename(L, type)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_upvalueindex
  #End
  Function UpValueIndex:Int(i:Int)
    Return lua_upvalueindex(i)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_version
  #End
  Method Version:Float()
    Return lua_version(L)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_xmove
  #End
  Function XMove:Void(fromState:lua_State Ptr, toState:lua_State Ptr, count:Int)
    lua_xmove(fromState, toState, count)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_yield
  #End
  Method Yield:Int(resultCount:Int)
    Return lua_yield(L, resultCount)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#lua_yieldk
  #End
  Method YieldK:Int(resultCount:Int, context:lua_KContext, kFuncPtr:lua_KFunction)
    Return lua_yieldk(L, resultCount, context, kFuncPtr)
  End

  ' auxiliary library

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_argcheck
  #End
  Method ArgCheck:Void(cond:Int, arg:Int, extraMessage:String)
    luaL_argcheck(L, cond, arg, extraMessage)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_argerror
  #End
  Method ArgError:Void(arg:Int, extraMessage:String)
    luaL_argerror(L, arg, extraMessage)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_callmeta
  #End
  Method CallMeta:Int(obj:Int, e:String)
    Return luaL_callmeta(L, obj, e)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_checkany
  #End
  Method CheckAny:Void(arg:Int)
    luaL_checkany(L, arg)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_checkinteger
  #End
  Method CheckInteger:Int(arg:Int)
    Return luaL_checkinteger(L, arg)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_checklstring
  #End
  Method CheckLString:String(arg:Int, length:Int Ptr)
    Return luaL_checklstring(L, arg, length)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_checknumber
  #End
  Method CheckNumber:Float(arg:Int)
    Return luaL_checknumber(L, arg)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_checkstack
  #End
  Method CheckStack:Void(size:Int, message:String)
    luaL_checkstack(L, size, message)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_checkstring
  #End
  Method CheckString:String(arg:Int)
    Return luaL_checkstring(L, arg)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_checktype
  #End
  Method CheckType:Void(arg:Int, type:Int)
    luaL_checktype(L, arg, type)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_checkudata
  #End
  Method CheckUData:Void Ptr(arg:Int, tableName:String)
    Return luaL_checkudata(L, arg, tableName)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_checkversion
  #End
  Method CheckVersion:Void()
    luaL_checkversion(L)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_dofile
  #End
  Method DoFile:Bool(filename:String)
    Return luaL_dofile(L, filename)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_dostring
  #End
  Method DoString:Bool(str:String)
    Return luaL_dostring(L, str)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_execresult
  #End
  Method ExecResult:Int(stat:Int)
    Return luaL_execresult(L, stat)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_fileresult
  #End
  Method FileResult:Int(stat:Int, filename:String)
    Return luaL_fileresult(L, stat, filename)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_getmetafield
  #End
  Method GetMetaField:Int(obj:Int, e:String)
    Return luaL_getmetafield(L, obj, e)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_getmetatable
  #End
  Method GetMetatable:Int(tableName:String)
    Return luaL_getmetatable(L, tableName)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_getsubtable
  #End
  Method GetSubTable:Bool(index:Int, fieldName:String)
    Return luaL_getsubtable(L, index, fieldName)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_gsub
  #End
  Method GSub:String(source:String, find:String, replace:String)
    Return luaL_gsub(L, source, find, replace)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_len
  #End
  Method LenAtIndex:Int(index:Int)
    Return luaL_len(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_loadfile
  #End
  Method LoadFile:Int(filename:String)
    Return luaL_loadfile(L, filename)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_loadfilex
  #End
  Method LoadFileX:Int(filename:String, mode:String)
    Return luaL_loadfilex(L, filename, mode)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_loadstring
  #End
  Method LoadString:Int(str:String)
    Return luaL_loadstring(L, str)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_newlib
  #End
  Method NewLib:Void(library:luaL_Reg[])
    ' TODO
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_newlibtable
  #End
  Method NewLibTable:Void(library:luaL_Reg[])
    ' TODO
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_newmetatable
  #End
  Method NewMetatable:Int(tableName:String)
    Return luaL_newmetatable(L, tableName)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_openlibs
  #End
  Method OpenLibs:Void()
    luaL_openlibs(L)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_optinteger
  #End
  Method OptInteger:Int(arg:Int, def:Int)
    Return luaL_optinteger(L, arg, def)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_optlstring
  #End
  Method OptLString:String(arg:Int, def:String, len:Int Ptr)
    Return luaL_optlstring(L, arg, def, len)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_optnumber
  #End
  Method OptNumber:Float(arg:Int, def:Float)
    Return luaL_optnumber(L, arg, def)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_optstring
  #End
  Method OptString:String(arg:Int, def:String)
    Return luaL_optstring(L, arg, def)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_ref
  #End
  Method Ref:Int(t:Int)
    Return luaL_ref(L, t)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_requiref
  #End
  Method RequireF:Void(moduleName:String, openFunc:lua_CFunction, glb:Int)
    luaL_requiref(L, moduleName, openFunc, glb)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_setfuncs
  #End
  Method SetFuncs:Void(l:luaL_Reg Ptr, nup:Int)
    luaL_setfuncs(L, l, nup)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_setmetatable
  #End
  Method SetMetatable:Void(tableName:String)
    luaL_setmetatable(L, tableName)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_testudata
  #End
  Method TestUData:Void Ptr(arg:Int, tableName:String)
    Return luaL_testudata(L, arg, tableName)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_tolstring
  #End
  Method ToLStringAtIndex:String(index:Int, len:Int Ptr)
    Return luaL_tolstring(L, index, len)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_traceback
  #End
  Method Traceback:Void(L1:lua_State Ptr, message:String, level:Int)
    luaL_traceback(L, L1, message, level)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_typename
  #End
  Method TypeNameAtIndex:String(index:Int)
    Return luaL_typename(L, index)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_unref
  #End
  Method Unref:Void(t:Int, ref:Int)
    luaL_unref(L, t, ref)
  End

  #Rem monkeydoc https://www.lua.org/manual/5.3/manual.html#luaL_where
  #End
  Method WhereControl:Void(level:Int)
    luaL_where(L, level)
  End

  ' custom
  #Rem monkeydoc Pushes a full userdata object.
  #End
  Method PushUserdata:Void Ptr(pointer:Void Ptr, sizeInBytes:Int)
    Return mx2lua_pushuserdata(L, pointer, sizeInBytes)
  End

  #Rem monkeydoc Pushes an MX2 object reference as full userdata, assigning it the "Object" metatable.
    As it is pass-by-reference, changes made in MX2 or Lua will be reflected in the original object.
  #End
  Method PushObject<T>:Void(obj:T)
    mx2lua_pushuserdata(L, Cast<Void Ptr>(Varptr obj), sizeof(obj))
    luaL_setmetatable(L, "Object")
  End

  #Rem monkeydoc Pushes an MX2 struct value as full userdata, assigning it the "Struct" metatable.
    As it is pass-by-value, changes made in MX2 or Lua will be not be reflected in the original struct.
  #End
  Method PushStruct<T>:Void(obj:T)
    mx2lua_pushuserdata(L, Cast<Void Ptr>(Varptr obj), sizeof(obj))
    luaL_setmetatable(L, "Struct")
  End

  #Rem monkeydoc Peeks at a value on the stack at the given index, and tries to cast it to an MX2 object.
    Returns null if it was an invalid object reference.
  #End
  Method ToObject<T>:T(index:Int)
    Local p := Cast<T Ptr>(luaL_checkudata(L, index, "Object"))
    If Not p Then Return Null
    Return p[0]
  End

  #Rem monkeydoc Peeks at a value on the stack at the given index, and tries to cast it to an MX2 struct.
    Returns null if it was an invalid struct.
  #End
  Method ToStruct<T>:T(index:Int)
    Local p := Cast<T Ptr>(luaL_checkudata(L, index, "Struct"))
    If Not p Then Return Null
    Return p[0]
  End

  #Rem monkeydoc Pushes a C closure with the intention of calling a method on the given object.
  #End
  Method PushMethodCall<T>:Void(obj:T, name:String)
    PushObject<T>(obj)
    lua_pushstring(L, name)
    lua_pushcclosure(L, Closure_MethodCall, 2)
  End
End

#Rem monkeydoc Indicates that an object should make itself available for interfacing with the Lua stack.
#End
Interface LuaObject
  #Rem monkeydoc Acts like the __index metatable function for the object.
  #End
  Method __index:Int(L:lua_State Ptr)

  #Rem monkeydoc Acts like the __newindex metatable function for the object.
  #End
  Method __newindex:Int(L:lua_State Ptr)

  #Rem monkeydoc Delegates a call to one of the object's methods.
  #End
  Method __methodcall:Int(L:lua_State Ptr)
End

Private

Function Struct_Index:Int(L:lua_State Ptr)
  Local structPtr := luaL_checkudata(L, 1, "Struct")
  If structPtr Then
    Local key := luaL_checkstring(L, 2)
    ' TODO: get stuff... somehow
  Else
    luaL_argerror(L, 1, "nil or not a struct")
  End
  lua_pushnil(L)
  Return 1
End

Function Struct_NewIndex:Int(L:lua_State Ptr)
  Local structPtr := luaL_checkudata(L, 1, "Struct")
  If structPtr Then
    Local key := luaL_checkstring(L, 2)
    'Local value := luaL_checkstring(L, 3)
    ' TODO: set stuff... somehow
  Else
    luaL_argerror(L, 1, "nil or not a struct")
  End
  Return 0
End

Function Object_Index:Int(L:lua_State Ptr)
  Local state := New LuaState(L)
  Local obj := state.ToObject<Object>(1)
  If obj Then
    Local lo := Cast<LuaObject>(obj)
    If lo Then
      Return lo.__index(L)
    Else
      state.ArgError(1, "object doesn't implement LuaObject")
    End
  Else
    state.ArgError(1, "nil or not an object")
  End
  state.PushNil()
  Return 1
End

Function Object_NewIndex:Int(L:lua_State Ptr)
  Local state := New LuaState(L)
  Local obj := state.ToObject<Object>(1)
  If obj Then
    Local lo := Cast<LuaObject>(obj)
    If lo Then
      Return lo.__newindex(L)
    Else
      state.ArgError(1, "object doesn't implement LuaObject")
    End
  Else
    state.ArgError(1, "nil or not an object")
  End
  Return 0
End

Function Closure_MethodCall:Int(L:lua_State Ptr)
  Local state := New LuaState(L)
  Local obj := state.ToObject<Object>(state.UpValueIndex(1))
  If obj Then
    Local lo := Cast<LuaObject>(obj)
    If lo Then
      Return lo.__methodcall(L)
    Else
      state.ArgError(1, "object doesn't implement LuaObject")
    End
  Else
    state.ArgError(1, "nil or not an object")
  End
  Return 0
End
