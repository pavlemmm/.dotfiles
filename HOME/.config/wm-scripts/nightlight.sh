#!/usr/bin/env bash

if pgrep -x rofi >/dev/null; then
    pkill rofi
    exit 0
fi

option_1="1     Temp 1000K"
option_2="2     Temp 1500K"
option_3="3     Temp 2000K"
option_4="4     Temp 2500K"
option_5="5     Temp 3000K"
option_6="6     OFF"


option=$(printf "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi -dmenu -p "night-light menu" -matching prefix -i)


case $option in
    $option_1)
        pkill gammastep || true
        gammastep -O 1000 &
        # pkill wlsunset || true
        # wlsunset -t 1000 &
        notify-send "Night Light" "Temperature 1000K"
        ;;
    $option_2)
        pkill gammastep || true
        gammastep -O 1500 &
        # pkill wlsunset || true
        # wlsunset -t 1500 &
        notify-send "Night Light" "Temperature 1500K"
        ;;
    $option_3)
        pkill gammastep || true
        gammastep -O 2000 &
        # pkill wlsunset || true
        # wlsunset -t 2000 &
        notify-send "Night Light" "Temperature 2000K"
        ;;
    $option_4)
        pkill gammastep || true
        gammastep -O 2500 &
        # pkill wlsunset || true
        # wlsunset -t 2500 &
        notify-send "Night Light" "Temperature 2500K"
        ;;
    $option_5)
        pkill gammastep || true
        gammastep -O 3000 &
        # pkill wlsunset || true
        # wlsunset -t 3000 &
        notify-send "Night Light" "Temperature 3000K"
        ;;
    $option_6)
        pkill gammastep || true
        # pkill wlsunset || true
        notify-send "Night Light" "Turned off"
        ;;
    *) exit 1 ;;
esac
