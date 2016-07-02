#!/bin/bash

#install Vundle
[ ! -d ~/.vim/bundle/vundle ] && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
