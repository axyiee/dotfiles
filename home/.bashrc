#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias btop="btop --utf-force"
alias sr="sudo reboot"

if [ -d "$HOME/.bin" ]
  then PATH="$HOME/.bin:$PATH"
fi 

if [ -d "$HOME/.local/bin" ]
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]
 then PATH="$HOME/.cargo/bin:$PATH"
fi 

nvim() {
	#kitty @ set-spacing padding=0
	/usr/bin/nvim $*
	#kitty @ set-spacing padding=default
}

eval "$(zoxide init bash)"
free -h
. "$HOME/.cargo/env"
