Namespace lua

#Import "<std>"

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

#Import "luaextern.h"

Extern

Struct lua_State = "mx2_lua_State"
End

Function lua_close:Void(L:lua_State) = "mx2_lua_close"

Function luaL_newstate:lua_State() = "mx2_luaL_newstate"
