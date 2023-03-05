# Mode 1: single-user
# It allows different XDG runtime directories between different TTY sessions. It is useful when
# you want to isolate the environment of audio servers and similar thinhs.
# export XDG_RUNTIME_DIR=$(mktemp -d "/tmp/$(id -un)-XXXXXXXXX")

# Mode 2: shared context
# It allows a single XDG runtime directory to be accessed between different TTY sessions. It is
# useful when you want to share audio servers such as Pipewire in order to use audio in both X
# and Wayland sessions, besides TTY.
if test -z "${XDG_RUNTIME_DIR}"; then
	export XDG_RUNTIME_DIR=/tmp/.rtdir/$(id -u)
	if ! test -d "${XDG_RUNTIME_DIR}"; then
		mkdir -p "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi

if [ -x ~/.bin/start-hyprland ] && [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
	~/.bin/start-hyprland
elif [ -x ~/.bin/start-steam-session ] && [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty2 ]; then
	~/.bin/start-steam-session
fi

. /home/run/.nix-profile/etc/profile.d/nix.sh#if [ -e /home/run/.nix-profile/etc/profile.d/nix.sh ]; then . /home/run/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
