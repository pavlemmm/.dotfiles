#!/bin/bash

cliphist list | ~/.config/rofi/scripts/launch.sh -dmenu -p "clipboard manager" | cliphist decode | wl-copy