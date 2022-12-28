#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\e[0m[\[\e[1;36m\]\u@\e[1;31m\h\e[97m  \e[1;95m\W\e[0m]\$ "
eval "$(zoxide init bash)"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -la'
export EDITOR="nvim"

binary_directories=("$HOME/.bin" "$HOME/.local/bin" "$HOME/go/bin" "$HOME/cargo/bin" "$HOME/.config/mpv/bin" "/usr/local/wine-proton/bin")
for dir in "${binary_directories[@]}"; do
    if [ -d "$dir" ]; then
        PATH="$dir:$PATH"
    fi
done
unset binary_directories

(xrdb -merge ~/.Xresources && kill -s USR1 $PPID &)
nvim() {
    xrdb -merge <<< "st.borderpx: 0"
    kill -s USR1 $PPID
    /usr/local/bin/nvim "$@"
    xrdb -merge ~/.Xresources
    kill -s USR1 $PPID
}

sumr() {
    if [ -z "$1" ]; then
        echo "Usage: sumr <process name>"
        return 1
    fi
    ps -ax -o rss,command | grep -E "$1" | grep -v grep | awk '{sum+=$1} END {print sum}' | awk '{print $1/1024}'
}

# pnpm
export PNPM_HOME="/home/axy/.local/share/pnpm"
if [ -d "$PNPM_HOME" ]
  then PATH="$PNPM_HOME:$PATH"
fi
# pnpm end
