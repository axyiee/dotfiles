#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Resolution and overscan fix
xrandr --output HDMI-A-0 --mode 1920x1080 --rate 60 --set underscan on --set "underscan hborder" 100 --set "underscan vborder" 50

# Keyboard layout
setxkbmap -layout us -variant intl

# Wallpaper
#WALLPAPER="$HOME/Wallpapers/artwork/wallhaven-q2elyl.jpg"
WALLPAPER="$HOME/Wallpapers/artwork/YetAnotherSeaWallpaper.jpg"
~/.config/dwm/scripts/solid_wallpaper.sh "$WALLPAPER"

# Color scheme
xrdb -merge ~/.Xresources
xrdb -merge ~/.cache/wal/colors.Xresources

# Compositor
picom --experimental-backends &

# Audio
bash "$HOME"/.config/dwm/scripts/pipewire-server &

# Notifications
dunst -c ~/.config/dunst/dunstrc &

# Disable screen blanking
# xset -dpms s off

# Scriptable status bar
#bash "$HOME"/.config/dwm/scripts/status_bar.sh &
bash "$HOME"/.config/polybar/launch.sh &

# Window manager
exec dwm

