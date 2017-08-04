#!/usr/bin/env bash

if [ "$1" == "start_msf" ]; then

    msfdb init
    msfdb start

    apt-get update
    apt-get upgrade -y metasploit-framework

    ## Prevent tmux from complaining about locales
    export LANG=fr_CH.UTF-8
    locale-gen fr_CH.UTF-8
    localedef -f UTF-8 -i fr_CH fr_CH.UTF-8

    # msfupdate
    tmux new-session -d -s "msf" "msfconsole -L"
fi

tmux attach
exec "$@"
