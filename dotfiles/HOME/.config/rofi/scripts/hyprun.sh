#!/usr/bin/env bash

if pgrep -x rofi; then
    killall rofi
    exit
fi

chosen=$(hyprun ls | rofi -dmenu -i -p "run project")

if [ -n "$chosen" ]; then
    hyprun run "$chosen"
fi
