struct mx2_lua_State {
  lua_State *_state;
  mx2_lua_State(lua_State *state) : _state(state) {}
};

void mx2_lua_close(mx2_lua_State L) {
  lua_close(L._state);
}

mx2_lua_State mx2_luaL_newstate() {
  return mx2_lua_State(luaL_newstate());
}
