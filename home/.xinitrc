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
xrandr --output HDMI-A-0 --mode 1920x1080 --rate 60 --set underscan on  --set "underscan hborder" 100 --set "underscan vborder" 50

# Keyboard layout
setxkbmap -layout us -variant intl

# Color scheme
xrdb -merge ~/.Xresources
xrdb -merge ~/.cache/wal/colors.Xresources

# Wallpaper
WALLPAPER="$HOME/Wallpapers/2mn8bo9krcx71.png"
feh --bg-scale $WALLPAPER

# use pywal if it is not cached
if [ ! -f ~/.cache/wal/colors.Xresources ]; then
    wal -i $WALLPAPER 
fi

# Compositor
picom --experimental-backends &

# Audio
pipewire &
pipewire-pulse &
wireplumber &

# Notifications
dunst -c ~/.config/dunst/dunstrc &

# Disable screen blanking
# xset -dpms s off

# Enable status bar script
bash ~/.config/dwm/status_bar.sh &

# Window manager
.exec dwm
