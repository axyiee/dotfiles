 #!/bin/sh

# Color scheme
xrdb -merge ~/.config/xrdb/root
xrdb -merge ~/.cache/wal/colors.Xresources

# Color temperature
sct 4500

# Window manager
exec dbus-run-session dwm

