#!/bin/bash
cd "$(dirname "$0")/../bin"
chmod +x *
for file in *; do
  sudo ln -s "$PWD/$file" "/usr/bin/$file"
done

