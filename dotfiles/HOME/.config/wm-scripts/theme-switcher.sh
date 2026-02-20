#!/usr/bin/env bash

set -euo pipefail

if pgrep -x rofi >/dev/null; then
  pkill rofi
  exit 0
fi

app="$HOME/.config/themes/theme-switcher.sh"

if [ ! -x "$app" ]; then
  rofi -e "Theme switcher not found or not executable:\n$app"
  exit 1
fi

ALL_THEMES="$("$app" ls)"

THEME="$(printf '%s\n' "$ALL_THEMES" | rofi -dmenu -p "select theme" -matching prefix -i)"

[ -z "${THEME:-}" ] && exit 0

"$app" "$THEME"
