#!/bin/sh
KERNEL="linux-tkg-bmq-generic_v3-headers linux-tkg-bmq-generic_v3"
FONTS="inter-font noto-fonts-emoji nerd-fonts-jetbrains-mono"
XORG="xorg-server xorg-xinit xorg-xrandr xclip feh"
WM="sxhkd-git bspwm-git polybar picom-animations-git xfce-polkit rofi"
AUDIO="pipewire pipewire-pulse pipewire-alsa pipewire-media-session lib32-pipewire pavucontrol easyeffects"
SHELL="zsh alacritty zsh-autosuggestions zsh-syntax-highlighting"
PKG_MANAGER="yay"
VIDEO_DRIVERS="mesa-tkg-git"
TOOLS="git firefox exa autoconf automake neovim nvim-packer-git neofetch tree maim authy ffmpeg zoxide pamixer tmux"
LANGUAGES="nodejs-lts-gallium npm yarn jdk-temurin rust rust-analyzer"

$PKG_MANAGER -Sy --needed $TOOLS $KERNEL $FONTS $XORG $WM $AUDIO $SHELL $VIDEO_DRIVERS $LANGUAGES $INTERNET

sudo systemctl enable --user --now pipewire pipewire-media-session pipewire-pulse

# Installing fonts 
wget https://yudit.org/download/fonts/UBraille/UBraille.ttf -P "$HOME"/.local/share/fonts/fonts/ttf
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip -P "$HOME"/.local/share/fonts/fonts/ttf
wget https://github.com/powerline/fonts/raw/master/SpaceMono/Space%20Mono%20for%20Powerline.ttf -P "$HOME"/.local/share/fonts/fonts/ttf 
wget https://github.com/powerline/fonts/raw/master/SpaceMono/Space%20Mono%20Italic%20for%20Powerline.ttf -P "$HOME"/.local/share/fonts/fonts/ttf
wget https://github.com/powerline/fonts/raw/master/SpaceMono/Space%20Mono%20Bold%20for%20Powerline.ttf -P "$HOME"/.local/share/fonts/fonts/ttf
wget https://github.com/powerline/fonts/raw/master/SpaceMono/Space%20Mono%20Bold%20Italic%20for%20Powerline.ttf -P "$HOME"/.local/share/fonts/fonts/ttf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Regular/complete/Space%20Mono%20Nerd%20Font%20Complete.ttf -P "$HOME"/.local/share/fonts/fonts/ttf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Regular/complete/Space%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -P "$HOME"/.local/share/fonts/fonts/ttf
(cd ~/.local/share/fonts/fonts/ttf && unzip JetBrainsMono.zip && rm -f JetBrainsMono.zip)
fc-cache -fv

# Installing oh-my-zsh and some plugins
(git init --quiet "$HOME"/.oh-my-zsh \
    && cd "$HOME"/.oh-my-zsh \
    && git config core.eol lf \
    && git config core.autocrlf false \
    && git config fsck.zeroPaddedFilemode ignore \
    && git config fetch.fsck.zeroPaddedFilemode ignore \
    && git config receive.fsck.zeroPaddedFilemode ignore \
    && git config oh-my-zsh.remote origin \
    && git config oh-my-zsh.branch master \
    && git remote add origin https://github.com/ohmyzsh/ohmyzsh.git \
    && git fetch --depth=1 origin \
    && git checkout -b master origin/master \
    || {
        [ ! -d "$HOME"/.oh-my-zsh ] || {
            cd -
            rm -rf "$HOME"/.oh-my-zsh 2>/dev/null
        }
        echo git clone of oh-my-zsh repo failed
        exit 1
    })
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab.git ~/.oh-my-zsh/custom/plugins/fzf-tab
git clone https://github.com/bikass/kora ~/.icons

(mkdir -p ~/.themes && cd ~/.themes && wget https://github.com/catppuccin/gtk/releases/download/update_23_02_2022/Catppuccin-yellow.zip && unzip Catppuccin-yellow.zip && rm -f Catpuccin-yellow.zip)

