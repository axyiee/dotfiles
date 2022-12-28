if ! python -c "import numpy" &> /dev/null; then
    echo "numpy not installed"
    exit 1
elif ! python -c "import matplotlib" &> /dev/null; then
    echo "matplotlib not installed"
    exit 1
fi

format() {
    local icon="$1"
    local text="$2"
    echo "^b$C0_1^^c$C7^ $icon ^b$C0^^c$C7^ $text ^d^"
}

set_color() {
    local color=$(xrdb -query | grep "*.color0:" | head -n 1 | cut -f 2)
    local python="
import sys
import matplotlib.colors as colors
import matplotlib.cm as cm
import numpy as np
color = sys.argv[1]
color = colors.to_rgb(color)
color = np.array(color)
color = color + (1 - color) * float(sys.argv[2])
color = np.clip(color, 0, 1)
color = colors.to_hex(color)
print(color)
"
    C0=$(python -c "$python" "$color" 0.075)
    C0_1=$(python -c "$python" "$color" 0.05)
    C7=$(xrdb -query | grep "*.color7:" | head -n 1 | cut -f 2)
}

datetime() {
    local date=`date +"%a, %d %b"`
    format "" "$date"
}

clock() {
    local date=`date +"%H:%M"`
    format "" "$date"
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
    format "$icon" "$volume"
}

set_color
while true; do
    xsetroot -name "$(volume)  $(datetime)  $(clock)"
    sleep 2
done
