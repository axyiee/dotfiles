#!/bin/bash

BASE="base-minimal grub-x86_64-efi linux linux5.18 linux5.18-headers e2fsprogs f2fs-tools pciutils libpcap ethtool acpid libcap-progs libnetfilter_conntrack file libmagic dnssec-anchors libldns kbd libmnl"
GRAPHICS_BASE='mesa-dri xf86-video-amdgpu mesa-vaapi mesa-vdpau ffmpeg'
GRAPHICS_VULKAN="vulkan-loader mesa-vulkan-radeon Vulkan-ValidationLayers"
XORG='xorg-minimal xrandr xinit seatd xf86-input-evdev xf86-video-fbdev xclip feh xorg-util-macros libXft-devel libX11-devel harfbuzz-devel libXext-devel libXrender-devel libXinemera-devel'
WAYLAND="qt5-wayland kwayland xorg-server-xwayland wayland-protocols"
AUDIO='pipewire alsa-pipewire wireplumber alsa-utils pamixer pavucontrol bluez-alsa libspa-bluetooth FAudio'
WM=""
WM_XORG='bspwm sxhkd polybar picom'
WM_WAYLAND="river wlroots swaybg wlr-randr"
STYLE='lxappearance freefont-ttf noto-fonts-cjk noto-fonts-emoji qt5-styleplugins qt5ct'
TOOLS='git delta bluez neofetch neovim opendoas bash zsh dash qutebrowser wget unzip gnome-keyring libgnome-keyring libsecret usbutils usb-modeswitch fzf zoxide tmux maim dbus dbus-libs dbus-x11 xdg-user-dirs rtkit btop'
NETWORK='dhcpcd iproute2 iw iputils'
GAMES='PolyMC gamemode'
PROGRAMMING='rustup nodejs openjdk17 clang python3-dbus pkg-config openssl-devel flex bison autoconf automake make libxcb glib-devel libxkbcommon-devel ppango-devel cairo-devel gdk-pixbuf-devel xcb-util-wm-devel xcb-util-xrm-devel xcb-util-cursor-devel startup-notification-devel wayland-client-devel wayland-devel check meson ninja wlroots-devel libtool'
TO_REMOVE="pulseaudio-utils"
REPOSITORIES="void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree"
I386="libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit mesa-dri-32bit alsa-plugins-pulseaudio alsa-plugins-pulseaudio-32bit fontconfig-32bit vulkan-loader-32bit mesa-vulkan-radeon-32bit"
WINE_BUILD="pulseaudio-devel libopenal-devel ffmpeg-devel samba-devel libusb-devel pulseaudio-devel-32bit libopenal-devel-32bit ffmpeg-devel-32bit libusb-devel-32bit libXrandr-devel libXrandr-devel-32bit libXcursor-devel-32bit libXcursor-devel libxml2-devel libxml2-devel-32bit libXdamage-devel libXdamage-devel-32bit lcms2-devel lcms2-devel-32bit attr-devel attr-devel-32bit fontconfig-devel fontconfig-devel-32bit libXi-devel libXi-devel-32bit libXft-devel libXft-devel-32bit glu-devel glu-devel-32bit SDL2-devel SDL2-devel-32bit gnutls-devel gnutls-devel-32bit libXcomposite-devel libXcomposite-devel-32bit gstreamer1-devel gstreamer1-devel-32bit gst-plugins-base1-devel gst-plugins-base1-devel-32bit FAudio-devel FAudio-devel-32bit"

ARCH=x86_64
MIRROR="https://mirror.clarkson.edu/voidlinux/current"

XBPS_ARCH=$ARCH xbps-install -S -R "$MIRROR" $(echo $BASE $TOOLS $XORG $GRAPHICS_BASE $GRAPHICS_VULKAN $AUDIO $WM $WM_XORG $WM_WAYLAND $WAYLAND $NETWORK $PROGRAMMING $GAMES $STYLE $REPOSITORIES) || exit -1
XBPS_ARCH=$ARCH xbps-install -S $(echo $I386) || exit -1
xbps-remove $TO_REMOVE

# > opendoas
echo "permit persist :wheel" > /etc/doas.conf
ln -s /usr/bin/doas /usr/bin/sudo

