#!/bin/sh
pkill -9 polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
while true; do
    polybar --config="$HOME/.config/polybar/config.ini" --reload center
    sleep 0.1s
done
