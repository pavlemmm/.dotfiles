#!/usr/bin/env bash

set -e

install_zsh_plugins() {
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $HOME/.zsh/fast-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
  echo "Zsh plugins are now installed"
}

set_zsh_shell() {
  chsh -s $(which zsh)
  echo "Zsh is now default shell"
}

# ---------------------------------------------------------------------------
install_zsh_plugins
# set_zsh_shell
# ---------------------------------------------------------------------------

