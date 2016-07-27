#!/bin/sh
source ./config

MX2CC=$MX2_PATH/bin/mx2cc_macos
$MX2CC makemods lua
$MX2CC makedocs lua
