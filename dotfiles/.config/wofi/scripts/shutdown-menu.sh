#!/bin/bash

if pgrep -x wofi; then
    killall wofi
else
    option_1="1)   Power Off"
    option_2="2)   Restart"
    option_3="3)   Reload Sway"
    option_4="4)   Log Out"
    option_5="5)   Lock"

    option=$(printf "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | wofi --show dmenu --width 300 --height 240 --prompt "Shutdown Menu")

    case $option in
        $option_1) poweroff ;;
        $option_2) reboot ;;
        $option_3) swaymsg reload ;;
        $option_4) swaymsg exit ;;
        $option_5) swaylock ;;
        *) exit 1 ;;
    esac
fi
