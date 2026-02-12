#!/usr/bin/env bash
set -euo pipefail

DOT="$HOME/.dotfiles/dotfiles"

HOME_DIR="$DOT/HOME"
CFG_DIR="$HOME_DIR/.config"

ROOT_DIR="$DOT/ROOT"

link() {
  local src="$1" dst="$2"

  mkdir -p "$(dirname "$dst")"

  # backup
  if [[ -e "$dst" || -L "$dst" ]]; then
    mv "$dst" "${dst}.bak"
  fi

  ln -s "$src" "$dst"
  echo "linked: $dst -> $src"
}

# ~/.config/<name>
link_cfg() {
  local name="$1"
  link "$CFG_DIR/$name" "$HOME/.config/$name"
}

# $HOME/<file>
link_home() {
  local name="$1"
  link "$HOME_DIR/$name" "$HOME/$name"
}

# /etc/nixos/<file> (root)
link_nixos() {
  sudo ln -sf "$ROOT/etc/nixos" "/etc/nixos"
  echo "linked: /etc/nixos -> $ROOT/etc/nixos"
}

link_manual() {
  # ~/*
  # link_home ".zshrc"

  # ~/.config/*
  # link_cfg niri
  # link_cfg sway
  # link_cfg hypr
  # link_cfg hyprun
  # link_cfg waybar
  # link_cfg rofi
  # link_cfg alacritty
  # link_cfg mako
  # link_cfg wm-scripts
  # link_cfg themes
  #
  # link_cfg nvim
  # link_cfg git
  # link_cfg tmux
  # link_cfg oh-my-posh
  # link_cfg dconf
  #
  # link_cfg ghostty

  # /etc/nixos/*
  link_nixos

  echo "Dotfiles linked manually"
}

link_stow() {
  (
    cd "$DOT"
    stow -t "$HOME" HOME
    sudo stow -t / ROOT
  )
  echo "Dotfiles linked with stow"
}

# ------------------------------------------------
# link_stow
link_manual
# ------------------------------------------------
