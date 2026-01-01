#!/bin/bash

if pgrep -x rofi; then
    killall rofi
    exit
fi

option_1="1     Temp 1000K"
option_2="2     Temp 1500K"
option_3="3     Temp 2000K"
option_4="4     Temp 2500K"
option_5="5     Temp 3000K"
option_6="6     OFF"

option=$(printf "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi -dmenu -p "hyprsunset menu" -matching prefix -i)

case $option in
    $option_1) hyprctl hyprsunset temperature 1000 && notify-send "Hyprsunset temperature 1000" ;;
    $option_2) hyprctl hyprsunset temperature 1500 && notify-send "Hyprsunset temperature 1500" ;;
    $option_3) hyprctl hyprsunset temperature 2000 && notify-send "Hyprsunset temperature 2000" ;;
    $option_4) hyprctl hyprsunset temperature 2500 && notify-send "Hyprsunset temperature 2500" ;;
    $option_5) hyprctl hyprsunset temperature 3000 && notify-send "Hyprsunset temperature 3000" ;;
    $option_6) hyprctl hyprsunset identity && notify-send "Hyprsunset identity" ;;
    *) exit 1 ;;
esac
