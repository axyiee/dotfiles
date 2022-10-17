#!/bin/sh

themes=("zenbones-light.Xresources" "zenbones-dark.Xresources")
theme=${themes[$(( $RANDOM % ${#themes[@]} ))]}
echo "Selecting: $theme"
base="$HOME/.config/dwm/theme"
ln -sf "$base/$theme" "$base/current.Xresources"
xrdb -merge "$base/current.Xresources"
"$HOME/.config/dwm/scripts/solid_wallpaper.sh"
pkill polybar
