<div align="center">
    <h1>🌸 dotfiles</h1>
</div>

<img src="gallery/current.png" align="right" width="400" />

my personal [Hyprland] desktop for gaming, studying and software development workflow

- 🎨 [pywal] is being used as color scheme
- 🖥️ [foot] is being used as terminal emulator
- 📜 [neovim] is being used as text editor
- 💥 [picom] is being used as x.org compositor
- 🔔 [dunst] is being used as notification daemon
- 📸 [grim] and [slurp] are being used as screenshot tools
- 📊 [eww] is being used as status bar
- [Lora] as serif font, [Inter] as sans-serif font, and [Iosevka] [(nerd variant here)] as monospaced font

[pywal]: https://github.com/dylanaraps/pywal
[neovim]: https://github.com/neovim/neovim
[picom]: https://github.com/dccsilag/picom
[dunst]: https://github.com/dunst-project/dunst
[foot]: https://codeberg.org/dnkl/foot
[Artix Linux]: https://artixlinux.org/
[Hyprland]: https://github.com/hyprwm/Hyprland
[grim]: https://sr.ht/~emersion/grim/
[slurp]: https://github.com/emersion/slurp
[eww]: https://github.com/elkowar/eww
[Lora]: https://fonts.google.com/specimen/Lora
[Inter]: https://fonts.google.com/specimen/Inter
[Iosevka]: https://typeof.net/Iosevka/
[(nerd variant here)]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Iosevka

## installation

<img src="assets/club-penguin-dancing.gif" align="right" width="400" />

**1. packages**

<details>
<summary><strong>Arch Linux</strong></summary>

- wayland: `wayland`, `wayland-protocols`, `wl-clipboard`
- seat management: `seatd`
- screenshot: `grim`, `slurp`
- notifications: `dunst`
- compositor: `hyprland-git`, `hyprpaper-git`, `socat`
- status bar: `eww-wayland`
- browser: `firefox`
- terminal emulator: `foot`
- color scheme: `pywal`, `pywalfox`, `imagemagick`
- audio: `pipewire`, `pipewire-alsa`, `pipewire-pulse`
- amdgpu: `mesa-tkg-git`, `libva-utils`, `ffmpeg-git`, `vulkan-icd-loader-git`, `mesa-vdpau`
- amdgpu [lib32]: `lib32-mesa-tkg-git`, `lib32-mesa-vdpau`, `lib32-vulkan-icd-loader-git`
- fonts: `ttf-iosevka`, `ttf-iosevka-nerd`, `lora-cyrillic-git`, `inter-font`, `ttf-twemoji`
- gtk/qt theme: `qt5ct`, `qt5-styleplugins`, `kora-icon-theme`, `wpgtk`

</details>

<details>
<summary><strong>Alpine Linux</strong></summary>

- wayland: `wayland wayland-protocols wl-clipboard`
- seat management: `seatd eudev dbus`
- screenshot: `grim slurp`
- notifiations: `dunst`
- compositor: `./alpine/packages/hyprland`, `./alpine/packages/hyprpaper`, `socat`
- status bar: `eww`
- browser: `firefox`
- terminal emulator: `foot`
- color scheme: `py3-pywal`, `python3 py3-pip + pip install pywalfox`
- audio server: `pipewire pipewire-alsa pipewire-pulse wireplumber`
- amdgpu: `mesa mesa-dri-gallium mesa-va-gallium mesa-gl mesa-gles mesa-egl mesa-glapi mesa-utils vulkan-loader vulkan-headers mesa-vulkan-layers mesa-gbm libva-glx ffmpeg`
- fonts: `font-noto-cjk font-iosevka-nerd font-inter font-noto-extra ttf-font-awesome ttf-dejavu fontconfig`
- zsh utils: `zoxide`
- gtk/qt theme: `qt5ct qt5-qtwayland qt6-qtwayland adwaita-cursor-theme`

</details>

**2. symlinking configuration files**

```bash
shopt -s dotglob
git clone https://code.runtime.ee/dotfiles.git .dots && cd .dots
doas mv /usr/share/fontconfig/conf.avail /usr/share/fontconfig/config.avail.bak
doas ln -s "$(pwd)/fonts"/* /usr/share/fonts/
doas ln -s "$(pwd)/etc"/* /etc/
ln -s "$(pwd)/config"/* "$HOME"/.config/
ln -s "$(pwd)/home"/* "$HOME"/
ln -s "$(pwd)/bin"/* "$HOME"/.bin/
```

**3. generating gtk/qt theme**

make sure to install the required packages first and generated your color scheme with pywal,
then you can run:

```bash
wpg-install.sh -g
wallpaper=$(cat ~/.fehbg | cut -d\' -f2 | sed -e 's|#!/bin/sh||' | xargs)
wpg -s $wallpaper
```

## troubleshooting and fixes

- [minecraft runs on xwayland](https://github.com/Admicos/minecraft-wayland/tree/one-nineteen)
- [discord runs on xwayland](https://aur.archlinux.org/packages/discord_arch_electron)

```

```
