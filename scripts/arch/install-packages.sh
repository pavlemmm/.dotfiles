#!/bin/bash

#############################################
# PACMAN PACKAGES
#############################################

hyprland="hyprland hypridle hyprlock hyprsunset hyprpolkitagent hyprqt6engine xdg-desktop-portal-hyprland hyprpaper"

audio="pipewire pipewire-pulse wireplumber pavucontrol"

window_manager_utils="rofi alacritty waybar wl-clipboard cliphist grim slurp mako libnotify playerctl"
# extra:
# ly nwg-look

base="base-devel"

fonts="noto-fonts-emoji ttf-jetbrains-mono-nerd"

network="networkmanager"

bluetooth="bluez bluez-utils bluetui blueman"

drivers="libva-mesa-driver mesa amd-ucode"
# extra:
# xf86-video-amdgpu

terminal="zsh neovim eza zoxide stow man fzf"

sudo pacman -Syu
sudo pacman -S --needed "$terminal"

#############################################
# YAY PACKAGES
#############################################

fonts="inter-font"

yay -Sy "$fonts"
