#!/usr/bin/env bash

if pgrep -x rofi >/dev/null; then
    pkill rofi
    exit
fi

# Lista dostupnih tema
ALL_THEMES=$(theme-switcher ls)

THEME=$(printf "$ALL_THEMES" | rofi -dmenu -p "select theme" -matching prefix -i)

[ -z "$THEME" ] && exit 0

theme-switcher "$THEME"
