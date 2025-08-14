#!/bin/bash

if pgrep -x wofi; then
    killall wofi
else
    wofi --dmenu --prompt "Clipboard History" --no-history
fi
