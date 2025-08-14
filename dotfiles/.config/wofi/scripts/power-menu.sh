#!/bin/bash

if pgrep -x wofi; then
    killall wofi
    exit
fi


compositor=$(echo $XDG_CURRENT_DESKTOP)

case "$compositor" in
    Sway)
        reload_cmd="swaymsg reload"
        logout_cmd="swaymsg exit"
        lock_cmd="swaylock"
        ;;
    Hyprland)
        reload_cmd="hyprctl reload"
        logout_cmd="hyprctl dispatch exit"
        lock_cmd="hyprlock"
        ;;
    *)
        exit 1
        ;;
esac


option_1="1     Power Off"
option_2="2     Restart"
option_3="3     Reload $compositor"
option_4="4     Lock"
option_5="5     Log Out"

option=$(printf "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | wofi --show dmenu --width 200 --height 175 --prompt "Power Menu" --no-history)

case $option in
    $option_1) poweroff ;;
    $option_2) reboot ;;
    $option_3) $reload_cmd ;;
    $option_4) $lock_cmd ;;
    $option_5) $logout_cmd ;;
    *) exit 1 ;;
esac
