#!/bin/bash
cd "$(dirname "$0")/../bin"
chmod +x *
for file in *; do
  sudo ln -sf "$PWD/$file" "/usr/bin/$file"
done

