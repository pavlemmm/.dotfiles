#!/bin/bash

if pgrep -x wofi; then
    killall wofi
else
    DIR="$HOME/Pictures/screenshots/"

    option_1="1)  Capture Desktop"
    option_2="2)  Capture Desktop at Clipboard"
    option_3="3)  Capture Selection"
    option_4="4)  Capture Selection at Clipboard"
    option_5="5)  Capture Window"
    option_6="6)  Capture Window at Clipboard"

    option=$(printf "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | wofi --show dmenu --width 300 --height 240 --prompt "Screenshot Menu")

    if [ ! -d $DIR ]; then
    mkdir -p $DIR
    fi

    case $option in
        $option_1) maim --format=png "$DIR/ss-$(date +%s)-desktop.png" ;;
        $option_2) maim --format=png | xclip -selection clipboard -t image/png ;;
        $option_3) maim --format=png --select "$DIR/ss-$(date +%s)-select.png" ;;
        $option_4) maim --format=png --select | xclip -selection clipboard -t image/png ;;
        $option_5) maim --format=png --window $(xdotool getactivewindow) "$DIR/ss-$(date +%s)-window.png" ;;
        $option_6) maim --format=png --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png ;;
        *) exit 1 ;;
    esac

fi





