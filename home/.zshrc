# If not running interactively, don't do anything
[[ $- != *i* ]] && return

setopt GLOB_DOTS
unsetopt SHARE_HISTORY

# Preferences
export HISTCONTROL=ignoreboth:erasedups
export EDITOR='nvim'
export VISUAL='nvim'
zstyle ':completion:*:ssh:*' hosts off
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
export FZF_DEFAULT_OPTS='--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp -Dswing.aatext=true -Dsun.java2d.xrender=true'

# Useful aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'
alias sr="sudo reboot"
alias xbps="doas pacaptr"

if [ -d "$HOME/.bin" ];
  then PATH="$HOME/.bin:$PATH"
fi 

if [ -d "$HOME/.local/bin" ]; 
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ];
 then PATH="$HOME/.cargo/bin:$PATH"
fi 

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="/opt/lutris-GE-Proton7-20-x86_64/bin:$PNPM_HOME:$PATH"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xvf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzvf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xvf $1    ;;
      *.tar.zst)   tar xvf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions fzf-tab)

# Path to your oh-my-zsh installation.
ZSH_THEME="robbyrussell"
export ZSH="$HOME/.oh-my-zsh"

# Finally, load Zoxide
eval "$(zoxide init zsh)"

azf

# jk, finally loading omz
source $ZSH/oh-my-zsh.sh

