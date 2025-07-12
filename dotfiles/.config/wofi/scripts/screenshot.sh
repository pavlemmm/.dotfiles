#!/bin/bash

if pgrep -x wofi; then
    killall wofi
else
    DIR="$HOME/Pictures/screenshots/"

    option_1="1   Capture Screen"
    option_2="2   Capture Screen at Clipboard"
    option_3="3   Capture Selection"
    option_4="4   Capture Selection at Clipboard"
    option_5="5   Capture Window"
    option_6="6   Capture Window at Clipboard"

    option=$(printf "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | wofi --show dmenu --width 350 --height 250 --prompt "Screenshot Menu")

    if [ ! -d $DIR ]; then
    mkdir -p $DIR
    fi

    case $option in
        $option_1) grimshot savecopy screen ;;
        $option_2) grimshot copy screen ;;
        $option_3) grimshot savecopy area  ;;
        $option_4) grimshot copy area ;;
        $option_5) grimshot savecopy window ;;
        $option_6) grimshot copy window ;;
        *) exit 1 ;;
    esac

fi





