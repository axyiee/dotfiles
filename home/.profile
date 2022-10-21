export XDG_RUNTIME_DIR=$(mktemp -d "/tmp/$(id -un)-XXXXXXXXX")

. "$HOME/.cargo/env"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

