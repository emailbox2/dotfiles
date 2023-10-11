#!/bin/sh

if [ "$(id -u)" != "0" ]; then
    RUN_AS_ROOT='sudo'
else
    RUN_AS_ROOT=''
fi


$RUN_AS_ROOT apt -y install zoxide
