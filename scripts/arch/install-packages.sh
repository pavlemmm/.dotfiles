#!/usr/bin/env bash

set -e

pacman_packages=(
  # Base
  base-devel

  # Hyprland
  hyprland hypridle hyprlock hyprsunset hyprpolkitagent hyprqt6engine xdg-desktop-portal-hyprland hyprpaper

  # Audio
  pipewire pipewire-pulse wireplumber pavucontrol

  # WM Tools
  rofi alacritty waybar wl-clipboard cliphist grim slurp mako libnotify playerctl

  # Fonts
  noto-fonts-emoji ttf-jetbrains-mono-nerd

  # Network
  networkmanager

  # Bluetooth
  bluez bluez-utils bluetui blueman

  # Drivers
  libva-mesa-driver mesa amd-ucode

  # Terminal
  zsh neovim eza zoxide stow man fzf
)

sudo pacman -Syu
sudo pacman -S --needed "${pacman_packages[@]}"

if ! command -v yay >/dev/null 2>&1; then
  echo "yay not found, skipping aur packages"
  exit 1
fi

yay_packages=(
  # Fonts
  inter-font
)

yay -S --needed "${yay_packages[@]}"
