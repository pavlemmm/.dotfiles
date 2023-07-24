#!/bin/bash

xinput set-prop 'LVT ENDGAME GEAR XM1' 'libinput Accel Profile Enabled' 0 1 & # Mouse sensitivity
xrandr --rate 240 & # Refresh rate

redshift -P -O 1300 & # Night light
picom & # Compositor
warpd & # Keyboard simulator
dunst & # Notifications deamon
nitrogen --restore & # Wallpaper engine
xfce4-power-manager & # Power manager to turn off screen and suspend/hibernate on idle
setxkbmap -layout us,rs -variant ,latin -option grp:rshift_toggle &  # Keyboard layout switcher
#                                               grp:alt_shift_toggle, grp:shifts_toggle
