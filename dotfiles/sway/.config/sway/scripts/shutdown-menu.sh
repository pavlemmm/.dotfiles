#!/bin/bash

if pgrep -x wofi; then
    killall wofi
else
    chosen=$(echo -e "  Power Off\n  Restart\n  Reload Sway\n  Log Out\n  Lock" | wofi --show dmenu)

    case "$chosen" in
        "  Power Off") poweroff ;;
        "  Restart") reboot ;;
        "  Reload Sway") swaymsg reload ;;
        "  Log Out") loginctl terminate-user $USER ;;
        "  Lock") swaylock ;;
        *) exit 1 ;;
    esac
fi
