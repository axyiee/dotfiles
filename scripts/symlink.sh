#!/bin/bash 
	
cd "$(dirname "$0")/.."
HOME="/home/$USER"

shopt -s dotglob
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

ln -nfs "$SCRIPTPATH/../wallpapers" "$HOME/wallpapers"
ln -nfs "$SCRIPTPATH/../scripts" "$HOME/dot-scripts" 

do_symlink() {
    mkdir -p "$1"
    for file in ./*; do 
        if [ -e "$1/$file" ]; then
            rm -rf "$1/$file.bak"
            mv "$1/$file" "$1/$file.bak"
        fi
        ln -nfs "$PWD/$file" "$1/$file"
    done
}
SYMLINK_FUNC=$(declare -f do_symlink)

cd home
do_symlink "$HOME"

cd ../config
do_symlink "$HOME/.config"

cd ../etc
if [ "$EUID" -ne 0 ]
    then do_symlink /etc
    else sudo bash -c "$SYMLINK_FUNC; do_symlink /etc"
    fi

cd ../fonts
if [ "$EUID" -ne 0 ]
    then do_symlink /usr/share/fonts/ttf
    else bash -c "$SYMLINK_FUNC; do_symlink /usr/share/fonts/ttf" 
    fi
