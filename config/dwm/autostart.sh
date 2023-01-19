#!/bin/sh

# Wallpaper
if [ -f ~/.fehbg ]; then
    ~/.fehbg &
fi

# Compositor
picom --experimental-backends --config "$HOME/.config/picom/picom.conf" &

# Swallowing daemon
sw &

# Notifications
# dunst -c ~/.config/dunst/dunstrc &

# Disable screen blanking
# xset -dpms s off

# Scriptable status bar
xsetroot -name " "
bash "$HOME"/.config/dwm/status_bar.sh &

