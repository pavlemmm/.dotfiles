#!/usr/bin/env bash

dnf_packages=(
  # Terminal
  zsh neovim eza zoxide stow man fzf

  # WM Tools
  rofi alacritty waybar wl-clipboard cliphist grim slurp mako libnotify playerctl

  # Audio
  pipewire pipewire-pulseaudio wireplumber pavucontrol

  # Fonts
  noto-emoji-fonts jetbrains-mono-fonts

  # Network
  NetworkManager

  #Bluetooth
  bluez bluez-tools blueman
)

sudo dnf -y upgrade
sudo dnf -y install "${dnf_packages[@]}"

echo "Fedora packages installed"
