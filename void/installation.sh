#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "> Azalea need root permissions to install packages and modify the filesystem."
    exit
fi

echo "This will move previous /etc and home files and folders to <name>.bak and install this dotfiles' ones."
echo "Please make sure to not delete the Azalea's folder or make sure to move this to the right place before procceding with the installation."
echo "This installation script is intended to be used while installing the system by your own using chroot features to have a functional system upon installation. You can skip GRUB installation by do not passing 'system' as the first argument."
echo "Please make sure to overwrite the \$USER variable using the 'env' command if you are running through chroot or the 'root' user. For example: env USER=exst $0 $1"
read -n 1 -r -s -p $'> If you read everything and want to procceed, press enter to continue.\n'

BASE="base-minimal grub-x86_64-efi linux linux5.18 linux5.18-headers e2fsprogs f2fs-tools pciutils libpcap ethtool acpid libcap-progs libnetfilter_conntrack file libmagic dnssec-anchors libldns kbd libmnl"
GRAPHICS_BASE='mesa-dri xf86-video-amdgpu mesa-vaapi mesa-vdpau ffmpeg'
GRAPHICS_VULKAN="vulkan-loader mesa-vulkan-radeon Vulkan-ValidationLayers"
XORG='xorg-minimal xrandr xinit seatd xf86-input-evdev xf86-video-fbdev xclip feh'
WAYLAND="qt5-wayland kwayland xorg-server-xwayland wayland-protocols"
AUDIO='pipewire alsa-pipewire wireplumber alsa-utils pamixer pavucontrol rtkit'
WM_XORG='bspwm sxhkd polybar kitty python3-dbus'
WM_WAYLAND="river wlroots swaybg wlr-randr foot"
STYLE='lxappearance freefont-ttf noto-fonts-cjk noto-fonts-emoji qt5-styleplugins qt5ct'
TOOLS='git make bat delta neofetch neovim opendoas bash qutebrowser wget unzip gnome-keyring libgnome-keyring libsecret fzf zoxide tmux maim dbus dbus-libs xdg-user-dirs btop'
NETWORK='dhcpcd iproute2'
PROGRAMMING='rustup openjdk17 clang'
REPOSITORIES="void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree"
I386="libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit mesa-dri-32bit alsa-plugins-pulseaudio alsa-plugins-pulseaudio-32bit fontconfig-32bit vulkan-loader-32bit mesa-vulkan-radeon-32bit"

ARCH=x86_64
MIRROR="https://mirror.clarkson.edu/voidlinux/current"

XBPS_ARCH=$ARCH xbps-install -S -R "$MIRROR" $(echo $REPOSITORIES)
XBPS_ARCH=$ARCH xbps-install -S -R "$MIRROR" $(echo $BASE $TOOLS $XORG $GRAPHICS_BASE $GRAPHICS_VULKAN $AUDIO $WM_XORG $WM_WAYLAND $WAYLAND $NETWORK $PROGRAMMING $GAMES $STYLE $I386)
xbps-remove pulseaudio-utils

# > system
export HOME="/home/$USER"
if [ "$1" == "system" ]; then 
	echo "void" > /etc/hostname
	if ! id "$USER" &>/dev/null; then
		echo "> Adding '$USER' user..."
        useradd -m -s /bin/zsh -U -G wheel,users,audio,video,input,kvm,network,_seatd,_pipewire exst 
	fi
	grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="Void"
    grub-mkconfig -o /boot/grub/grub.cfg
fi

# > opendoas
echo "permit persist :wheel" > /etc/doas.conf
ln -s /usr/bin/doas /usr/bin/sudo

# > alsa-pipewire
mkdir -p /etc/alsa/conf.d
ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
 
# > runit services
ln -s /etc/sv/dhcpcd /var/service/
ln -s /etc/sv/rtkit /var/service/
ln -s /etc/sv/seatd /var/service/

(cd "$PWD"/.. && ./scripts/symlink.sh)

# > oh-my-zsh
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
(mkdir -p $HOME/.themes && cd $HOME/.themes && wget https://github.com/catppuccin/gtk/releases/download/update_23_02_2022/Catppuccin-yellow.zip && unzip Catppuccin-yellow.zip && rm -f Catpuccin-yellow.zip)

# > rofi 
(cd /tmp && git clone https://github.com/lbonn/rofi && cd rofi && meson setup build && ninja -C build install)


echo -e "\n\n\n[!] Installation finished!\nMake sure to edit the '/etc/rc.conf' file then run 'xbps-reconfigure -f glibc-locales and xbps-reconfigure -fa'"
