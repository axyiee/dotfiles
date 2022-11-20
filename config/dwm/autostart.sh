#!/bin/sh

# Wallpaper
if [ -f ~/.fehbg ]; then
    ~/.fehbg
else
    ~/.config/dwm/scripts/solid_wallpaper.sh
fi

# Compositor
picom --experimental-backends &

# Audio
bash "$HOME"/.config/dwm/scripts/pipewire-server &

# Notifications
dunst -c ~/.config/dunst/dunstrc &

# Disable screen blanking
# xset -dpms s off

# Scriptable status bar
bash "$HOME"/.config/dwm/scripts/status_bar.sh &

# bash "$HOME"/.config/polybar/launch.sh &
