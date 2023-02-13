# Void Linux [MUSL]: Replacing coreutils with busybox

**WIP!** don't follow this guide for now, things might be broken

This guide assumes you haven't installed Void Linux yet. Of course you can replace within an already
installed system, but it'd be a way simpler process when you're starting from scratch.

First of all, you need to partition your disks and mount them according to your needs. This guide
will assume you made it with an [EFI, ROOT] partitioning model process. This will also focus on simpler
software that follows the UNIX philosophy whenever possible (when the alternatives aren't dogshit, I mean),
just for the funnies_.

```bash
$ REPO=https://voidlinux.com.br/repo/current/musl # if you need another repo, feel free to change it
$ ARCH=x86_64-musl
$ BASE_PKG="base-files musl busybox-huge runit-void xbps removed-packages shadow booster util-linux bash"
$ SYS_PKG="eudev eudev-libudev linux6.1 linux6.1-headers grub-x86_64-efi dhcpcd opendoas dosfstools e2fsprogs"
# xbps-install -S && mkdir -p /mnt/var/db/xbps/keys
# cp /var/db/xbps/keys/* /mnt/var/db/xbps/keys/
# XBPS_ARCH=$ARCH xbps-install -S -r /mnt -R "$REPO" $BASE_PKG $SYS_PKG
# cd /tmp && wget https://raw.githubusercontent.com/glacion/genfstab/master/genfstab
# chmod +x ./genfstab && ./genfstab -U /mnt >> /mnt/etc/fstab
```

**shadow** is required for xbps to manage users and groups, **booster** is necessary to generate initramfs,
**util-linux** and **eudev** are runit dependencies, **bash** is required by most scripts, **dosfstools** and
**e2fsprogs** are required to fix some disk issues

Now enter a chroot environment with `xchroot /mnt /bin/ash` and run the following:

```bash
# for cmd in $(busybox --list); do busybox ln -s /bin/busybox /bin/$cmd; done
# mkdir -p /etc/ssl/certs && update-ca-certificates --fresh
# mkdir -p /etc/xbps.d && echo "ignorepkg=coreutils" > /etc/xbps.d/99-no-coreutils.conf
```

Then you can proceed with your installation as normal, for example:

<details>
<summary><strong>Hostname and rc.conf</strong></summary>

```bash
# echo ocean > /etc/hostname
# sed -ie 's/#HOSTNAME="void-live"/HOSTNAME="ocean"/' /etc/rc.conf
# sed -ie 's/#TIMEZONE="Europe\/Madrid"/TIMEZONE="America\/Sao_Paulo"/' /etc/rc.conf
# sed -ie 's/#KEYMAP="es"/KEYMAP="en"/' /etc/rc.conf
```

</details>

<details>
<summary><strong>Installing bootloader</strong></summary>

```bash
# grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="Void"
# xbps-reconfigure -fa
```

</details>

<details>
<summary><strong>Adding DHCP support, root password, and creating a new user</strong></summary>

```bash
# ln -s /usr/bin/doas /usr/bin/sudo
# echo 'permit persist :wheel' > /etc/doas.conf
# useradd -m -s /bin/bash -G wheel,video,audio,input,users run
# passwd run # 'run' user pass
# passwd # 'root' user pass
# ln -s /etc/sv/dhcpcd /etc/runit/runsvdir/default/
# ln -s /etc/sv/udevd /etc/runit/runsvdir/default/
# (cd /etc/runit/runsvdir/default && unlink agetty-tty3 && unlink agetty-tty4 && unlink agetty-tty5 && unlink agetty-tty6)
```

</details>

With everything mentioned above, you can enjoy a clean system of around `66` packages!

Post-installation, whenever you got into a TTY or something similar:

<details>
<summary><strong>Adding extra DNS resolvers</strong></summary>

```bash
# echo $'nameserver 8.8.8.8\nnameserver 8.8.4.4' >> /etc/resolv.conf && chattr +i /etc/resolv.conf
```

</details>
