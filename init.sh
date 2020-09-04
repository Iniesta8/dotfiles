#!/bin/sh

#SESSION_NAME=${PWD##*/} # Current directory name will be used as session name
SESSION_NAME=dev

#eval `ssh-agent -s` >/dev/null
ssh-add

TERM=screen-256color tmux new -t $SESSION_NAME
