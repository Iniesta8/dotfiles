#!/bin/sh

#SESSION_NAME=${PWD##*/} # Current directory name will be used as session name
SESSION_NAME=dev

TERM=screen-256color tmux new -t $SESSION_NAME
