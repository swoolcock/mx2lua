#!/bin/sh
source ./config

MX2CC=$MX2_PATH/bin/mx2cc_macos
$MX2CC makeapp -verbose ../examples/demo.monkey2
