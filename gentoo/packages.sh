#!/bin/bash
# Ask for root access
if [ "$UID" -ne 0 ]; then
    echo "[!] This script must be ran as root."
    exit
fi

emerge --verbose dev-vcs/git app-eselect/eselect-repository
emerge --sync

# need to install lfimg and web browser manually
# https://github.com/cirala/lfimg

emerge --ask --verbose media-fonts/inter media-fonts/noto-emoji media-fonts/noto-cjk media-fonts/jetbrains-mono \
    x11-base/xorg-drivers x11-apps/xrandr x11-misc/xclip media-libs/mesa x11-drivers/xf86-video-amdgpu \
    media-libs/fontconfig media-gfx/feh media-sound/pulseaudio media-video/pipewire media-sound/pavucontrol \
    x11-wm/bspwm x11-misc/sxhkd x11-misc/polybar x11-misc/dunst x11-terms/kitty x11-misc/rofi \
    app-shells/zsh-autosuggestions app-shells/zsh-syntax-highlighting app-shells/fzf sys-apps/dbus \
    net-wireless/wpa_supplicant net-misc/dhcpcd sys-kernel/linux-firmware sys-apps/usb_modeswitch \
    media-gfx/maim x11-apps/setxkbmap x11-misc/picom-animations app-shells/zoxide x11-misc/wmutils-core \
    x11-misc/xdo x11-misc/xdotool media-gfx/ueberzug media-sound/playerctl dev-python/dbus-python media-sound/pamixer dev-libs/libinput x11-apps/xinput app-misc/tmux x11-misc/qt5ct media-libs/vulkan-loader

# Enabling all required services
rc-update add wpa_supplicant
rc-update add dbus
rc-update add dhcpcd

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

(mkdir -p ~/.themes && cd ~/.themes && wget https://github.com/catppuccin/gtk/releases/download/update_23_02_2022/Catppuccin-purple.zip && unzip Catppuccin-purple.zip && rm -f Catppuccin-yellow.zip)

PACKER_PATH="/home/$USER/.local/share/nvim/site/pack/packer/start/packer.nvim"
PACKER_REPO="https://github.com/wbthomason/packer.nvim"

git clone --depth 1 $PACKER_REPO $PACKER_PATH
