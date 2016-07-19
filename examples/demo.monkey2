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

Namespace demo

#Import "<libc>"
#Import "<lua>"
#Import "<std>"
#Import "<mojo>"

#Import "assets/demo.lua"

Using libc..
Using lua..
Using std..
Using mojo..

Function Main()
	New AppInstance
	New DemoApp
	App.Run()
End

Class DemoApp Extends Window
  Field state:LuaState
  Field ent:Entity = New Entity

  Method New()
    state = LuaState.NewState()
    state.DoString(LoadString("asset::demo.lua"))
  End

  Method OnRender(canvas:Canvas) Override
    App.RequestRender()
    If Keyboard.KeyHit(Key.Space) Then
      Print "reloading"
      state.DoString(LoadString("asset::demo.lua"))
    End
    ent.Update(state)
    ent.Draw(canvas)
  End
End

Class Entity Implements LuaObject
  Field x:Float
  Field y:Float

	Method __index:Int(L:lua_State Ptr)
		Local state := New LuaState(L)
		Local name:String = state.CheckString(2)
		Select name
      Case "x"
        state.PushNumber(x)
				Return 1
      Case "y"
        state.PushNumber(y)
				Return 1
			Case "Test"
				state.PushMethodCall(Self, "Test")
				Return 1
    End
		Return 0
	End

  Method __newindex:Int(L:lua_State Ptr)
		Local state := New LuaState(L)
		Local name:String = state.CheckString(2)
		Select name
			Case "x"
				x = state.CheckNumber(3)
			Case "y"
				y = state.CheckNumber(3)
		End
		Return 0
	End

	Method __methodcall:Int(L:lua_State Ptr)
		Local state := New LuaState(L)
		Local name:String = state.CheckString(state.UpValueIndex(2))
		Select name
			Case "Test"
				Test()
		End
		Return 0
	End

	Method Test:Void()
		Print "called test for entity with x,y=" + x + "," + y
	End

  Method Update:Void(state:LuaState)
    state.GetGlobal("update")
    state.PushObject(Self)
    If state.PCall(1, 0, 0) Then
      Print(state.ToString(-1))
    End
  End

  Method Draw:Void(canvas:Canvas)
    canvas.PushMatrix()
    canvas.Translate(x, y)
    canvas.DrawRect(-10,-10,20,20)
    canvas.PopMatrix()
  End
End
