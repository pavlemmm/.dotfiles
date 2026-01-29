#!/usr/bin/env bash

( cd $HOME/.dotfiles/dotfiles || exit
stow -t $HOME HOME
stow -t / ROOT )

echo "Dotfiles has been successfully linked"

