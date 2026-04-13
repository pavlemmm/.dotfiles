#!/usr/bin/env bash

dir="$HOME/Pictures/Screenshots"
file="$dir/$(date +%Y-%m-%d_%H-%M-%S).png"

mkdir -p "$dir" || exit 1
grim "$file" || exit 1
wl-copy < "$file" || exit 1
# notify-send --app-name "Screenshot" "Full screenshot copied & saved"
