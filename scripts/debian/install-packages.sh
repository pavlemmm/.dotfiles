#!/usr/bin/env bash

set -e

deb_packages=(
  # Terminal
  zsh neovim eza zoxide man fzf stow 

  # WM Tools
  rofi alacritty waybar wl-clipboard cliphist grim slurp mako libnotify playerctl

  # Fonts
  noto-emoji-fonts jetbrains-mono-fonts
)

sudo apt update -y && sudo apt upgrade -y
sudo apt install -y "${deb_packages[@]}"

echo "Debian based packages installed"
