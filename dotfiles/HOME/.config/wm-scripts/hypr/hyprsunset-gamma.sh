#!/usr/bin/env bash

hyprctl hyprsunset gamma $1
# makoctl dismiss -a
notify-send "Brightness" "Brightness set to $(hyprctl hyprsunset gamma)"
