#!/usr/bin/env bash

# Clear previous notifications
makoctl dismiss -a

# Set volume +/- by 5%
wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ $1

# Get volume and mute state
if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED; then
    notify-send "🔇 Audio" "Muted"
else
    VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
    notify-send "🔊 Audio" "Volume: ${VOL}%"
fi
