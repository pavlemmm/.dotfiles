#!/usr/bin/env bash

dir="$HOME/Pictures/Screenshots"
file="$dir/$(date +%Y-%m-%d_%H-%M-%S).png"

mkdir -p "$dir" || exit 1
grim -g "$(slurp)" "$file" || exit 1
wl-copy < "$file" || exit 1
# notify-send --app-name "Screenshot" "Selection screenshot copied & saved"
