#!/bin/sh

case $1 in
    "--up")
        pamixer --increase 10
        ;;
    "--down")
        pamixer --decrease 10
        ;;
    "--mute")
        pamixer --toggle-mute
        ;;
    *)
        spotify="$(~/.config/polybar/scripts/spotify_status.py -f '{song} by {artist}')"
        if [ -z "$spotify" ]; then
            echo "  $(pamixer --get-volume-human) "
        else
            echo "  $spotify " #(  $(pamixer --get-volume-human)) "
        fi
esac
