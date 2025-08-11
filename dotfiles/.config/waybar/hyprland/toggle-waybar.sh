#!/bin/bash

if pgrep -x "waybar" > /dev/null
then
    pkill waybar
else
    waybar -c ~/.config/waybar/hyprland/config.jsonc -s ~/.config/waybar/hyprland/style.css &
fi
