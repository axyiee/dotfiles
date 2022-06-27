#!/bin/bash
if pgrep -x "picom" > /dev/null
then
	pkill picom
else
	picom --experimental-backends --config ~/.config/picom/picom.conf
fi
