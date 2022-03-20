#!/bin/sh
KERNEL="linux-tkg-bmq-generic_v3-headers linux-tkg-bmq-generic_v3"
FONTS="inter-font noto-fonts-emoji nerd-fonts-cascadia-code adobe-source-code-pro-fonts ttf-ms-fonts"
XORG="xorg-server xorg-xinit xorg-xrandr xclip feh"
WM="sxhkd-git bspwm-git polybar picom-animations-git xfce-polkit rofi"
AUDIO="pipewire pipewire-pulse pipewire-alsa pipewire-media-session pavucontrol easyeffects"
SHELL="zsh starship alacritty zsh-autosuggestions zsh-syntax-highlighting"
PKG_MANAGER="yay"
VIDEO_DRIVERS="mesa-tkg-git"
INTERNET="wpa_supplicant dhcpcd dhcpcd-openrc wpa_supplicant-openrc"
TOOLS="git firefox exa autoconf automake neovim nvim-packer-git neofetch tree maim authy ffmpeg ffmpeg4.4 earlyoom earlyoom-openrc"
LANGUAGES="nodejs-lts-gallium npm yarn jdk-openj9-bin jdk-temurin rust rust-analyzer"

$PKG_MANAGER -Sy --needed $TOOLS $KERNEL $FONTS $XORG $WM $AUDIO $SHELL $VIDEO_DRIVERS $LANGUAGES $INTERNET

sudo rc-update add wpa_supplicant
sudo rc-update add earlyoom

