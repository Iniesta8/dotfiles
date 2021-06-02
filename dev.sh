#!/bin/zsh

if command -v tmux &> /dev/null && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    tmux a -t dev &> /dev/null || tmux new -s dev;
fi

