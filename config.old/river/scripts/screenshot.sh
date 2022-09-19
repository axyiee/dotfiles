#!/bin/bash

FILE="$HOME/Pictures/screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"
grim -g "$(slurp)" "$FILE" | wl-copy
