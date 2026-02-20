#!/usr/bin/env bash
set -euo pipefail

HOST="${1:-$(hostname)}"
NIXOS_DIR="${HOME}/.dotfiles/nixos"
SRC="${NIXOS_DIR}/hosts/${HOST}"
DST="/etc/nixos"

[ -d "$SRC" ] || { echo "Missing: $SRC" >&2; exit 1; }

# If /etc/nixos is already a symlink to the right place, do nothing
if sudo test -L "$DST" && [ "$(readlink -f "$DST")" = "$SRC" ]; then
  echo "OK: $DST already -> $SRC"
  exit 0
fi

# Backup only if /etc/nixos is a real directory (not a symlink)
if sudo test -d "$DST" && ! sudo test -L "$DST"; then
  BAK="${DST}.backup-$(date +%Y%m%d-%H%M%S)"
  sudo mv "$DST" "$BAK"
  echo "Backup: $DST -> $BAK"
fi

# Replace /etc/nixos with symlink
sudo rm -rf "$DST"
sudo ln -s "$SRC" "$DST"

echo "Linked: $DST -> $SRC"
echo "Rebuild: sudo nixos-rebuild switch --flake ${NIXOS_DIR}#${HOST}"
