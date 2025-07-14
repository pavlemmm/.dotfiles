#!/bin/bash

###
# SWAY
# ----
# sway swayidle
# 
# [ LESS IMPORTANT ]
# swaylock swayimg swaybg
###

###
# WM UTILS
# --------
# wlsunset wofi alacritty waybar pavucontrol pulseaudio-utils brightnessctl wl-clipboard grimshot nwg-look policykit-1-gnome
#
# [ LESS IMPORTANT ]
# wlogout
#
## explanation ##
# wlsunset - night light, redshift alternative. can also use gammastep
# pulseaudio-utils, brightnessctl - used for keyboard audio/brightness control
# grimshot - screenshot util
# policykit-1-gnome - policy kit for auth
# nwg-look - set gtk theme
###

###
# BASE
# ----
# base-devel
###

###
# DRIVERS
# -------
# libva-mesa-driver mesa amd-ucode
#
# [ XORG DRIVERS ]
# xf86-video-amdgpu
###

###
# TERM COMMANDS
# -------------
# zsh neovim zsh lsd tree stow
###

packages_to_install="zsh neovim zsh lsd tree stow"
