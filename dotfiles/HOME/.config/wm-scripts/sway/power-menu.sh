#!/usr/bin/env bash

if pgrep -x rofi >/dev/null; then
    pkill rofi
    exit
fi

reload_cmd="swaymsg reload"
logout_cmd="swaymsg exit"
lock_cmd="swaylock"

option_1="1       Power Off"
option_2="2       Restart"
option_3="3       Reload Sway"
option_4="4       Lock"
option_5="5       Log Out"

option=$(printf "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi -dmenu -p "power menu" -i)

case $option in
    $option_1) poweroff ;;
    $option_2) reboot ;;
    $option_3) $reload_cmd ;;
    $option_4) $lock_cmd ;;
    $option_5) $logout_cmd ;;
    *) exit 1 ;;
esac
