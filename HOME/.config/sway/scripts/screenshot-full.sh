#!/usr/bin/env bash

dir="$HOME/Pictures/Screenshots"
file="$dir/$(date +%Y-%m-%d_%H-%M-%S).png"

mkdir -p "$dir"
grim "$file"
wl-copy < "$file"
# notify-send --app-name "Screenshot" "Full screenshot copied & saved"
