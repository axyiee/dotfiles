<div align="center">
    <h1>🌸 azalea</h1>
</div>

my personal [bspwm] and [river] desktops for a simple gaming, studying and software development workflow

* 🔊 in both rices [pipewire] is being used as audio server
* 🎨 [ok] is being used as color scheme in almost everything possible
* 📊 ~~[polybar] is being used as status bar~~ it will be replaced with [eww] soon
* 🖥️ ~~[kitty]~~ is being used as terminal on **x** and [foot] on **wayland**
* 📜 [neovim] is being used as text editor

[bspwm]: https://github.com/baskerville/bspwm
[river]: https://github.com/riverwm/river
[polybar]: https://github.com/polybar/polybar 
[eww]: https://github.com/elkowar/eww 
[kitty]: https://github.com/kovidgoyal/kitty
[foot]: https://codeberg.org/dnkl/foot
[pipewire]: https://gitlab.freedesktop.org/pipewire/pipewire/
[neovim]: https://github.com/neovim/neovim
[ok]: https://github.com/itsook

## installation process

<img src="assets/club-penguin-dancing.gif" align="right" width="400" />

**1. installing xorg/wayland**

```bash
xbps-install xorg-minimal xinit xrdb # X.org - Void Linux
xbps-install xorg-server-wayland wayland-protocols wlroots # Wayland - Void Linux

# This assumes you have the 'yay' AUR helper installed on your machine.
yay -S xorg-server xorg-xinit xorg-xrdb # X.org - Arch Linux
yay -S wlroots xorg-wayland wayland wayland-protocols # Wayland - Arch Linux
```

**2. installing the window manager**

```bash
xbps-install bspwm sxhkd dbus # X.org/bspwm - Void Linux
xbps-install river dbus # Wayland/river - Void Linux
yay -S bspwm sxhkd dbus # X.org/bspwm - Arch Linux
yay -S river-git dbus # Wayland/river - Arch Linux
```

**5. installing the audio server**

```bash
xbps-install pipewire alsa-pipewire wireplumber # Void Linux
yay -S pipewire pipewire-pulse pipewire-alsa wireplumber # Arch Linux
```

**5. installing the status bar**

You can install [eww] easier on Void Linux by using [this template](https://github.com/monke0192/eww-template)!

```bash 
#xbps-install polybar python3-dbus pamixer # X.org/bspwm - Void Linux
# -- install eww

xbps-install eww-git # X.org/bspwm - Arch Linux
yay -S eww-wayland-git # Wayland/river - Arch Linux
```

**6. install the terminal emulator, the app launcher and required fonts

```bash
xbps-install kitty rofi # X.org/bspwm - Void Linux
# -- for rofi/wayland support on void, you can compile lbonn/rofi: https://github.com/lbonn/rofi

yay -S kitty rofi # X.org/bspwm - Arch Linux
yay -S foot rofi-lbonn-wayland # Wayland/river - Arch Linux
```

```bash
sudo mkdir -p /usr/share/ttf
sudo cp ./fonts/* /usr/share/ttf/
xbps-install freefont-ttf noto-fonts-emoji # Void Linux
yay -S gnu-free-fonts noto-fonts-emoji # Arch Linux
```

**7. install the x.org compositor**

```bash
# -- on void linux, you need to compile it manually: https://github.com/Arian8j2/picom

yay -S picom-arian8j2-git # Arch Linux.
```

**8. symlinking configuration files**

⚠️ make sure that you moved your azalea directory to a place you wouldn't delete by accident before
running this.

```bash
./scripts/symlink.sh
```

And that's it! You can now enjoy azalea just by using the `startx` command on TTY or using any display
manager.

