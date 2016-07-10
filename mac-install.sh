#!/bin/bash
echo -e "\033[32m install mac's basic softwares \033[0m\n"

CUR_DIR=$(cd `dirname $0`; pwd)
MYDPES_DIR=$HOME/deps
TMP_DIR=$CUR_DIR/tmp
APPS_DIR=/Applications

[ ! -d $MYDPES_DIR ] &&  mkdir $MYDPES_DIR
[ ! -d $TMP_DIR ] && mkdir $TMP_DIR

echo -e "\033[32m install brew \033[0m\n"
if ! brew_loc="$(type -p "brew")" || [ -z "$brew_loc" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\033[32m install zsh \033[0m\n"
if ! zsh_loc="$(type -p "zsh")" || [ -z "$zsh_loc" ]; then
    brew install zsh
fi

echo -e "\033[32m install wget \033[0m\n"
if ! wget_loc="$(type -p "wget")" || [ -z "$wget_loc" ]; then
    brew install wget
fi

# echo -e "\033[32m install openssl \033[0m\n"
# brew install openssl
# sudo brew link --force openssl

# install shadowsocks
echo -e "\033[32m install shadowsocks \033[0m\n"
cd $MYDPES_DIR
if [ ! -e $APPS_DIR/ShadowsocksX.app ];  then
	[ ! -e $MYDPES_DIR/ShadowsocksX-2.6.3.dmg ] && curl -O "https://github.com/shadowsocks/shadowsocks-iOS/releases/download/2.6.3/ShadowsocksX-2.6.3.dmg"
	hdiutil attach ShadowsocksX-2.6.3.dmg
	cd /Volumes/Shadowsocks
	#sudo installer -pkg ShadowsocksX.app -target "/Application"
    sudo cp -R ShadowsocksX.app ./Applications
    cd $MYDPES_DIR
    hdiutil detach /Volumes/Shadowsocks
fi

echo -e "\033[32m install dockutil \033[0m\n"
# dock 
# https://github.com/kcrawford/dockutil.git
cd $MYDPES_DIR

[ ! -d $MYDPES_DIR/dockutil ] && git clone https://github.com/kcrawford/dockutil.git

echo -e "\033[32m set mac preference \033[0m\n"
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
osascript -e 'tell application "System Events" to set the autohide of the dock preferences to true'
$MYDPES_DIR/dockutil/scripts/dockutil --remove all
$MYDPES_DIR/dockutil/scripts/dockutil --add $APPS_DIR/Google\ Chrome.app
$MYDPES_DIR/dockutil/scripts/dockutil --add $APPS_DIR/iTerm\ 2.app
$MYDPES_DIR/dockutil/scripts/dockutil --add /Applications/System\ Preferences.app
$MYDPES_DIR/dockutil/scripts/dockutil --add /Applications/WebStorm.app
$MYDPES_DIR/dockutil/scripts/dockutil --add /Applications/钉钉.app
$MYDPES_DIR/dockutil/scripts/dockutil --add /Applications/Sublime\ Text.app
# finder
defaults write com.apple.finder AppleShowAllFiles FALSE

# tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo -e "\033[32m add login items \033[0m\n"
# add login item
eval "osascript -e 'tell application \"System Events\" to make login item at end with properties {path:\"$APPS_DIR/ShadowsocksX.app\", hidden:false}'"

eval "osascript -e 'tell application \"System Events\" to make login item at end with properties {path:\"$APPS_DIR/Spectacle.app\", hidden:false}'"

eval "osascript -e 'tell application \"System Events\" to make login item at end with properties {path:\"$APPS_DIR/TotalSpaces2.app\", hidden:false}'"

killall Finder

cd $CUR_DIR
