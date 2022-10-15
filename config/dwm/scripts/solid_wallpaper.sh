if [ -z "$1" ]; then
    echo "Usage: $0 <wallpaper_path>"
    exit -1
fi

# use pywal if it is not cached
if [ ! -f ~/.cache/wal/colors.Xresources ]; then
    wal -i $WALLPAPER 
fi

lighten() {
    local hex="$1"
    local amount="$2"
    local operation="+"
    local r=$(echo "$hex" | cut -c 2-3)
    local g=$(echo "$hex" | cut -c 4-5)
    local b=$(echo "$hex" | cut -c 6-7)
    r=$(printf "%x" "$((0x$r $operation $amount))")
    g=$(printf "%x" "$((0x$g $operation $amount))")
    b=$(printf "%x" "$((0x$b $operation $amount))")
    echo "#$r$g$b"
}

-- hsetroot -center "$1"
. ~/.cache/wal/colors.sh
hsetroot -solid "$color4"
#hsetroot -solid "$(lighten "$color0" 20)"
