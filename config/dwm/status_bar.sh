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

datetime() {
    local date=`date +"%a, %d %b"`
    echo "[  $date]"
}

clock() {
    local date=`date +"%H:%M"`
    echo "[  $date]"
}

volume() {
    local volume=`mixer | awk -F ':' '/vol/{print $2}'`
    local icon=""
    if [ -z "$volume" ]; then
        volume-"(?)"
    fi
    if [ "$volume" = "muted" ]; then
        volume="Muted"
    else
        if [ "$volume" -gt 75 ]; then
            icon=""
        elif [ "$volume" -gt 25 ]; then
            icon=""
        fi
        volume="$volume%"
    fi
    echo "[$icon  $volume]"
}

ram() {
    local ram=`free -m | grep Mem: | awk '{print $3}'`
    echo "[  ${ram}MiB]"
}

while true; do
    xsetroot -name "$(volume)  $(datetime)  $(clock)"
    sleep 2
done
