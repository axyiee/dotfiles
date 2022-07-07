# 🌸 azalea

my personal [bspwm] and [river] desktops for a simple gaming, studying and software development workflow

* 🔊 in both rices [pipewire] is being used as audio server
* 🎨 [ok] is being used as color scheme in almost everything possible
* 📊 ~~[polybar] is being used as status bar~~ it will be replaced with [eww] soon
* 🖥️ ~~[kitty]~~ is being used as terminal on **x** and [foot] on **wayland**
* 📜 ~~[neovim]~~ is being used as text editor

[bspwm]: https://github.com/baskerville/bspwm
[river]: https://github.com/riverwm/river
[polybar]: https://github.com/polybar/polybar 
[eww]: https://github.com/elkowar/eww 
[kitty]: https://github.com/kovidgoyal/kitty
[foot]: https://codeberg.org/dnkl/foot  

## installation process

The installation process is recommended to be executed mid chroot-based install. It is [ok] to run after that, 
but be aware that some packages might be hardware-specific or some arguments might trigger some steps such as 
boot loader installation and stuff.

You can adapt those scripts to your own needs by removing the packages you don't need. You also need to pass the 
`$USER` environment variable, and you need to be running as root. The reason behind this is that we can't detect
the user you want automatically, and this script automatically creates an user if desired. For running this script 
in system mode (install bootloader, create users, etc) just pass `system` as first argument.

**tl;dr:** `sudo env USER=myuser ./<distro>/installation.sh [system]`
For now, Gentoo and Arch/Artix scripts are outdated, since I don't have those on my machine and can't follow those
steps for that specific reason.

**Supported:** Void Linux
**EOL:**: Gentoo, Artix Linux (it is a really easy thing to update these scripts as long you now 
what you are doing, you just need to look at the void linux script and replicate it with your distro of choice)

## gallery

**the color scheme is outdated on this screenshot**

**bspwm:**
<img src="./showcase/current.png" />

**river:**
> not finished yet

[ok]: https://github.com/itsook


