#!/bin/bash

git clone https://aur.archlinux.org/yay.git $HOME/yay

(
cd $HOME/yay || exit
makepkg -si
rm -rf $HOME/yay
)

echo "Yay has been installed"
