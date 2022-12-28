<div align="center">
    <h1>🌸 dotfiles</h1>
</div>

<img src="gallery/current.png" align="right" width="400" />

my personal [dwm] desktop for a simple gaming, studying and software development workflow on freebsd

-   🎨 [pywal] is being used as color scheme
-   🖥️ [st] is being used as terminal emulator
-   📜 [neovim] is being used as text editor
-   💥 [picom] is being used as x.org compositor
-   🔔 [dunst] is being used as notification daemon

[dwm]: https://code.syntax.lol/dwm
[st]: https://code.syntax.lol/st
[pywal]: https://github.com/dylanaraps/pywal
[neovim]: https://github.com/neovim/neovim
[picom]: https://github.com/dccsilag/picom
[dunst]: https://github.com/dunst-project/dunst

## installation process

<img src="assets/club-penguin-dancing.gif" align="right" width="400" />

**1. installing xorg**

```bash
doas pkg install xorg xrdb
```

**2. installing the window manager**

```bash
git clone https://code.axyria.dev/dwm.git && cd dwm
doas make clean install
```

**3. installing the status bar and notifications**

```bash
doas pkg -S playerctl dunst
```

**4. installing the terminal emulator**

```bash
doas pkg install xclip
git clone https://code.axyria.dev/st.git && cd st
doas make clean install
```

**5. installing the x.org compositor**

```bash
doas pkg install picom
```

**6. installing the color scheme generator**

```bash
doas pkg install py-pip imagemagick7 feh
doas pip install pywal
```

**7. adding audio and video support**

```bash
doas pkg install drm-kmod xf86-video-amdgpu mesa-gallium-va mesa-gallium-vdpau libva-glx libva-utils mesa-dri libosmesa mesa-libs
sysctl hw.snd.default_unit=6 # Replace 6 with the needed PCM number from `cat /dev/sndstat
                             # To make it permanent you can add it to /etc/sysctl.conf
# Add the following to your `rc.conf`. Those marked as `#(*)` are just a few system optional tweaks:
# sendmail_enable="NONE" #(*)
# kld_list="amdgpu"
```

**8. symlinking configuration files**

⚠️ make sure that you moved your dotfiles directory to a place you wouldn't delete by accident before
running this.

```bash
./scripts/symlink.sh
./scripts/bin.sh
```

And that's it! You can now enjoy this just by using the `startx` command on TTY or using any display
manager.
