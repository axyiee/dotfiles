#!/bin/bash
if pidof -x "blur_wallpaper.sh" > /dev/null
then
	pkill -f "blur_wallpaper.sh"
else
    ~/.config/bspwm/scripts/blur_wallpaper.sh
fi
