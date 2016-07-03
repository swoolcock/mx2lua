Namespace test

#Import "<std>"
#Import "<lua>"

Using lua..

Function Main:Void()
  Local L:lua_State Ptr = luaL_newstate()
  luaL_openlibs(L)
  lua_register(L, "testfunc", testfunc)
  luaL_dostring(L, "testfunc()")
  lua_close(L)
End

Function testfunc:Int(L:lua_State Ptr)
  Print("called testfunc")
  Return 0
End
