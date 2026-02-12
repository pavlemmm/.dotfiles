#!/usr/bin/env bash

set -e

enable_copr() {
  sudo dnf -y copr enable alternateved/eza
  sudo dnf -y copr enable lihaohong/yazi
  sudo dnf -y copr enable agriffis/neovim-nightly
  sudo dnf copr enable scottames/ghostty
}

install_dnf_packages() {
  dnf_packages=(
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
  )

  sudo dnf -y upgrade
  sudo dnf -y install "${dnf_packages[@]}"

  echo "Fedora packages installed"
}

# ---------------------------------------------------------------------
enable_copr
install_dnf_packages
# ---------------------------------------------------------------------
