#!/usr/bin/env bash

brightnessctl set $1
# makoctl dismiss -a
notify-send "Brightness" "Brightness set to $(brightnessctl get)"
