#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

amdgpu_mode() {
    if [ ! "$1" = "high" ] && [ ! "$1" = "auto" ] && [ ! "$1" = "cat" ]; then
        echo "Usage: $0 <high|auto|cat>"
    elif [ "$1" = "cat" ]; then
        cat /sys/class/drm/card0/device/power_dpm_force_performance_level
    else
        echo "Setting AMDGPU mode to $1..."
        echo $1 | doas tee /sys/class/drm/card0/device/power_dpm_force_performance_level
    fi
}

if [ -d "$HOME/.bin" ]
  then PATH="$HOME/.bin:$PATH"
fi 

if [ -d "$HOME/.local/bin" ]
  then PATH="$HOME/.local/bin:$PATH"
fi

eval "$(zoxide init bash)"
PS1="\e[1;95m[\[\e[1;32m\]\u\e[1;32m@\h\e[97m  \W\e[95m]$\e[0m\] "

if [ -f "$HOME/.cargo/env" ]
  then . "$HOME/.cargo/env"
fi

export PNPM_HOME="/home/exst/.local/share/pnpm"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PNPM_HOME:$PATH"
export GPG_TTY=$(tty)

if [ "$(tput cols)" -gt 95 ]; then
    st_padding on
    "$HOME/.dots/scripts/pacman_color_script.sh" 
else
    "$HOME/.dots/scripts/crunch_color_script.sh"
fi
