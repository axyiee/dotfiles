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

# Color scheme
xrdb -merge ~/.Xresources
xrdb -merge ~/.config/dwm/theme/current.Xresources

# Window manager
exec dbus-run-session dwm

