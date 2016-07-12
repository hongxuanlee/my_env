#/bin/bash
CUR_DIR=$(cd `dirname $0`; pwd)
DEPS_DIR=$HOME/deps
function install_app(){
    if [ ! -n "$1" ] || [ ! -n "$2" ] || [ ! -n "$3" ]; then
        exit
    fi
    name=$1
    t=$2
    address=$3
    filename="$name$type"
    echo "\033[32m install $name \033[0m\n"
    echo $name $address $filename $t 
    if [ "$type" -eq "dmg" ]; then
        cd $DEPS_DIR
        [ ! -e $DEPS_DIR/$filename ] && curl -o $filename $address  
        hdiutil attach "$filename"
        cd /Volumes/Shadowsocks
        sudo cp -R "$name.app" ./Applications
        cd $DEPS_DIR
        hdiutil detach "/Volumes/$name"   
    fi
}

while read LINE
do
    install_app $LINE
done < "$CUR_DIR/app.conf"


