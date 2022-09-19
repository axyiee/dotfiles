. ~/.cache/wal/colors.sh

clock() {
    printf "^c$color0^  "
    printf "^c$color1^ $(date +"%H:%M") "
}

while true; do
    sleep 1 && xsetroot -name "$(clock)"
done
