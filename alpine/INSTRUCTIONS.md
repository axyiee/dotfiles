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

