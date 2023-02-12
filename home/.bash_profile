if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

if [ -x ~/.bin/start-hyprland ] && [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
    ~/.bin/start-hyprland
fi
#if [ -x ~/.bin/start-sway ] && [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
   #~/.bin/start-sway
#fi

