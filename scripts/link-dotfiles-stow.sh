#!/usr/bin/env bash

set -e

(
  cd $HOME/.dotfiles/dotfiles || exit
  stow -t $HOME HOME
  stow -t / ROOT
)

echo "Dotfiles has been successfully linked with stow"

