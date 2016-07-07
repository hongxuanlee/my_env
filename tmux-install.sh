#!/bin/bash
echo -e "\033[32m install tmux \033[0m\n"

CUR_DIR=$(cd `dirname $0`; pwd)
DEPS_DIR=$HOME/deps
TMP_DIR=CUR_DIR/tmp

if loc="$(which tmux)" || [ -z "$loc" ]; then
    brew install tmux
fi
