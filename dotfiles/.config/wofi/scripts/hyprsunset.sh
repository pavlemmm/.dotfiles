#!/bin/bash

if pgrep -x wofi; then
    killall wofi
    exit
fi

option_1="1   Temperature 1000"
option_2="2   Temperature 1500"
option_3="3   Temperature 2000"
option_4="4   Temperature 2500"
option_5="5   Temperature 3000"
option_6="6   Identity"

option=$(printf "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | wofi --show dmenu --width 200 --height 210 --prompt "Hyprsunset Menu" -O alphabetical)

case $option in
$option_1) hyprctl hyprsunset temperature 1000 && notify-send "Hyprsunset temperature 1000" ;;
$option_2) hyprctl hyprsunset temperature 1500 && notify-send "Hyprsunset temperature 1500" ;;
$option_3) hyprctl hyprsunset temperature 2000 && notify-send "Hyprsunset temperature 2000" ;;
$option_4) hyprctl hyprsunset temperature 2500 && notify-send "Hyprsunset temperature 2500" ;;
$option_5) hyprctl hyprsunset temperature 3000 && notify-send "Hyprsunset temperature 3000" ;;
$option_6) hyprctl hyprsunset identity && notify-send "Hyprsunset identity" ;;
*) exit 1 ;;
esac
