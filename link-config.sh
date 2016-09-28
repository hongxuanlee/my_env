#!/bin/bash

sudo rm -f ~/.vimrc
sudo rm -f ~/.zshrc
sudo rm -f ~/.tmux.conf
sudo rm -f ~/.editorconfig

envpath=$(cd `dirname $0`; pwd)

ln -s $envpath/vimrc ~/.vimrc
ln -s $envpath/zshrc ~/.zshrc
ln -s $envpath/tmux.conf ~/.tmux.conf
ln -s $envpath/editorconfig ~/.editorconfig

