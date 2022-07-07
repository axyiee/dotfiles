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
#xrandr --output HDMI-1 --set underscan on --set "underscan hborder" 100 --set "underscan vborder" 50 &
xrandr --output HDMI-A-0 --mode 1920x1080 --rate 60 --set underscan on  --set "underscan hborder" 100 --set "underscan vborder" 50

xrdb -merge ~/.Xresources
setxkbmap -layout us -variant intl

# Disable blanking screen => xset -dpms s off
# Execute the Window Manager
#exec bspwm
#exec dbus-run-session river
exec dbus-run-session bspwm
