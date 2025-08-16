#!/bin/bash

if pgrep -x "waybar" > /dev/null
then
    pkill waybar
else
    waybar -c ~/.config/waybar/hypr/config.jsonc -s ~/.config/waybar/hypr/style.css &
fi
