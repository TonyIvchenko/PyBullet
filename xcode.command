#!/bin/sh
set -eu

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
cd "$SCRIPT_DIR/build3"
./premake4_osx xcode4
open xcode4/0_Bullet3Solution.xcworkspace
