#!/bin/bash
CUR_DIR=$(cd `dirname $0`; pwd)

# cmake
$CUR_DIR/cmake-install.sh

# zsh
$CUR_DIR/zsh-install.sh

#app
$CUR_DIR/app-install.sh

# node
$CUR_DIR/node-install.sh

# upgrade vim
$CUR_DIR/vim-install.sh

# tmux
$CUR_DIR/tmux-install.sh

$CUR_DIR/link_config.sh
