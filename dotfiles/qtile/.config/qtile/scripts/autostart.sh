#!/bin/bash

xrandr --rate 240 &
picom &

xinput set-prop 'LVT ENDGAME GEAR XM1' 'libinput Accel Profile Enabled' 0 1 &