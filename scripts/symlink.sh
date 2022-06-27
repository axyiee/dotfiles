#!/bin/bash 
	
cd "$(dirname "$0")/.."

shopt -s dotglob
ln -nfs "$PWD/wallpapers" "$HOME/wallpapers"
ln -nfs "$PWD/scripts" "$HOME/dot-scripts"

cd home
for file in ./*; do
    if [ -e "$HOME/$file" ]; then
        mv "$HOME/$file" "$HOME/$file.bak"
    fi
	ln -nfs "$PWD/$file" "$HOME/$file"
done

cd ../config
for file in ./*; do
    if [ -e "$HOME/.config/$file" ]; then
        mv "$HOME/.config/$file" "$HOME/.config/$file.bak"
    fi
    ln -nfs "$PWD/$file" "$HOME/.config/$file"
done

cd ../etc
for file in ./*; do
    if [ -e "$HOME/$file" ]; then
        mv "$HOME/$file" "$HOME/$file.bak"
    fi
    sudo ln -nfs "$PWD/$file" "/etc/$file"
done

