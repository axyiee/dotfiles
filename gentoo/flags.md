# Use

This is a list of `USE` flags that I usually add or remove in my Gentoo
installations.

* `-systemd`: I use OpenRC as my init system, so systemd is not needed.
* `-multilib`: I usually don't need 32-bit libraries, so I don't need this.
* `-geoloc -geoip`: I don't like being tracked by geolocation services.
* `-gnome -kde -handbook -qt4`: I don't use these desktop environments.
* `-bindist`: It stop us from installing additional features since there are legal restrictions for binary packages, and we are usually compiling from source so it is needed.
* `-cdda -dvd -dvdr -a52`: My PC does not have a CD/DVD drive, so I don't need these.
* `-upower`: Power management seems kind of unnecessary, since I do not use a laptop.
* `-ipv6`: I don't need IPv6.
* `-cups -printsupport`: I don't have a printer.
* `-wayland X`: I don't use wayland.
* `-nvidia -nvenc`: I don't have a NVIDIA card.
* `-webengine -telepathy -rdp -pulseaudio pipewire -aqua -smartcard -clamav -neon -quicktime -3dfx -emboss -ios -motif`: Extra features that I don't use.

```
USE="-systemd -multilib -geoloc -geoip -gnome -kde -handbook \ 
    -bindist cdda -dvd -dvdr -a52 -upower -ipv6 -cups -clamav \
    -printsupport -wayland X -nvidia -nvenc -webengine -telepathy \
    -rdp -aqua -pulseaudio pipewire -smartcard -neon -quicktime \
    -3dfx -emboss -ios -motif"
```


# Graphics

```
INPUT_DEVICES="libinput"
VIDEO_CARDS="radeon"
```


# Common Flags

* **Ryzen 5000 Series / EPYC 7xx3**: `COMMON_FLAGS="-O2 -march=znver3 -pipe"`
* **Ryzen 3000, 4000, 5000 Series / EPYC 7xx2**: `COMMON_FLAGS="-O2 -march=znver2 -pipe"`
* **Ryzen 1000 and 2000 Series**: `COMMON_FLAGS="-O2 -march=znver1 -pipe"`

**Additional:**
```
CFLAGS="${COMMON_FLAGS}"
CXXFLAGS="${COMMON_FLAGS}"
FCFLAGS="${COMMON_FLAGS}"
FFLAGS="${COMMON_FLAGS}"
```


# Extra

```
GENTOO_MIRRORS="https://gentoo.c3sl.ufpr.br/ http://gentoo.c3sl.ufpr.br/"
MAKEOPTS="j${nproc}"
ACCEPT_LICENSE="*"
ACCEPT_KEYWORDS="~amd64"
```

