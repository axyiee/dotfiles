 #!/bin/sh

# Color scheme
xrdb -merge ~/.Xresources
xrdb -merge ~/.cache/wal/colors.Xresources

# Color temperature
sct 4500

# Window manager
exec dwm

