Xresources="$(cat ~/.config/dwm/theme/current.Xresources)"
color0="$(echo "$Xresources" | grep -oP '\*\.color0_darker:\s*\K.*')"
hsetroot -solid "$color0"

