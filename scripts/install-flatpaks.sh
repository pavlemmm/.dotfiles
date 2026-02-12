#!/usr/bin/env bash

set -e

setup_flathub() {
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  echo "Flathub remote added"
}

install_zen_browser() {
  flatpak install flathub app.zen_browser.zen
  echo "Zen browser installed"
}

setup_flathub
# install_zen_browser
