#!/bin/bash

FILE="$HOME/Pictures/screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"

maim -s -u "$FILE"
cat "$FILE" | xclip -selection clipboard -t image/png
