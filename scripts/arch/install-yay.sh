#!/usr/bin/env bash

set -e

git clone https://aur.archlinux.org/yay.git $HOME/yay

(
  cd $HOME/yay || exit
  makepkg -si
  rm -rf $HOME/yay
)

echo "Yay has been installed"
