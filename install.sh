#!/bin/bash

source ./__install_utils.sh

echo -e "---# Welcome to dotfiles setup script by Pavle M #---"
echo -e "_____________________________________________________\n"



### UPDATE AND INSTALL PACKAGES ###
echo -e "\nDo you want to install packages? [Y/n]: \c"
read -r yn

if is_yes "$yn" && install_packages



### DISTRO SPECIFIC ACTIONS ###
if [ -f /usr/bin/pacman ]; then
    # ARCH BASED

    # Edit pacman.conf
    echo -e "\nDo you want to enable color and multilib in /etc/pacman.conf? [Y/n]: \c"
    read -r yn
    
    is_yes "$yn" && enable_color_and_multilib


    # Install yay
    echo -e "\nDo you want to install yay (AUR Helper) [Y/n]: \c"
    read -r yn

    if is_yes "$yn" && install_yay
fi



### LINK DOTFILES ###
echo -e "\nDo you want to link dotfiles? [Y/n]: \c"
read -r yn

if is_yes "$yn" && stow dotfiles -t $HOME



### CACHE FONTS ###
echo -e "\nDo you want to cache fonts? [Y/n]: \c"
read -r yn

is_yes "$yn" && fc-cache -f



### INSTALL ZSH PLUGINS ###
echo -e "\nDo you want to download zsh plugins? [Y/n]: \c"
read -r yn

if is_yes "$yn" && install_zsh_plugins



echo -e "\n\n_____________________________________________________"
echo -e "------------------ Script finished ------------------\n"
