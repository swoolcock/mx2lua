Namespace lua.api

Using lua

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

  Method Close:Void()
    lua_close(L)
  End

  Method OpenLibs:Void()
    luaL_openlibs(L)
  End
  
  Method Register:Void(name:String, funcptr:lua_CFunction)
    lua_register(L, name, funcptr)
  End

  Method GetGlobal:Int(name:String)
    Return lua_getglobal(L, name)
  End

  Method PushUserdata:Void Ptr(pointer:Void Ptr, sizeInBytes:Int)
    Return mx2lua_pushuserdata(L, pointer, sizeInBytes)
  End

  Method PCall:Int(argCount:Int, resultCount:Int, messageHandlerIndex:Int)
    Return lua_pcall(L, argCount, resultCount, messageHandlerIndex)
  End

  Method ToUserdata:Void Ptr(index:Int)
    Return lua_touserdata(L, index)
  End
End
