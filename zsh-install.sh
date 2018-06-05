#!/bin/bash
zsh --version
chsh -s $(which zsh)

CUR_DIR=$(cd `dirname $0`;pwd)
TMP_DIR=$CUR_DIR/tmp
DEPS_DIR=$HOME/deps

[ ! -d $TMP_DIR ] && mkdir $TMP_DIR  
[ ! -d $DEPS_DIR ] && mkdir $DEPS_DIR

cd $TMP_DIR
[ ! -d $TMP_DIR/autojump ] && git clone git://github.com/joelthelion/autojump.git

./install.py
cd $CUR_DIR

# oh my zsh
export ZSH=$DEPS_DIR/.oh-my-zsh
[ ! -d $DEPS_DIR/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo current shell is $(echo $SHELL)

cd $CUR_DIR
