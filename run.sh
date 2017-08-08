#!/usr/bin/env bash
SESSION=msf

function start_tmux
{
    ## Prevent tmux from complaining about locales
    sed -i "s/# fr_CH.UTF-8 UTF-8/fr_CH.UTF-8 UTF-8/g;s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g" /etc/locale.gen
    locale-gen &>/dev/null
    tmux -2 new-session -d -s $SESSION
    tmux select-pane -t 0
    tmux rename-window -t 0 'msfconsole'
}


case $1 in
    start_msf*)
        # Default behaviour when starting
        start_tmux
        tmux send-keys "msfdb init ; msfdb start ; apt-get update ; apt-get upgrade -y metasploit-framework ; msfconsole" C-m
        tmux attach -t $SESSION
        ;;
    msfconsole*)
        # If we start a handler directly usualy we want the whole thing so start tmux
        start_tmux
        tmux send-keys "msfdb init ; msfdb start ; apt-get update ; apt-get upgrade -y metasploit-framework; export TERM=xterm; exec $@" C-m
        tmux attach -t $SESSION
        ;;
    tmux*)
        start_tmux
        shift
        tmux send-keys "exec $@" C-m
        tmux attach -t $SESSION
        ;;
    *)
        exec $@
        ;;
esac

