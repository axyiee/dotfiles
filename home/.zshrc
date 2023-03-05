#  export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="alanpeabody"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='nvim'
eval "$(zoxide init zsh)"

alias exa="/usr/bin/exa -a --color=always --group-directories-first --icons" 
alias ls="/usr/bin/exa -a --color=always --group-directories-first --icons" 

if [ -d "$HOME/.bin" ]
	then PATH="$HOME/.bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]
	then PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.cargo/bin" ]
	then PATH="$HOME/.cargo/bin:$PATH"
fi
if [ -d "$HOME/.config/mpv/bin" ]
	then PATH="$HOME/.config/mpv/bin:$PATH"
fi
if [ -d "$HOME/go/bin" ]
	then PATH="$HOME/go/bin:$PATH"
fi


if [ -e /home/run/.nix-profile/etc/profile.d/nix.sh ]; then . /home/run/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
