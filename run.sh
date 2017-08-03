#!/usr/bin/env bash

if [ "$1" == "msfconsole" ]; then

    # /etc/init.d/postgresql start
    msfdb init
    msfdb start

    apt-get update
    apt-get upgrade -y metasploit-framework

    # msfupdate
    msfconsole -L

fi

exec "$@"
