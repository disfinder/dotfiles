#!/bin/bash
# _complete_ssh_hosts ()
# {
#         COMPREPLY=()
#         cur="${COMP_WORDS[COMP_CWORD]}"
#         comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
#                         cut -f 1 -d ' ' | \
#                         sed -e s/,.*//g | \
#                         grep -v ^# | \
#                         uniq | \
#                         grep -v "\[" ;
#                 cat ~/.ssh/config | \
#                         grep "^Host " | \
#                         awk '{print $2}'
#                 `
#         COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
#         return 0
# }
# complete -F _complete_ssh_hosts ssh

export HISTCONTROL=ignoreboth:erasedups
# HISTSIZE=1000
# HISTFILESIZE=20000
shopt -s histappend
PROMPT_COMMAND='history -a; history -c; history -r'
########################
# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
# 1000000
export HISTSIZE=
# 2000000
export HISTTIMEFORMAT="[%F %T] "
export HISTIGNORE="ls:ps:history"
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
# export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
########################


# You can use GIT_PROMPT_START_USER, GIT_PROMPT_START_ROOT, GIT_PROMPT_END_USER and GIT_PROMPT_END_ROOT in your .git-prompt-colors.sh to tweak your prompt. You can also override the start and end of the prompt by setting GIT_PROMPT_START and GIT_PROMPT_END before you source the gitprompt.sh.

GIT_PROMPT_START="\[\033[01;33m\]\t \[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\] \[\033[00m\]"
# GIT_PROMPT_START="\[\033[01;33m\]\t \[\033[01;32m\]\u@\h SSS"

GIT_PROMPT_END="\[\033[01;34m\] \n\$\[\033[00m\] "

 if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
     source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
 fi
#source ~/opt/git-prompt.sh
#GIT_PS1_SHOWCOLORHINTS=1

# export PS1="\[\033[01;33m\]\t \[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \n\$\[\033[00m\] "
#PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
# you can use this if you are using a black background:
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx



# dd the following line to your ~/.bash_profile or ~/.zshrc file (and remember
# to source the file to update your current session):
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# If you use the Fish shell then add the following line to your ~/.config/fish/config.fish:
#   [ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish



alias gs='git status'
alias gl='git ls'
alias gd='git diff'
alias gdt='git difftool'

if [ -t 1 ]
then
    # we have a tty
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

# Add the following lines to your ~/.bash_profile:
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

#You should set GROOVY_HOME:
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export DELBKEY="--private-key=~/develop/project/delb/hyb/ssh/id_rsa"


export PATH="${PATH}:/Users/disfinder/opt/bin/maestro-cli/bin"
export JAVA_HOME=$(/usr/libexec/java_home)

grepssh()
  {
    grep $1 -C 1 ~/.ssh/config --color
  }


# iterm shell integration
#source /Users/disfinder/opt/iterm2_shell_integration.bash

alias ls='gls --color'
alias ll='gls -lh --time-style long-iso --color'

#grc
#source /Users/disfinder/opt/grc.bashrc
# alias ll='gls -lh --time-style long-iso'


# color man
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode – red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode – bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode – yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode – cyan


setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}
stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }

stt_tab ""

diff_meld() {
open -W -a Meld --args $1 $2

}
