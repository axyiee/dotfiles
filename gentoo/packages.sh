#!/bin/bash

# Ask for root access
if [ "$UID" -ne 0 ]; then
    echo "[!] This script must be ran as root."
    exit
fi

emerge --verbose dev-vcs/git app-eselect/eselect-repository

eselect repository enable elementary guru vifino-overlay
eselect repository add eexsty https://github.com/eexsty/gentoo-overlay
emerge --sync

# need to install polkit dumb agent, web browser manually
#https://github.com/sandsmark/polkit-dumb-agent

emerge --ask --verbose media-fonts/inter media-fonts/noto-emoji media-fonts/noto-cjk media-fonts/jetbrains-mono \
    x11-base/xorg-drivers x11-apps/xrandr x11-misc/xclip media-libs/mesa x11-drivers/xf86-video-amdgpu \
    media-libs/fontconfig media-gfx/feh media-sound/pulseaudio media-video/pipewire media-sound/pavucontrol \
    x11-wm/bspwm x11-misc/sxhkd x11-misc/polybar x11-misc/dunst x11-terms/alacritty x11-misc/rofi \
    app-shells/starship app-shells/zsh-autosuggestions app-shells/zsh-syntax-highlighting app-shells/fzf \
    sys-apps/dbus net-wireless/wpa_supplicant net-misc/dhcpcd sys-kernel/linux-firmware sys-apps/usb_modeswitch \
    media-gfx/maim x11-apps/setxkbmap x11-misc/picom-animations app-shells/zoxide x11-misc/wmutils-core \
    x11-misc/xdo x11-misc/xdotool


rc-update add wpa_supplicant
rc-update add dbus
rc-update add dhcpcd

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

curl -o ~/.local/share/fonts/fonts/ttf/UBraille.ttf "https://yudit.org/download/fonts/UBraille/UBraille.ttf"

fc-cache -fv

PACKER_PATH="/home/$USER/.local/share/nvim/site/pack/packer/start/packer.nvim"
PACKER_REPO="https://github.com/wbthomason/packer.nvim"

git clone --depth 1 $PACKER_REPO $PACKER_PATH
