# Getting Started on Alpine

## Setting up AMDGPU

Follow [this guide] while replacing everything `radeon` with `amdgpu`.

[this guide]: https://wiki.alpinelinux.org/wiki/Radeon_Video

## Setting up seat and device management

```sh
# apk add eudev seatd
# setup-devd udev
# adduser $USER input
# adduser $USER video
# adduser $USER seat
# rc-update add seatd
# rc-service seatd start
```

## Optimizing boot process

Update `/etc/rc.conf` with `rc_parallel="YES"`

## Adding extra DNS resolvers

```bash
# echo $'nameserver 8.8.8.8\nnameserver 8.8.4.4' >> /etc/resolv.conf && chattr +i /etc/resolv.conf
```

## Steam

```bash
# apk add steam-devices flatpak xinit xorg-server xf86-input-libinput xinit openbox
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# flatpak install com.valvesoftware.Steam com.valvesoftware.Steam.CompatibilityTool.Proton-GE
# exec ~/.bin/start-steam-session
```

## Auto-login

```bash
# apk add agetty agetty-openrc
```

Now replace the `/sbin/getty` in **/etc/inittab** lines with the following:
```conf
tty1::respawn:/sbin/agetty --autologin <username> --noclear 38400 tty1 linux
tty2::respawn:/sbin/agetty 38400 tty2 linux
tty3::respawn:/sbin/agetty 38400 tty3 linux
```

## TTY Theming

Insert the following into **/etc/local.d/pywal_tty.start** and `chmod +x` it:
```bash
#!/bin/bash
if [ -f "/home/<your username>/.cache/wal/colors-tty.sh" ]; then
chmod +x /home/<your username>/.cache/wal/colors-tty.sh
/home/<your username>/.cache/wal/colors-tty.sh
fi
```

