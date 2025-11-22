#!/bin/bash

# HYPRLAND
hyprland="hyprland hypridle hyprlock hyprsunset hyprpolkitagent hyprqt6engine xdg-desktop-portal-hyprland hyprpaper"

# AUDIO
audio="pipewire pipewire-pulse wireplumber pavucontrol"

# WM UTILS
wm="rofi alacritty waybar wl-clipboard cliphist grim slurp mako libnotify playerctl"
wm_extra="ly nwg-look"

# BASE
base="base-devel"

# FONTS
fonts="noto-fonts-emoji"

# NETWORK
network="networkmanager"

# BLUETOOTH
bluetooth="bluez bluez-utils bluetui blueman"

# DRIVERS
drivers="libva-mesa-driver mesa amd-ucode"
# [ XORG DRIVERS ]
# xf86-video-amdgpu

# TERM
term="zsh neovim eza zoxide stow man starship"

# AUR PACKAGES
# catppuccin-gtk-theme-mocha

packages_to_install="$term $wm"
