<div align="center">
    <h1>🌸 azalea</h1>
</div>

<img src="gallery/current.png" align="right" width="400" />

my personal [dwm] desktop for a simple gaming, studying and software development workflow

* 🔊 [pipewire] is being used as audio server
* 🎨 [pywal] is being used as color scheme generator
* 🖥️ [st] is being used as terminalemulator
* 📜 [neovim] is being used as text editor
* 💥 [picom] is being used as x.org compositor  

[dwm]: https://code.syntax.lol/dwm
[st]: https://code.syntax.lol/st
[pywal]: https://github.com/dylanaraps/pywal
[pipewire]: https://gitlab.freedesktop.org/pipewire/pipewire/
[neovim]: https://github.com/neovim/neovim
[picom]: https://github.com/dccsilag/picom

## installation process

<img src="assets/club-penguin-dancing.gif" align="right" width="400" />

**1. installing xorg**

```bash
xbps-install xorg-minimal xinit xrdb # Void Linux

# This assumes you have the 'yay' AUR helper installed on your machine.
yay -S xorg-server xorg-xinit xorg-xrdb # X.org - Arch Linux
```

**2. installing the window manager**

```bash
xbps-install dbus # Void Linux
yay -S dbus # Arch Linux
git clone https://code.syntax.lol/dwm /tmp/dwm && cd /tmp/dwm
doas make -j$(nproc) install # replace 'doas' with sudo, if necessary
```

**5. installing the audio server**

```bash
xbps-install pipewire alsa-pipewire wireplumber # Void Linux
yay -S pipewire pipewire-pulse pipewire-alsa wireplumber # Arch Linux
```

**5. installing the status bar and notifications**

```bash 
xbps-install polybar python3-dbus pamixer dunst xsetroot # X.org/bspwm - Void Linux
yay -S polybar python-dbus pamixer dunst xorg-xsetroot # X.org/bspwm - Arch Linux
```

**6. installing the terminal emulator**

```bash
git clone https://code.syntax.lol/st /tmp/st && cd /tmp/st
doas make -j$(nproc) install # replace 'doas' with sudo, if necessary
```

**7. installing the x.org compositor**

```bash
# Void Linux
doas xbps-install MesaLib-devel dbus-devel libconfig-devel libev-devel pcre-devel pixman-devel xcb-util-image-devel xcb-util-renderutil-devel libxdg-basedir-devel uthash
git clone --depth=1 --single-branch --branch implement-window-animations https://github.com/dccsilag/picom /tmp/picom && cd /tmp/picom
git submodule update --init --recursive
meson --buildtype=release . build
doas ninja -C build install # replace 'doas' with sudo, if necessary

# Arch Linux
yay -S picom-animations-git
```

**8. installing pywal**

The color scheme wouldn't work without the use of [pywal]. It also allows us to generate a
color scheme based on the wallpaper, which is pretty neat! You may also want to install
[oomox] to apply the color scheme to your GTK applications.

[oomox]: https://github.com/themix-project/oomox

```bash
xbps-install pywal feh # Void Linux
yay -S pywal feh # Arch Linux
```

**8. symlinking configuration files**

⚠️ make sure that you moved your azalea directory to a place you wouldn't delete by accident before
running this.

```bash
./scripts/symlink.sh
```

And that's it! You can now enjoy azalea just by using the `startx` command on TTY or using any display
manager.

