#!/bin/bash

if pgrep -x rofi >/dev/null; then
    pkill rofi
    exit
fi

cliphist list | ~/.config/rofi/scripts/launch.sh -dmenu -p "clipboard manager" -i | cliphist decode | wl-copy
