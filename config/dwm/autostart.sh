#!/bin/sh

# Wallpaper
if [ -f ~/.fehbg ]; then
    ~/.fehbg
fi

# Compositor
picom --config "$HOME/.config/picom/picom.conf" &

# Notifications
# dunst -c ~/.config/dunst/dunstrc &

# Disable screen blanking
# xset -dpms s off

# Scriptable status bar
bash "$HOME"/.config/dwm/status_bar.sh &

