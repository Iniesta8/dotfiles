#!/bin/sh

#SESSION_NAME=${PWD##*/} # Current directory name will be used as session name
SESSION_NAME=dev

eval `ssh-agent -s` >/dev/null
ssh-add

tmux -2 new -t $SESSION_NAME
