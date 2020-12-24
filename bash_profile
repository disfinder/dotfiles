#!/bin/bash

export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

# Eternal bash history.
PROMPT_COMMAND='history -a; history -c; history -r'
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTIGNORE="history"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

if [ -t 1 ]
then
    # we have a tty
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

alias gs='git status'
