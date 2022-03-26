#!/bin/bash

# Ask for root access
if [ "$UID" -ne 0 ]; then
    echo "[!] This script must be ran as root."
    exit
fi

DIRNAME=$(dirname "$(realpath "$0")")
cd "$DIRNAME"

for file in *; do 
    rm -rf "/etc/portage/$file"
    ln -nfs "$PWD/$file" "/etc/portage/$file"
done
