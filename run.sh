#!/usr/bin/env bash
SESSION=msf

tmux -2 new-session -d -s $SESSION
tmux select-pane -t 0
tmux rename-window -t 0 'msfconsole'

## Prevent tmux from complaining about locales
sed -i "s/# fr_CH.UTF-8 UTF-8/fr_CH.UTF-8 UTF-8/g;s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g" /etc/locale.gen
locale-gen

if [ "$1" == "start_msf" ]; then
    tmux send-keys "msfdb init ; msfdb start ; apt-get update ; apt-get upgrade -y metasploit-framework ; msfconsole" C-m
    tmux attach -t $SESSION
fi

tmux send-keys "exec $@" C-m
tmux attach -t $SESSION
