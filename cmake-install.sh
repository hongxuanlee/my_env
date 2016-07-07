#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)
TMP_DIR=$CUR_DIR/tmp
cd "$CUR_DIR"
if ! loc=$(type -p $CMD_NAME) || [ -z $loc ]; then
    curl -fLo $TMP_DIR/cmake.tar.gz --create-dirs https://cmake.org/files/v3.5/cmake-3.5.0-rc1.tar.gz
    tar zxvf $TMP_DIR/cmake.tar.gz -C $TMP_DIR
    cd $TMP_DIR/cmake-3.5.0-rc1
    ./bootstrap
    sudo make
    sudo make install  
fi    
