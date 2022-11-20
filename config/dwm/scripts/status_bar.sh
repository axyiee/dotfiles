print_with_icon() {
    local background1=$1
    local foreground1=$2 
    local background2=$3
    local foreground2=$4
    local icon=$5
    local text2=$6
    printf "^b$background1^^c$foreground1^ $icon "
    printf "^b$background2^^c$foreground2^ $text2 ^d^"
}

darken() {
    local python="
def darken(hexadecimal, amount):
    hex = hexadecimal.lstrip('#')
    r = int(hex[0:2], 16)
    g = int(hex[2:4], 16)
    b = int(hex[4:6], 16)
    r = max(0, r - amount)
    g = max(0, g - amount)
    b = max(0, b - amount)
    return '#%02x%02x%02x' % (r, g, b)
print(darken('$1', $2))"
    python -c "$python"
}

lighten() {
    local python="
def lighten(hexadecimal, amount):
    hex = hexadecimal.lstrip('#')
    r = int(hex[0:2], 16)
    g = int(hex[2:4], 16)
    b = int(hex[4:6], 16)
    r = min(255, r + amount)
    g = min(255, g + amount)
    b = min(255, b + amount)
    return '#%02x%02x%02x' % (r, g, b)
print(lighten('$1', $2))"
    python -c "$python"
}

#color1='#e0efda'
#color2='#efc7e5'
#color3='#b3c2f2'
#color4='#cc5a71'
#color5='#f2c078'
#color6='#83bcff'
#color0="$color6"
datetime() {
    local date=`date +"%a, %d %b"`
    print_with_icon "$color1" "$color0" "$color2" "$color0" "" "$date"
}

clock() {
    local date=`date +"%H:%M"`
    print_with_icon "$color1" "$color0" "$color2" "$color0" "" "$date"
}

battery() {
    local battery=`acpi -b | grep -Eo '[0-9]+%' | sed 's/%//'`
    local status=`acpi -b | grep -Eo 'Charging|Discharging'`
    local icon="Error"
    if [ -z "$battery" ]; then 
        echo ""
        return
    fi
    if [ "$status" = "Charging" ]; then
        icon=""
    elif [ "$battery" -gt 75 ]; then
        icon=""
    elif [ "$battery" -gt 50 ]; then
        icon=""
    elif [ "$battery" -gt 25 ]; then
        icon=""
    else
        icon=""
    fi
    print_with_icon "$color1" "$color0" "$color2" "$color0" "$icon" "$battery%%"
    printf " "
}

volume() {
    local volume=`pamixer --get-volume-human | sed 's/\%//'`
    local icon=""
    if [ -z "$volume" ]; then
        echo ""
        return
    fi
    if [ "$volume" = "muted" ]; then
        volume="Muted"
    else
        if [ "$volume" -gt 75 ]; then
            icon=""
        elif [ "$volume" -gt 25 ]; then
            icon=""
        fi
        volume="$volume%%"
    fi
    print_with_icon "$color1" "$color0" "$color2" "$color0" "$icon" "$volume"
    printf " "
}

ram() {
    local ram=`free -m | grep Mem: | awk '{print $3}'`
    print_with_icon "$color1" "$color0" "$color2" "$color0" "" "${ram}MiB"
}

connection() {
    local icon="睊"
    local message="Disconnected"
    if : >/dev/tcp/8.8.8.8/53; then
        icon="直"
        message="Connected"
    fi
    print_with_icon "$color1" "$color0" "$color2" "$color0" "$icon" "$message"
}

while true; do
    Xresources="$(cat ~/.config/dwm/theme/current.Xresources)"
    bg="$(echo "$Xresources" | grep -oP '\*\.color0:\s*\K.*')"
    color2=$(darken "$bg" 20)
    color1=$(darken "$bg" 10)
    color0=$(echo "$Xresources" | grep -oP '\*\.color14:\s*\K.*')
    xsetroot -name "$(connection) $(ram) $(volume)$(battery)$(datetime) $(clock)"
    sleep 3
done
