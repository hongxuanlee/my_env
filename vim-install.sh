#!/bin/bash
#if vim vesion < 7.4, install vim
if ! vim_version="$(vim --version |awk '{print $5}' |head -1)" || \
	[ `echo "$vim_version<7.4" | bc` -eq 1 ]; then
	brew install vim
fi

#install Vundle
[ ! -d ~/.vim/bundle/vundle ] && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#Vundle.vim
[ ! -d ~/.vim/bundle/Vundle.vim ] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

CUR_DIR=$(cd `dirname $0`;pwd)
VIM_PLUG=$HOME/.vim/bundle

# compile YouCompleteMe and install tern_for_vim
cd $VIM_PLUG/tern_for_vim 
git submodule update --init --recursive
npm install

cd $VIM_PLUG/YouCompleteMe
git submodule update --init --recursive
# javascript and clang complete
./install.py --tern-completer --clang-completer
cd "$CUR_DIR"

