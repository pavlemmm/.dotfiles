#!/bin/bash

if pgrep -x "waybar" > /dev/null
then
    pkill waybar
else
    waybar -c ~/.config/waybar/sway/config.jsonc -s ~/.config/waybar/sway/style.css &
fi
