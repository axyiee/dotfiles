#!/bin/bash

#    ___  __           _      __     ____
#   / _ )/ /_ ______  | | /| / /__ _/ / /__  ___ ____  ___ ____
#  / _  / / // / __/  | |/ |/ / _ `/ / / _ \/ _ `/ _ \/ -_) __/
# /____/_/\_,_/_/     |__/|__/\_,_/_/_/ .__/\_,_/ .__/\__/_/
#                                    /_/       /_/
# If you're having an error, please set the background firstly using '--bg-scale'. '-bg-fill' is only supported if you edit this script manually.

# Script settings
DELAY_BETWEEN_TRANSITIONS=0.01
TRANSITION_QUALITY=0.3
BLUR_AMOUNT="25x25"
declare -a BLUR_TRANSITIONS
BLUR_TRANSITIONS=([10]="2x2" [20]="4x4" [30]="6x6" [40]="8x8" [50]="10x10" [60]="12x12" [70]="14x14" [80]="16x16" [90]="18x18" [100]="20x20")
UNBLUR_TRANSITIONS=([90]="40x40" [80]="30x30" [70]="20x20" [60]="10x10" [50]="8x8" [40]="6x6" [30]="4x4" [20]="2x2" [10]="0x0")

# Get the absolute path of the wallpaper.
function get_path {
    # Get the command-line for setting the current wallpaper then get the
    # content after '--bg-scale ' and before '-blurred.png'.
    content=$(cat ~/.fehbg | sed -n 's/^.*--bg-scale \(.*\)$/\1/p' | tr -d "'")
    content=${content::-1}
    content=${content%%-blurred.png*}
    content=${content%%-transition*}
    echo $content
}

# Create an .gitignore file if it doesn't exist, to avoid accidentally committing
# these files.
IGNORE="$(dirname "$(get_path)")/.gitignore"
if [ ! -f "$IGNORE" ]; then 
    echo "Creating ignore file..."
    echo "*-blurred.png*" >> "$IGNORE"
fi

# Create transitions for changing wallpapers.
function change_wallpaper {
    old="$LAST_NAME"
    old=${old%%-transition*}
    new="$1"
    if [ "$old" == "$new" ]; then
        echo "No new wallpaper found for transition."
        return
    fi
    echo "Changing wallpaper: '$old' => '$new'"

    # Create a transition of blurring
    for amount in `seq 10 10 100`; do
        name="$old-transition-old$amount.jpg"
        if [ ! -f "$name" ]; then
            echo "Creating transition for old wallpaper => $amount%"
            convert "$old" -blur "${BLUR_TRANSITIONS[$amount]}" -quality $TRANSITION_QUALITY "$name"
        fi
        feh --bg-scale "$name"
        sleep $DELAY_BETWEEN_TRANSITIONS
    done
    for amount in `seq 90 -10 10`; do
        name="$new-transition-new$amount.jpg"
        if [ ! -f "$name" ]; then
            echo "Creating transition for new wallpaper => $amount%"
            convert "$new" -blur "${UNBLUR_TRANSITIONS[$amount]}" -quality $TRANSITION_QUALITY "$name"
        fi
        feh --bg-scale "$name"
        sleep $DELAY_BETWEEN_TRANSITIONS
    done
    feh --bg-scale "$new"
}

# Create a blurred wallpaper.
function blur {
    convert "$1" -blur "$BLUR_AMOUNT" "$1-blurred.png"
}

# Set back to the default wallpaper and delete all blurred ones to clean up disk space
# when this script is shut down.
function down {
    content=`get_path`
    dir=`dirname "$content"`
    rm -f "$dir/*-transition*.jpg"
    rm -f "$dir/*-blurred.png*"
    feh --bg-scale "$content"
    exit 1
}
trap down EXIT

LAST_NAME=`get_path`

# Set the current wallpaper to the blurred one.
bspc subscribe | while read -r line; do
    desktop=`bspc query -D -d focused --names`
    nodes=`bspc query -N -d "$desktop" -n .window.\!hidden | wc -l`
    content=`get_path`
    name="$content"

    if [ "$nodes" != "0" ]; then
        # Check if the blurred wallpaper already exists.
        if [ ! -f "$content-blurred.png" ]; then
            blur "$content"
        fi
        name="$name-blurred.png"
    fi
    change_wallpaper "$name"
    LAST_NAME="$name"
done
