#!/bin/zsh
#tmux new-session -d -n proj Command
tmux new-window -n proj
tmux split-window -v -p 20
tmux selectp -t 1
#tmux split-window -h
#tmux selectw -t 1
#tmux -2 attach-session -d
