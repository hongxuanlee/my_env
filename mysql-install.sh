#!/bin/bash
CUR_DIR=$(cd `dirname $0`; pwd);
if ! mysql_loc=$(type -p "mysql") || [ -z "$mysql_loc" ]; then
    brew install mysql
fi

unset TMPDIR

sudo rm -f /etc/my.cnf
sudo ln -s $CUR_DIR/my.cnf /etc/my.cnf
