#!/bin/bash 
	
cd "$(dirname "$0")/.."

shopt -s dotglob
ln -nfs "$PWD/wallpapers" "$HOME/wallpapers"
ln -nfs "$PWD/scripts" "$HOME/dot-scripts" 

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
    then sudo bash -c "$SYMLINK_FUNC; do_symlink /etc"
    else do_symlink /etc
fi

cd ../fonts
if [ "$EUID" -ne 0 ]
    then bash -c "$SYMLINK_FUNC; do_symlink /usr/share/fonts/ttf"
    else do_symlink /usr/share/fonts/ttf
fi
