#!/bin/bash 
	
cd "$(dirname "$0")/.."

shopt -s dotglob
ln -nfs "$PWD/wallpapers" "/home/$USER/wallpapers"

cd home
for file in ./*; do
	ln -nfs "$PWD/$file" "/home/$USER/$file"
done

cd ../config
for file in ./*; do
        ln -nfs "$PWD/$file" "/home/$USER/.config/$file"
done

cd ../etc
for file in ./*; do
        sudo ln -nfs "$PWD/$file" "/etc/$file"
done
