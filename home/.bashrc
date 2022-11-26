#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\e[1;95m[\[\e[1;32m\]\u\e[1;32m@\h\e[97m  \W\e[95m]$\e[0m\] "
eval "$(zoxide init bash)"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -la'

screenshot() {
    maim ~/Pictures/$(date +%s).png
}

if [ -d "$HOME/.bin" ]
  then PATH="$HOME/.bin:$PATH"
fi 

if [ -d "$HOME/.local/bin" ]
  then PATH="$HOME/.local/bin:$PATH"
fi

#if [ "$(tput cols)" -gt 95 ]; then
#    "$HOME/.dots/scripts/pacman_color_script.sh" 
#else
#    "$HOME/.dots/scripts/crunch_color_script.sh"
#fi
