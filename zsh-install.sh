#!/bin/bash
zsh --version
chsh -s $(which zsh)

CUR_DIR=$(cd `dirname $0`;pwd)
TMP_DIR=$CUR_DIR/tmp
DEPS_DIR=$HOME/deps

[ ! -d $TMP_DIR ] && mkdir $TMP_DIR  
[ ! -d $DEPS_DIR ] && mkdir $DEPS_DIR

cd $DEPS_DIR 

if [ ! -d $DEPS_DIR/powerline ]; then
    git clone https://github.com/Lokaltog/powerline.git
fi 

cd powerline
python setup.py install

# install powerline font
cd $TMP_DIR

[ ! -f $TMP_DIR/PowerlineSymbols.otf ] && wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf 

[ ! -f "$TMP_DIR/10-powerline-symbols.conf" ] && wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

if [ ! -f ~/.fonts/PowerlineSymbols.otf ]; then
    mkdir -p ~/.fonts/
    cp PowerlineSymbols.otf ~/.fonts/
fi

[ -d ~/Library/Fonts ] && cp PowerlineSymbols.otf ~/Library/Fonts/

if ! fc_loc=$(which fc-cache) || [ -z "$fc_loc" ]; then
    brew install fontconfig
fi

if [ ! -f ~/.config/fontconfig/conf.d ]; then
    mkdir -p ~/.config/fontconfig/conf.d/
    cp 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fi

#fc-cache -vf ~/.fonts

cd $TMP_DIR
[ ! -d $TMP_DIR/autojump ] && git clone git://github.com/joelthelion/autojump.git

./install.py
cd $CUR_DIR

# oh my zsh
export ZSH=$DEPS_DIR/.oh-my-zsh
[ ! -d $DEPS_DIR/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo current shell is $(echo $SHELL)

cd $CUR_DIR