# > alsa-pipewire
mkdir -p /etc/alsa/conf.d
ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
# if you are having 'connection error' issues, it may be a permission issue: chmod 777 /dev/snd && chmod 777 /dev/snd/*

# > runit services
ln -s /etc/sv/dhcpcd /var/service/
ln -s /etc/sv/rtkit /var/service/
ln -s /etc/sv/seatd /var/service/

# > system
if [ "$1" == "system" ]; then 
	echo "void" > /etc/hostname
	if ! id "exst" &>/dev/null; then
		echo "> Adding 'exst' user..."
        useradd -m -s /bin/dash -U -G wheel,users,audio,video,input,kvm,network,_seatd,_pipewire exst 
	fi
	grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="Void"
    grub-mkconfig -o /boot/grub/grub.cfg
fi

# > fonts
mkdir -p /usr/share/fonts/ttf
wget https://yudit.org/download/fonts/UBraille/UBraille.ttf -P /usr/share/fonts/ttf
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip -P /usr/share/fonts/ttf
wget https://github.com/powerline/fonts/raw/master/SpaceMono/Space%20Mono%20for%20Powerline.ttf -P /usr/share/fonts/ttf 
wget https://github.com/powerline/fonts/raw/master/SpaceMono/Space%20Mono%20Italic%20for%20Powerline.ttf -P /usr/share/fonts/ttf
wget https://github.com/powerline/fonts/raw/master/SpaceMono/Space%20Mono%20Bold%20for%20Powerline.ttf -P /usr/share/fonts/ttf
wget https://github.com/powerline/fonts/raw/master/SpaceMono/Space%20Mono%20Bold%20Italic%20for%20Powerline.ttf -P /usr/share/fonts/ttf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Regular/complete/Space%20Mono%20Nerd%20Font%20Complete.ttf -P /usr/share/fonts/ttf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Regular/complete/Space%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -P /usr/share/fonts/ttf
(cd /usr/share/fonts/ttf && unzip JetBrainsMono.zip && rm -f JetBrainsMono.zip)
fc-cache -fv

# > oh-my-zsh
HOME="/home/exst"

(git init --quiet $HOME/.oh-my-zsh \
    && cd $HOME/.oh-my-zsh \
    && git config core.eol lf \
    && git config core.autocrlf false \
    && git config fsck.zeroPaddedFilemode ignore \
    && git config fetch.fsck.zeroPaddedFilemode ignore \
    && git config receive.fsck.zeroPaddedFilemode ignore \
    && git config oh-my-zsh.remote origin \
    && git config oh-my-zsh.branch master \
    && git remote add origin https://github.com/ohmyzsh/ohmyzsh.git \
    && git fetch --depth=1 origin \
    && git checkout -b master origin/master \
    || {
        [ ! -d $HOME/.oh-my-zsh ] || {
            cd -
            rm -rf $HOME/.oh-my-zsh 2>/dev/null
        }
        echo git clone of oh-my-zsh repo failed
        exit 1
    })
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab.git $HOME/.oh-my-zsh/custom/plugins/fzf-tab

# > neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

# > theme
git clone https://github.com/bikass/kora $HOME/.icons
(mkdir -p $HOME/.themes && cd $HOME/.themes && wget https://github.com/catppuccin/gtk/releases/download/update_23_02_2022/Catppuccin-yellow.zip && unzip Catppuccin-yellow.zip && rm -f Catpuccin-yellow.zip)

echo "Make sure to edit the '/etc/rc.conf' file then run 'xbps-reconfigure -f glibc-locales' and 'xbps-reconfigure -fa'"

# > rofi 
(cd /tmp && git clone https://github.com/lbonn/rofi && cd rofi && meson setup build && ninja -C build install)

# > siduck/st 
(cd /tmp && git clone https://github.com/siduck/st && cd st && make install)

# > river wm 
(cd /tmp && wget https://ziglang.org/download/0.9.1/zig-linux-x86_64-0.9.1.tar.xz && tar xvf zig-linux-x86_64-0.9.1.tar.xz) 
(cd /tmp && git clone --recurse-submodules https://github.com/riverwm/river && cd river && /tmp/zig-linux-x86_64-0.9.1/zig build -Drelease-safe -Dxwayland --prefix $HOME/.local install)
