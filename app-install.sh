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
    if [ -d "/Applications/$name.app" ]; then
        echo "$name installed"
        return
    fi
    cd $DEPS_DIR
    [ ! -e $DEPS_DIR/$filename ] && curl -o $filename $address  
    if [ "$type" -eq "dmg" ]; then
        cd $DEPS_DIR
        hdiutil attach "$filename"
        cd "/Volumes/$filename"
        sudo mv -R "$name.app" ./Applications
        cd $DEPS_DIR
        hdiutil detach "/Volumes/$name"   
    fi
    if [ "$type" -eq "zip" ]; then
        cd $DEPS_DIR
        unzip filename
        hdiutil attach "$filename"
        cd "/Volumes/$filename"
        sudo mv -R "$name.app" ./Applications
        cd $DEPS_DIR
        hdiutil detach "/Volumes/$name"  
    fi   
}

while read LINE
do
    name=`echo $LINE | awk -F ',' '{print $1}'`
    t=`echo $LINE | awk -F ',' '{print $2}'`
    address=`echo $LINE | awk -F ',' '{print $3}'`
    echo $name
    install_app "$name" "$t" "$address"
done < "$CUR_DIR/app.conf"


