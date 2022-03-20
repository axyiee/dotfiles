#!/bin/bash

#maim -s | xclip -selection clipboard -t image/png
maim -u /tmp/screenshot.png
feh -x -F /tmp/screenshot.png &
id=$!
maim -s -u | xclip -selection clipboard -t image/png
kill $id

