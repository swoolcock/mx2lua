Namespace test

#Import "<std>"
#Import "<lua>"

Using lua..

Function Main:Void()
  Local a:lua_State = luaL_newstate()
  lua_close(a)
End
