#!/bin/bash

# Install zsh plugins
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $HOME/.zsh/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions

echo "Zsh plugins are now installed"

chsh -s $(which zsh)

echo "Zsh is now default shell"
