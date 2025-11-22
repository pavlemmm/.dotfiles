#!/bin/bash

if pgrep -x rofi >/dev/null; then
    pkill rofi
    exit
fi

reload_cmd="hyprctl reload"
logout_cmd="hyprctl dispatch exit"
lock_cmd="hyprlock"

option_1="1\t  Power Off"
option_2="2\t  Restart"
option_3="3\t  Reload Hyprland"
option_4="4\t  Lock"
option_5="5\t  Log Out"

option=$(printf "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi -dmenu -p "power menu")

case $option in
    $option_1) poweroff ;;
    $option_2) reboot ;;
    $option_3) $reload_cmd ;;
    $option_4) $lock_cmd ;;
    $option_5) $logout_cmd ;;
    *) exit 1 ;;
esac
