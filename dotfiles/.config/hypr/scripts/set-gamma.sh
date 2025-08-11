#!/bin/bash
hyprctl hyprsunset gamma $1
notify-send "Brightness" "Brightness set to $(hyprctl hyprsunset gamma)"
