Namespace lua.api

Using lua
Using libc..

Class LuaState Final
Private
  Field L:lua_State Ptr

Public
  Property Pointer:lua_State Ptr()
    Return L
  End

  Function NewState:LuaState(openLibs:Bool = True)
    Local state := New LuaState(luaL_newstate())
    If openLibs Then state.OpenLibs()
    Return state
  End

  Method New(L:lua_State Ptr)
    Self.L = L
  End

  ' main library

  Method AbsIndex:Int(index:Int)
    Return lua_absindex(L, index)
  End

  Method Arith:Void(op:Int)
    lua_arith(L, op)
  End

  Method AtPanic:lua_CFunction(panicFuncPtr:lua_CFunction)
    Return lua_atpanic(L, panicFuncPtr)
  End

  Method Call:Void(argCount:Int, resultCount:Int)
    lua_call(L, argCount, resultCount)
  End

  Method CallK:Void(argCount:Int, resultCount:Int, context:lua_KContext, kFuncPtr:lua_KFunction)
    lua_callk(L, argCount, resultCount, context, kFuncPtr)
  End

  Method Close:Void()
    lua_close(L)
  End

  Method CheckStack:Bool(n:Int)
    Return lua_checkstack(L, n)
  End

  Method Compare:Bool(index1:Int, index2:Int, op:Int)
    Return lua_compare(L, index1, index2, op)
  End

  Method Concat:Void(n:Int)
    lua_concat(L, n)
  End

  Method Copy:Void(fromIndex:Int, toIndex:Int)
    lua_copy(L, fromIndex, toIndex)
  End

  Method CreateTable:Void(arrayHint:Int, mapHint:Int)
    lua_createtable(L, arrayHint, mapHint)
  End

  Method Error:Int()
    Return lua_error(L)
  End

  Method GC:Int(what:Int, data:Int)
    Return lua_gc(L, what, data)
  End

  Method GetField:Int(index:Int, key:String)
    Return lua_getfield(L, index, key)
  End

  Method GetExtraSpace:Void Ptr()
    Return lua_getextraspace(L)
  End

  Method GetGlobal:Int(name:String)
    Return lua_getglobal(L, name)
  End

  Method GetI:Int(index:Int, i:Int)
    Return lua_geti(L, index, i)
  End

  Method GetMetaTable:Bool(index:Int)
    Return lua_getmetatable(L, index)
  End

  Method GetTable:Int(index:Int)
    Return lua_gettable(L, index)
  End

  Method GetTop:Int()
    Return lua_gettop(L)
  End

  Method GetUserValue:Int(index:Int)
    Return lua_getuservalue(L, index)
  End

  Method Insert:Void(index:Int)
    lua_insert(L, index)
  End

  Method IsBoolean:Bool(index:Int)
    Return lua_isboolean(L, index)
  End

  Method IsCFunction:Bool(index:Int)
    Return lua_iscfunction(L, index)
  End

  Method IsFunction:Bool(index:Int)
    Return lua_isfunction(L, index)
  End

  Method IsInteger:Bool(index:Int)
    Return lua_isinteger(L, index)
  End

  Method IsLightUserdata:Bool(index:Int)
    Return lua_islightuserdata(L, index)
  End

  Method IsNil:Bool(index:Int)
    Return lua_isnil(L, index)
  End

  Method IsNone:Bool(index:Int)
    Return lua_isnone(L, index)
  End

  Method IsNoneOrNil:Bool(index:Int)
    Return lua_isnoneornil(L, index)
  End

  Method IsNumber:Bool(index:Int)
    Return lua_isnumber(L, index)
  End

  Method IsString:Bool(index:Int)
    Return lua_isstring(L, index)
  End

  Method IsTable:Bool(index:Int)
    Return lua_istable(L, index)
  End

  Method IsThread:Bool(index:Int)
    Return lua_isthread(L, index)
  End

  Method IsUserdata:Bool(index:Int)
    Return lua_isuserdata(L, index)
  End

  Method IsYieldable:Bool()
    Return lua_isyieldable(L)
  End

  Method Len:Void(index:Int)
    lua_len(L, index)
  End

  Method NewTable:Void()
    lua_newtable(L)
  End

  Method NewThread:LuaState()
    Return New LuaState(lua_newthread(L))
  End

  Method NextElement:Int(index:Int)
    Return lua_next(L, index)
  End

  Method NumberToInteger:Int(floatValue:Float, intPointer:Int Ptr)
    Return 0'lua_numbertointeger(L, floatValue, intPointer)
  End

  Method PCall:Int(argCount:Int, resultCount:Int, messageHandlerIndex:Int)
    Return lua_pcall(L, argCount, resultCount, messageHandlerIndex)
  End

  Method PCallK:Int(argCount:Int, resultCount:Int, context:lua_KContext, kFuncPtr:lua_KFunction)
    Return 0'lua_pcallk(L, argCount, resultCount, context, kFuncPtr)
  End

  Method Pop:Void(count:Int)
    lua_pop(L, count)
  End

  Method PushBoolean:Void(value:Bool)
    lua_pushboolean(L, value)
  End

  Method PushCClosure:Void(funcPtr:lua_CFunction, valueCount:Int)
    lua_pushcclosure(L, funcPtr, valueCount)
  End

  Method PushCFunction:Void(funcPtr:lua_CFunction)
    lua_pushcfunction(L, funcPtr)
  End

  Method PushGlobalTable:Void()
    lua_pushglobaltable(L)
  End

  Method PushInteger:Void(value:Int)
    lua_pushinteger(L, value)
  End

  Method PushLightUserdata:Void(address:Void Ptr)
    lua_pushlightuserdata(L, address)
  End

  Method PushLString:String(str:String, length:Int)
    Return lua_pushlstring(L, str, length)
  End

  Method PushNil:Void()
    lua_pushnil(L)
  End

  Method PushNumber:Void(value:Float)
    lua_pushnumber(L, value)
  End

  Method PushString:String(str:String)
    Return lua_pushstring(L, str)
  End

  Method PushThread:Int()
    Return lua_pushthread(L)
  End

  Method PushValue:Void(index:Int)
    lua_pushvalue(L, index)
  End

  Method RawEqual:Bool(index1:Int, index2:Int)
    Return lua_rawequal(L, index1, index2)
  End

  Method RawGet:Int(index:Int)
    Return lua_rawget(L, index)
  End

  Method RawGetI:Int(index:Int, i:Int)
    Return lua_rawgeti(L, index, i)
  End

  Method RawGetP:Int(index:Int, p:Void Ptr)
    Return lua_rawgetp(L, index, p)
  End

  Method RawLen:Int(index:Int)
    Return lua_rawlen(L, index)
  End

  Method RawSet:Void(index:Int)
    lua_rawset(L, index)
  End

  Method RawSetI:Void(index:Int, i:Int)
    lua_rawseti(L, index, i)
  End

  Method RawSetP:Void(index:int, p:Void Ptr)
    lua_rawsetp(L, index, p)
  End

  Method Register:Void(name:String, funcPtr:lua_CFunction)
    lua_register(L, name, funcPtr)
  End

  Method Remove:Void(index:Int)
    lua_remove(L, index)
  End

  Method Replace:Void(index:Int)
    lua_replace(L, index)
  End

  Method Resume:Int(fromState:lua_State Ptr, argCount:Int)
    Return lua_resume(L, fromState, argCount)
  End

  Method Rotate:Void(index:Int, count:Int)
    lua_rotate(L, index, count)
  End

  Method SetField:Void(index:Int, key:String)
    lua_setfield(L, index, key)
  End

  Method SetGlobal:Void(name:String)
    lua_setglobal(L, name)
  End

  Method SetI:Void(index:Int, n:Int)
    lua_seti(L, index, n)
  End

  Method SetMetatable:Void(index:Int)
    lua_setmetatable(L, index)
  End

  Method SetTable:Void(index:Int)
    lua_settable(L, index)
  End

  Method SetTop:Void(index:Int)
    lua_settop(L, index)
  End

  Method SetUserValue:Void(index:Int)
    lua_setuservalue(L, index)
  End

  Method Status:Void()
    lua_status(L)
  End

  Method StringToNumber:Int(str:String)
    Return lua_stringtonumber(L, str)
  End

  Method ToBoolean:Bool(index:Int)
    Return lua_toboolean(L, index)
  End

  Method ToCFunction:lua_CFunction(index:Int)
    Return lua_tocfunction(L, index)
  End

  Method ToInteger:Int(index:Int)
    Return lua_tointeger(L, index)
  End

  Method ToIntegerX:Int(index:Int, isInt:Bool Ptr)
    Return lua_tointegerx(L, index, isInt)
  End

  Method ToLString:String(index:Int, length:Int Ptr)
    Return ""'lua_tolstring(L, index, length)
  End

  Method ToNumber:Float(index:Int)
    Return lua_tonumber(L, index)
  End

  Method ToNumberX:Float(index:Int, isNumber:Bool Ptr)
    Return lua_tonumberx(L, index, isNumber)
  End

  Method ToPointer:Void Ptr(index:Int)
    Return Null'lua_topointer(index)
  End

  Method ToString:String(index:Int)
    Return ""'lua_tostring(L, index)
  End

  Method ToThread:lua_State Ptr(index:Int)
    Return lua_tothread(L, index)
  End

  Method ToUserdata:Void Ptr(index:Int)
    Return lua_touserdata(L, index)
  End

  Method Type:Int(index:Int)
    Return lua_type(L, index)
  End

  Method TypeName:String(type:Int)
    Return ""'lua_typename(L, type)
  End

  Function UpValueIndex:Int(i:Int)
    Return lua_upvalueindex(i)
  End

  Method Version:Float()
    Return lua_version(L)
  End

  Function XMove:Void(fromState:lua_State Ptr, toState:lua_State Ptr, count:Int)
    lua_xmove(fromState, toState, count)
  End

  Method Yield:Int(resultCount:Int)
    Return lua_yield(L, resultCount)
  End

  Method YieldK:Int(resultCount:Int, context:lua_KContext, kFuncPtr:lua_KFunction)
    Return lua_yieldk(L, resultCount, context, kFuncPtr)
  End

  ' auxiliary library

  Method ArgCheck:Void(cond:Int, arg:Int, extraMessage:String)
    luaL_argcheck(L, cond, arg, extraMessage)
  End

  Method ArgError:Void(arg:Int, extraMessage:String)
    luaL_argerror(L, arg, extraMessage)
  End

  Method CallMeta:Int(obj:Int, e:String)
    Return luaL_callmeta(L, obj, e)
  End

  Method CheckAny:Void(arg:Int)
    luaL_checkany(L, arg)
  End

  Method CheckInteger:Int(arg:Int)
    Return luaL_checkinteger(L, arg)
  End

  Method CheckLString:String(arg:Int, length:Int Ptr)
    Return luaL_checklstring(L, arg, length)
  End

  Method CheckNumber:Float(arg:Int)
    Return luaL_checknumber(L, arg)
  End

  Method CheckStack:Void(size:Int, message:String)
    luaL_checkstack(L, size, message)
  End

  Method CheckString:String(arg:Int)
    Return luaL_checkstring(L, arg)
  End

  Method CheckType:Void(arg:Int, type:Int)
    luaL_checktype(L, arg, type)
  End

  Method CheckUData:Void Ptr(arg:Int, tableName:String)
    Return luaL_checkudata(L, arg, tableName)
  End

  Method CheckVersion:Void()
    luaL_checkversion(L)
  End

  Method DoFile:Bool(filename:String)
    Return luaL_dofile(L, filename)
  End

  Method DoString:Bool(str:String)
    Return luaL_dostring(L, str)
  End

  Method ExecResult:Int(stat:Int)
    Return luaL_execresult(L, stat)
  End

  Method FileResult:Int(stat:Int, filename:String)
    Return luaL_fileresult(L, stat, filename)
  End

  Method GetMetaField:Int(obj:Int, e:String)
    Return luaL_getmetafield(L, obj, e)
  End

  Method GetMetatable:Int(tableName:String)
    Return luaL_getmetatable(L, tableName)
  End

  Method GetSubTable:Bool(index:Int, fieldName:String)
    Return luaL_getsubtable(L, index, fieldName)
  End

  Method GSub:String(source:String, find:String, replace:String)
    Return luaL_gsub(L, source, find, replace)
  End

  Method LenAtIndex:Int(index:Int)
    Return luaL_len(L, index)
  End

  Method LoadFile:Int(filename:String)
    Return luaL_loadfile(L, filename)
  End

  Method LoadFileX:Int(filename:String, mode:String)
    Return luaL_loadfilex(L, filename, mode)
  End

  Method LoadString:Int(str:String)
    Return luaL_loadstring(L, str)
  End

  Method NewLib:Void(library:luaL_Reg[])
    ' TODO
  End

  Method NewLibTable:Void(library:luaL_Reg[])
    ' TODO
  End

  Method NewMetatable:Int(tableName:String)
    Return luaL_newmetatable(L, tableName)
  End

  Method OpenLibs:Void()
    luaL_openlibs(L)
  End

  Method OptInteger:Int(arg:Int, def:Int)
    Return luaL_optinteger(L, arg, def)
  End

  Method OptLString:String(arg:Int, def:String, len:Int Ptr)
    Return luaL_optlstring(L, arg, def, len)
  End

  Method OptNumber:Float(arg:Int, def:Float)
    Return luaL_optnumber(L, arg, def)
  End

  Method OptString:String(arg:Int, def:String)
    Return luaL_optstring(L, arg, def)
  End

  Method Ref:Int(t:Int)
    Return luaL_ref(L, t)
  End

  Method RequireF:Void(moduleName:String, openFunc:lua_CFunction, glb:Int)
    luaL_requiref(L, moduleName, openFunc, glb)
  End

  Method SetFuncs:Void(l:luaL_Reg Ptr, nup:Int)
    luaL_setfuncs(L, l, nup)
  End

  Method SetMetatable:Void(tableName:String)
    luaL_setmetatable(L, tableName)
  End

  Method TestUData:Void Ptr(arg:Int, tableName:String)
    Return luaL_testudata(L, arg, tableName)
  End

  Method ToLStringAtIndex:String(index:Int, len:Int Ptr)
    Return luaL_tolstring(L, index, len)
  End

  Method Traceback:Void(L1:lua_State Ptr, message:String, level:Int)
    luaL_traceback(L, L1, message, level)
  End

  Method TypeNameAtIndex:String(index:Int)
    Return luaL_typename(L, index)
  End

  Method Unref:Void(t:Int, ref:Int)
    luaL_unref(L, t, ref)
  End

  Method WhereControl:Void(level:Int)
    luaL_where(L, level)
  End

  ' custom

  Method PushUserdata:Void Ptr(pointer:Void Ptr, sizeInBytes:Int)
    Return mx2lua_pushuserdata(L, pointer, sizeInBytes)
  End

  Method PushObject<T>:Void(obj:T)
    PushUserdata(Cast<Void Ptr>(Varptr obj), sizeof(obj))
  End

  Method ToObject<T>:T(index:Int)
    Local p := Cast<T Ptr>(ToUserdata(index))
    If Not p Then Return Null
    Return p[0]
  End
End
