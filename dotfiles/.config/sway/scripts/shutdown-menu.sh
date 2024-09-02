#!/bin/bash

if pgrep -x wofi; then
    killall wofi
else
    chosen=$(echo -e "1.   Power Off\n2.   Restart\n3.   Reload Sway\n4.   Log Out\n5.   Lock" | wofi --show dmenu --width 300 --height 240 --prompt "Shutdown Menu")

    case "$chosen" in
        "1.   Power Off") poweroff ;;
        "2.   Restart") reboot ;;
        "3.   Reload Sway") swaymsg reload ;;
        "4.   Log Out") swaymsg exit ;;
        "5.   Lock") swaylock ;;
        *) exit 1 ;;
    esac
fi
