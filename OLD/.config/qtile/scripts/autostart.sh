#!/bin/bash

xinput set-prop 'LVT ENDGAME GEAR XM1' 'libinput Accel Profile Enabled' 0 1 & # Mouse sensitivity
xrandr --rate 240 & # Refresh rate

xrandr --output DisplayPort-2 --auto --rate 240 &&
xrandr --output HDMI-A-0 --auto --left-of DisplayPort-2 --rate 60 & # Dual monitor setup

redshift -P -O 1300 & # Night light
picom & # Compositor
warpd & # Keyboard simulator
dunst & # Notifications deamon
xfce4-power-manager & # Power manager to turn off screen and suspend/hibernate on idle

