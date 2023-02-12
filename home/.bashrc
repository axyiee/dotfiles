#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\e[0m[\[\e[1;36m\]\u@\e[1;31m\h\e[97m  \e[1;95m\W\e[0m]\$ "
eval "$(zoxide init bash)"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -la'

export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"


