#!/bin/bash

if pgrep -x rofi; then
    killall rofi
    exit
fi

option_1="1\tTemp 1000K"
option_2="2\tTemp 1500K"
option_3="3\tTemp 2000K"
option_4="4\tTemp 2500K"
option_5="5\tTemp 3000K"
option_6="6\tIdentity"

option=$(printf "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi -dmenu -p "hyprsunset menu")

case $option in
    $option_1) hyprctl hyprsunset temperature 1000 && notify-send "Hyprsunset temperature 1000" ;;
    $option_2) hyprctl hyprsunset temperature 1500 && notify-send "Hyprsunset temperature 1500" ;;
    $option_3) hyprctl hyprsunset temperature 2000 && notify-send "Hyprsunset temperature 2000" ;;
    $option_4) hyprctl hyprsunset temperature 2500 && notify-send "Hyprsunset temperature 2500" ;;
    $option_5) hyprctl hyprsunset temperature 3000 && notify-send "Hyprsunset temperature 3000" ;;
    $option_6) hyprctl hyprsunset identity && notify-send "Hyprsunset identity" ;;
    *) exit 1 ;;
esac
