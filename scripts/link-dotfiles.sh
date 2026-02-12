#!/usr/bin/env bash

set -e

link_stow() {
  (
    cd $HOME/.dotfiles/dotfiles || exit
    stow -t $HOME HOME
    stow -t / ROOT
  )
  echo "Dotfiles has been successfully linked with stow"
}

link_manual() {
  # .zshrc
  ln -sfr HOME/.zshrc ~/.zshrc

  # .config
  ln -sfr HOME/.config/niri ~/.config/niri
  ln -sfr HOME/.config/sway ~/.config/sway
  ln -sfr HOME/.config/hypr ~/.config/hypr
  ln -sfr HOME/.config/waybar ~/.config/waybar
  ln -sfr HOME/.config/nvim ~/.config/nvim
  ln -sfr HOME/.config/tmux ~/.config/tmux
  ln -sfr HOME/.config/rofi ~/.config/rofi
  ln -sfr HOME/.config/ghostty ~/.config/ghostty
  ln -sfr HOME/.config/alacritty ~/.config/alacritty
  ln -sfr HOME/.config/mako ~/.config/mako
  ln -sfr HOME/.config/git ~/.config/git

  # nixos 
  sudo ln -sfr ROOT/etc/nixos/configuration.nix /etc/nixos/configuration.nix
  sudo ln -sfr ROOT/etc/nixos/flake.nix /etc/nixos/flake.nix

  echo "Dotfiles has been successfully linked manually"
}

link_stow
# link_manual

