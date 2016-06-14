#!/bin/bash

sudo rm -f ~/.vimrc
sudo rm -f ~/.zshrc

envpath=$(cd `dirname $0`; pwd)

ln -s $envpath/vimrc ~/.vimrc
ln -s $envpath/zshrc ~/.zshrc


