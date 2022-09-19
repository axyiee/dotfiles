#!/bin/sh

cu(){ cut -d " " -f"$1" ;}

c(){ echo $(( ( ( $2 - $3 ) / 2 ) + $1 - $4)) ;}

wid=$(echo "$(pfw)" | tr "a-z" "A-Z")
bspc query -N -n "${wid}.floating" || exit

b=$(bspc config border_width)
s=$(wattr wh $wid)
m=$(wattr xywh $(xdo id -a "$(bspc query -M --names)"))

x="$(c $(echo $m | cu 1 ) \
    $(echo $m | cu 3 ) \
    $(echo $s | cu 1 ) \
    $b)"

y="$(c $(echo $m | cu 2 ) \
    $(echo $m | cu 4 ) \
    $(echo $s | cu 2 ) \
    $b)"

wtp $x $y $(echo $s | cu 1 ) $(echo $s | cu 2 ) $wid

