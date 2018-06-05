#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)
DEP_DIR=$HOME/deps

brew install nvm

nvm install node

nvm use lts

cd $CUR_DIR	

# some useful node modules
if ! eslint_local="$(type -p "eslint")" || [ -z "$eslint_local" ]; then
    npm i eslint@2.2.0 -g
    npm i babel-eslint@5.0.0 -g
fi

echo nvm version is $(nvm --version)
echo node version is $(node --version)

