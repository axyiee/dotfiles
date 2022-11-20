#!/bin/sh

themes=("zenbones-light.Xresources" "zenbones-dark.Xresources" "oxocarbon-dark.Xresources" "oxocarbon-light.Xresources" ".wpp")
theme=${themes[$(( $RANDOM % ${#themes[@]} ))]}
base="$HOME/.config/dwm/theme"
if [ $theme = ".wpp" ]; then
    wpp=$(ls ~/Wallpapers/* | shuf -n 1)
    echo "feh --bg-fill $wpp" > ~/.fehbg
    wal -i "$wpp"
    ln -sf "$HOME/.cache/wal/colors.Xresources" "$base/current.Xresources"
    mv ~/.config/qutebrowser/greasemonkey/darkreader.qutebrowser.js.bak ~/.config/qutebrowser/greasemonkey/darkreader.qutebrowser.js
    exit 0
fi
echo "Selecting: $theme"
ln -sf "$base/$theme" "$base/current.Xresources"
xrdb -merge "$base/current.Xresources"
if [[ $theme =~ .*-light.Xresources$ ]]; then
    mv ~/.config/qutebrowser/greasemonkey/darkreader.qutebrowser.js ~/.config/qutebrowser/greasemonkey/darkreader.qutebrowser.js.bak
else
    mv ~/.config/qutebrowser/greasemonkey/darkreader.qutebrowser.js.bak ~/.config/qutebrowser/greasemonkey/darkreader.qutebrowser.js
fi
"$HOME/.config/dwm/scripts/solid_wallpaper.sh"
pkill polybar
