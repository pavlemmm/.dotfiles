#!/bin/bash

if pgrep -x wofi; then
    killall wofi
    exit
fi


DIR="$HOME/Pictures/screenshots/"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
FILE="$DIR/screenshot_$TIMESTAMP.png"

option_1="1   Capture Screen"
option_2="2   Capture Screen to Clipboard"
option_3="3   Capture Selection"
option_4="4   Capture Selection to Clipboard"
option_5="5   Capture Window"
option_6="6   Capture Window to Clipboard"

option=$(printf "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | wofi --show dmenu --width 350 --height 250 --prompt "Screenshot Menu")

if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
fi

case $option in
    "$option_1")
        grim "$FILE"
        notify-send "Screenshot saved" "$FILE"
        ;;

    "$option_2")
        grim - | wl-copy
        notify-send "Screenshot copied to clipboard"
        ;;

    "$option_3")
        region=$(slurp)
        [ -z "$region" ] && exit 1
        grim -g "$region" "$FILE"
        notify-send "Screenshot saved" "$FILE"
        ;;

    "$option_4")
        region=$(slurp)
        [ -z "$region" ] && exit 1
        grim -g "$region" - | wl-copy
        notify-send "Screenshot copied to clipboard"
        ;;

    "$option_5")
        region=$(slurp -w 0)
        [ -z "$region" ] && exit 1
        grim -g "$region" "$FILE"
        notify-send "Window screenshot saved" "$FILE"
        ;;

    "$option_6")
        region=$(slurp -w 0)
        [ -z "$region" ] && exit 1
        grim -g "$region" - | wl-copy
        notify-send "Window screenshot copied to clipboard"
        ;;

    *)
        exit 1
        ;;
esac


