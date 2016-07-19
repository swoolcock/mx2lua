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
#Import "<std>"

#Import "assets/test.lua"

Using libc..
Using lua..
Using std..

Function Main:Void()
  Local state := LuaState.NewState()
  state.Register("PrintTestStruct", PrintTestStruct)
  state.Register("PrintTestObject", PrintTestObject)

  Local testStruct := New TestStruct("Hello")
  Local testObject := New TestObject("World")

  state.PushStruct(testStruct)
  state.SetGlobal("testStruct")
  state.PushObject(testObject)
  state.SetGlobal("testObject")

  Print "Main: Loading file..."
  If state.DoString(LoadString("asset::test.lua")) Then
    Print state.ToString(-1)
    Return
  End

  Print "Main: testStruct.foo before call: "+testStruct.foo
  Print "Main: testObject.foo before call: "+testObject.foo

  Print "Main: Calling 'test()'"
  If state.DoString("test()") Then
    Print state.ToString(-1)
    Return
  End

  Print "Main: testStruct.foo after call: "+testStruct.foo
  Print "Main: testObject.foo after call: "+testObject.foo

  state.Close()
End

Function PrintTestStruct:Int(L:lua_State Ptr)
  Local state := New LuaState(L)
  Local test := state.ToStruct<TestStruct>(1)
  If test = Null Then
    Print "PrintTestStruct: It was null!"
  Else
    Print "PrintTestStruct: foo = "+test.foo
    test.foo = "Changed the struct!"
  End
  Return 0
End

Function PrintTestObject:Int(L:lua_State Ptr)
  Local state := New LuaState(L)
  Local test := state.ToObject<TestObject>(1)
  If test = Null Then
    Print "PrintTestObject: It was null!"
  Else
    Print "PrintTestObject: foo = "+test.foo
    test.foo = "Changed the object!"
  End
  Return 0
End

Struct TestStruct
  Field foo:String

  Method New(foo:String)
    Self.foo = foo
  End
End

Class TestObject Implements LuaObject
  Field foo:String

  Method New(foo:String)
    Self.foo = foo
  End

  Method __index:Int(L:lua_State Ptr)
		Local state := New LuaState(L)
		Local name:String = state.CheckString(2)
		Select name
      Case "foo"
        state.PushString(foo)
				Return 1
    End
		Return 0
	End

  Method __newindex:Int(L:lua_State Ptr)
		Local state := New LuaState(L)
		Local name:String = state.CheckString(2)
		Select name
			Case "foo"
				foo = state.CheckString(3)
		End
		Return 0
	End

  Method __methodcall:Int(L:lua_State Ptr)
    Return 0
  End
End
