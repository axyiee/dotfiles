#!/bin/bash

FILE="$HOME/Pictures/screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"

maim -u /tmp/screenshot.png
feh -x -F -Y /tmp/screenshot.png &
id=$!
maim -s -u "$FILE"
cat "$FILE" | xclip -selection clipboard -t image/png
kill $id

