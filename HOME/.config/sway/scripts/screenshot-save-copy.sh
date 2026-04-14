#!/usr/bin/env bash

dir="$HOME/Pictures/Screenshots"
file="$dir/$(date +%Y-%m-%d_%H-%M-%S).png"

mkdir -p "$dir"
grim -g "$(slurp)" "$file"
wl-copy < "$file"
# notify-send --app-name "Screenshot" "Selection screenshot copied & saved"
