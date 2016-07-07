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

Namespace test

#Import "<libc>"
#Import "<lua>"

Using libc..
Using lua..

Function Main:Void()
  Local L:lua_State Ptr = luaL_newstate()
  luaL_openlibs(L)
  lua_register(L, "PrintFoo", PrintFoo)
  lua_register(L, "PrintBar", PrintBar)

  lua_getglobal(L, "PrintFoo")
  Local foo := New Foo("Hello")
  mx2lua_pushuserdata(L, VarPtr foo, sizeof(foo))
  lua_pcall(L, 1, 0, 0)
  Print foo.a ' should not have changed, since it's a struct

  lua_getglobal(L, "PrintBar")
  Local bar := New Bar("World")
  mx2lua_pushuserdata(L, Cast<Void Ptr Ptr>(Varptr bar), sizeof(Varptr bar))
  lua_pcall(L, 1, 0, 0)
  Print bar.b ' should have changed, since it's an object

  lua_close(L)
End


Function PrintFoo:Int(L:lua_State Ptr)
  Local fooptr := Cast<Foo Ptr>(lua_touserdata(L, 1))
  Print fooptr[0].a
  fooptr[0].a = "Changed Foo!"
  Return 0
End

Function PrintBar:Int(L:lua_State Ptr)
  Local barptr := Cast<Bar Ptr>(lua_touserdata(L, 1))
  Print barptr[0].b
  barptr[0].b = "Changed Bar!"
  Return 0
End

Struct Foo
  Field a:String
  Method New(a:String)
    Self.a = a
  End
End

Class Bar
  Field b:String
  Method New(b:String)
    Self.b = b
  End
End
