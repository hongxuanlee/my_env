#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)
DEP_DIR=$HOME/deps

DEPS_NVM=$DEP_DIR/.nvm

[ ! -d $DEPS_NVM ] && mkdir $DEPS_NVM

echo -e "\033[32m install nvm and node \033[0m\n" 

if [ ! -f $DEPS_NVM/nvm.sh ]; then
    [ -d $DEPS_NVM ] && sudo rm -rf $DEPS_NVM
    git clone https://github.com/creationix/nvm.git $DEPS_NVM 
    cd $DEPS_NVM && git checkout `git describe --abbrev=0 --tags`
fi

. $DEPS_NVM/nvm.sh
nvm install node

nvm use stable

cd $CUR_DIR	

# some useful node modules
if ! eslint_local="$(type -p "eslint")" || [ -z "$eslint_local" ]; then
    npm i eslint@2.2.0 -g
    npm i babel-eslint@5.0.0 -g
fi

echo nvm version is $(nvm --version)
echo node version is $(node --version)

