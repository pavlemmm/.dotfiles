#!/bin/bash

# Clear all previous notifications (mako)
makoctl dismiss -a

# Toggle mute for default audio output
wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

# Check status
if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED; then
    notify-send "🔇 Audio" "Muted"
else
    VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
    notify-send "🔊 Audio" "Volume: ${VOL}%"
fi
