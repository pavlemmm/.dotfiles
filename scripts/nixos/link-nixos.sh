#!/usr/bin/env bash
set -e

HOST="${1:-$(hostname)}"
SRC="$HOME/.dotfiles/nixos"
DST="/etc/nixos"

# Check if SRC exists
[ -d "$SRC" ] || { echo "Missing: $SRC"; exit 1; }

# Link /etc/nixos -> repo
sudo rm -rf "$DST"
sudo ln -sf "$SRC" "$DST"

# Generate hardware config
sudo nixos-generate-config --show-hardware-config > "$SRC/hosts/$HOST/hardware-configuration.nix"

echo "Done. Rebuild with:"
echo "sudo nixos-rebuild switch --flake /etc/nixos#${HOST}"
