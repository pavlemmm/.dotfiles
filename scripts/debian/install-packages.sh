#!/usr/bin/env bash

set -e

deb_packages=(
  # Terminal
  zsh eza zoxide man tldr fzf yazi wl-clipboard
  
  # Development
  neovim
  nodejs
  
  # Apps
  libreoffice transmission ghostty
  
  # Gnome
  gnome-tweaks gnome-extensions-app

  # WM Tools
  #rofi alacritty waybar cliphist grim slurp mako libnotify playerctl

  # Fonts
  noto-emoji-fonts
)

sudo apt update -y && sudo apt upgrade -y
sudo apt install -y "${deb_packages[@]}"

echo "Debian based packages installed"
