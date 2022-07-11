# PipeWire does not work

For some reason, PipeWire just stop working suddenly for no reason, but you can workaround it by using this sequence of commands:
```bash
source ~/.bash_profile
sudo xbps-remove -RF pulseaudio pulseaudio-utils
sudo xbps-remove alsa-plugins-pulseaudio
pipewire &
wireplumber &
sudo xbps-install alsa-plugins-pulseaudio
# now, if it doesn't work, kill both pipewire and wireplumber and start them again
```

# I can't compile that picom fork 

You may be missing some dependencies:
* Void Linux: `meson MesaLib-devel dbusil-devel lconfig-devel libev-devel pcre-devel pixman-devel xcb-util-image-devel xcb-util-renderutil-devel libxdg-basedir-devel asciidoc uthash cmake`

Then you can run:
```
meson --buildtype=release . build --prefix=/usr -Dwith_docs=true
doas ninja -C build install
```
