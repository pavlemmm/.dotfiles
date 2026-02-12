#!/usr/bin/env bash

set -e

install_jetbrains_nerd_font() {
  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' EXIT

  curl -L -o "$tmp/JetBrainsMono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"

  unzip -q "$tmp/JetBrainsMono.zip" -d "$tmp"

  sudo mkdir -p /usr/local/share/fonts/jetbrains-nerd
  sudo rm -rf /usr/local/share/fonts/jetbrains-nerd/*
  sudo mv "$tmp"/*.ttf /usr/local/share/fonts/jetbrains-nerd/

  # sudo fc-cache -fv >/dev/null

  echo "JetBrains Mono Nerd Font installed"
}

cache_fonts() {
  fc-cache -f
  echo "Fonts have been successfully cached"
}

# ---------------------------------------------------------------------------
install_jetbrains_nerd_font
cache_fonts
# ---------------------------------------------------------------------------
