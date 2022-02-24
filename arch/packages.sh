#!/bin/sh
KERNEL="linux-tkg-bmq-generic_v3-headers linux-tkg-bmq-generic_v3"
FONTS="inter-font ttf-joypixels ttf-fira-code nerd-fonts-fira-code"
XORG="xorg-server xorg-xinit xorg-xrandr xclip feh"
WM="sxhkd-git bspwm-git polybar picom-jonaburg-git xfce-polkit dunst-git rofi"
AUDIO="pipewire pipewire-pulse pipewire-alsa pipewire-media-session pavucontrol"
SHELL="zsh starship alacritty zsh-autosuggestions zsh-syntax-highlighting"
PKG_MANAGER="yay"
VIDEO_DRIVERS="mesa-tkg-git"
TOOLS="ungoogled-chromium exa autoconf automake flameshot neovim nvim-packer-git neofetch git-delta-git bat fzf tree maim"
LANGUAGES="nodejs-lts-gallium npm yarn"

$PKG_MANAGER -Sy --needed $TOOLS $KERNEL $FONTS $XORG $WM $AUDIO $SHELL $VIDEO_DRIVERS $LANGUAGES
