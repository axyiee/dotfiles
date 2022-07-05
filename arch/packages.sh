#!/bin/bash

if ! pacman -Qs chaotic-keyring > /dev/null; then 
	pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
	pacman-key --lsign-key FBA220DFC880C036
	pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
fi

BASE="linux-zen linux-zen-headers grub efibootmgr"
FONTS="gnu-free-fonts noto-fonts-emoji noto-fonts-cjk"
XORG="xorg-server xorg-xinit xorg-xrandr lib32-libxcomposite"
WAYLAND="zig wayland wayland-protocols wlroots libxkbcommon libevdev pixman pkg-config xorg-xwayland qt5-wayland wl-clipboard grim slurp"
WM="gnome-keyring rofi-lbonn-wayland qt5ct qt5-styleplugins river-git foot waybar xlr-wandr swaybg"
WM_XORG="bspwm sxhkd kitty feh"
AUDIO="pipewire pipewire-pulse pipewire-alsa wireplumber lib32-pipewire pavucontrol gstreamer gst-plugins-bad"
GRAPHICS="mesa-tkg-git vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools amf-amdgpu-pro ffmpeg"
TOOLS="zsh git fzf wget lxappearance exa opendoas unzip neovim nvim-packer-git neofetch maim xclip zoxide pamixer tmux dbus dbus-runit"
BLUETOOTH="bluez bluez-utils"
LANGUAGES="nodejs-lts-gallium npm yarn jdk-temurin rustup dbus-python clang mold"
INTERNET="dhcpcd dhcpcd-runit qutebrowser"
TO_REMOVE="sudo"

yay -Sy --needed $INTERNET $TOOLS $BASE $FONTS $WAYLAND $XORG $WM $WM_XORG $AUDIO $SHELL $GRAPHICS $LANGUAGES $INTERNET $BLUETOOTH
pacman -R sudo

# > opendoas
echo "permit persist :wheel" > /etc/doas.conf
ln -s /usr/bin/doas /usr/bin/sudo

# > runit services
ln -s /etc/runit/sv/dhcpcd /run/runit/service/dhcpcd
ln -s /etc/runit/sv/dbus   /run/runit/service/dbus

# > system
USERNAME="exst"

if [ "$1" == "system" ]; then
    echo "artix" > /etc/hostname
    if ! id "$USERNAME"; then
        echo "> Adding '$USERNAME' user..."
        useradd -m -s /bin/zsh -U -G wheel,users,audio,video,input,kvm,network $USERNAME
    fi
    grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub
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
get https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Regular/complete/Space%20Mono%20Nerd%20Font%20Complete%20Mono.ttf -P /usr/share/fonts/ttf
(cd /usr/share/fonts/ttf && unzip JetBrainsMono.zip && rm -f JetBrainsMono.zip)
fc-cache -fv

# > oh-my-zsh
HOME="/home/$USERNAME"

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
git clone https://github.com/bikass/kora $HOME/.icons

(mkdir -p $HOME/.themes && cd $HOME/.themes && wget https://github.com/catppuccin/gtk/releases/download/update_23_02_2022/Catppuccin-yellow.zip && unzip Catppuccin-yellow.zip && rm -f Catpuccin-yellow.zip)
