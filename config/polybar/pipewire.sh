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
        pamixer --get-volume-human
esac
