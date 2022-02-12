#!/bin/sh
KERNEL="linux-tkg-bmq-generic_v3-headers linux-tkg-bmq-generic_v3"
FONTS="inter-font ttf-joypixels ttf-fira-code nerd-fonts-fira-code"
XORG="xorg-server xorg-xinit xorg-xrandr feh"
WM="sxhkd-git bspwm-git polybar picom-jonaburg-git xfce-polkit dunst-git rofi"
AUDIO="pipewire pipewire-pulse pipewire-alsa pipewire-media-session pavucontrol"
SHELL="zsh starship alacritty"
PKG_MANAGER="yay"
SCRIPTS="go"
VIDEO_DRIVERS="mesa-tkg-git"
TOOLS="exa autoconf automake flameshot"

$PKG_MANAGER -Sy --needed $TOOLS $KERNEL $FONTS $XORG $WM $AUDIO $SHELL $SCRIPTS $VIDEO_DRIVERS
