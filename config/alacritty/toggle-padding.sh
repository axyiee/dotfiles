#!/bin/bash

cd "$(dirname "$0")"

if [ ! -f "active" ]; then
	echo "No active file found, exiting"
	exit 1
fi

ACTIVE=$(cat ./active)

rm -f ./alacritty.yml

case $ACTIVE in
	0)
		echo 1 > ./active
		cp ./alacritty.1.yml ./alacritty.yml
		;;
	1)
		echo 0 > ./active
		cp ./alacritty.0.yml ./alacritty.yml
		;;
	*)
		echo "Unknown active value, exiting"
		exit 1
		;;
esac
