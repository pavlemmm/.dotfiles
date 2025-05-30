#!/bin/bash

if pgrep -x wofi; then
    killall wofi
else
    wofi --show $1 -I
fi
