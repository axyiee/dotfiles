#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

st_padding on

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias btop="btop --utf-force"
alias sr="sudo reboot"
alias ll='ls -la'
alias tap="yay"

nvim() {
    st_padding off
    /usr/bin/nvim $@
    st_padding on
}

if [ -d "$HOME/.bin" ]
  then PATH="$HOME/.bin:$PATH"
fi 

if [ -d "$HOME/.local/bin" ]
  then PATH="$HOME/.local/bin:$PATH"
fi

eval "$(zoxide init bash)"

azf

PS1="\e[1;95m[\[\e[1;32m\]\u\e[1;32m@\h\e[97m  \W\e[95m]$\e[0m\] "

if [ -f "$HOME/.cargo/env" ]
  then . "$HOME/.cargo/env"
fi

export PNPM_HOME="/home/exst/.local/share/pnpm"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PNPM_HOME:$PATH"
export GPG_TTY=$(tty)
