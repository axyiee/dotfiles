 #!/bin/sh

# Keyboard layout
setxkbmap -layout us -variant intl

# Color scheme
xrdb -merge ~/.Xresources
xrdb -merge ~/.cache/wal/colors.Xresources

# Window manager
exec dwm

