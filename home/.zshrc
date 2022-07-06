setopt GLOB_DOTS
#share commands between terminal instances or not
#unsetopt SHARE_HISTORY
setopt SHARE_HISTORY

if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
    #exec river
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Preferences
export HISTCONTROL=ignoreboth:erasedups
export EDITOR='nvim'
export VISUAL='nvim'
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true' # Improve text rendering in AWT apps
zstyle ':completion:*:ssh:*' hosts off
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
export FZF_DEFAULT_OPTS='--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'

# Wine
export STAGING_SHARED_MEMORY=1
export STAGING_WRITECOPY=1
#export WINEESYNC=1 
export WINEFSYNC=1
export WINEFSYNC_FUTEX2=1
export DXVK_ASYNC=1 

# Add shortcut for toggling Alacritty padding setting
#switchallacrittyconfig() {
#	~/.config/alacritty/toggle-padding.sh
#}
#zle -N switchallacrittyconfig
#bindkey "^[x" switchallacrittyconfig

# Useful aliases
alias btop="btop --utf-force"
alias paudio="mpv --vo=null --video=no --no-video --term-osd-bar --no-resume-playback --shuffle"
alias tree="tree -C"
alias ls='ls --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

if [ -d "$HOME/.bin" ];
  then PATH="$HOME/.bin:$PATH"
fi 

if [ -d "$HOME/.local/bin" ]; 
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ];
 then PATH="$HOME/.cargo/bin:$PATH"
fi 

PATH="/opt/jdk-19/bin:$PATH"
JDK_HOME="/opt/jdk-19"
JAVA_HOME="/opt/jdk-19"
JAVAC="/opt/jdk-19/bin/javac"

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

function tomp3() {
 ffmpeg -i $1 -acodec libmp3lame $2
}
function toavi {
 ffmpeg -i $1 -c:v libx264 -c:a libmp3lame -b:a 384K $2
}
function toh265 {
 ffmpeg -i $1 -c:v libx265 -vtag hvc1 -c:a copy $2
}

function nvim {
	kitty @ set-spacing padding=0
	/usr/bin/nvim $*
	kitty @ set-spacing padding=default
}

# gentoo
#alias gupdate="doas emerge --ask --verbose --update --deep --newuse @world"

#alias startx="startx -- vt$(tty | sed -e 's|/dev/tty||')"

# Fetch system information befofre loading oh-my-zsh.
rxfetch

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions fzf-tab)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="flazz" #"robbyrussell"
export GPG_TTY=$(tty)

# Finally, load Zoxide
eval "$(zoxide init zsh)"

# jk, finally loading omz
source $ZSH/oh-my-zsh.sh

## fnm
#export PATH=/home/exst/.fnm:$PATH
#eval "`fnm env`"
