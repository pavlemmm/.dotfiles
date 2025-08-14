#!/bin/bash

# Clear old notifications
makoctl dismiss -a

# Toggle mute for default microphone
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# Check status
if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q MUTED; then
    notify-send "🎤 Microphone" "Muted"
else
    VOL=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print int($2*100)}')
    notify-send "🎤 Microphone" "On (${VOL}%)"
fi
