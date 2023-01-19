if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

# pnpm
export PNPM_HOME="/home/axy/.local/share/pnpm"
if [ -d "$PNPM_HOME" ]
  then PATH="$PNPM_HOME:$PATH"
fi
# pnpm end

#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]
#    then exec startx 
#fi

