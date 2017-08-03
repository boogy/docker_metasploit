#!/usr/bin/env bash

if [ "$1" == "metasploit" ]; then

    # /etc/init.d/postgresql start
    msfdb init
    msfdb start

    apt-get update
    apt-get upgrade -y metasploit-framework

    echo deb http://http.kali.org/kali kali-rolling main contrib non-free >> /etc/apt/sources.list
    /usr/share/metasploit-framework/msfupdate
    /usr/share/metasploit-framework/msfconsole# Throw us into the Metasploit console

fi

exec "$@"
