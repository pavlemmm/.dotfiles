#!/bin/bash


echo -e "---# Welcome to dotfiles setup script by Pavle M #---"
echo -e "_____________________________________________________\n"


### UPDATE AND INSTALL PACKAGES ###
packets_to_install="git neovim zsh lsd tree redshift"

echo -e "\nDo you want to install essential packets? ($packets_to_install) [Y/n]: \c"
read -r yn

[[ $yn = "Y" || $yn = "y" ]] &&
if [ -f /usr/bin/pacman ]; then
    echo -e "/nInstalling packets with pacman/n"
    sudo pacman -Syu
    sudo pacman -S --needed $packets_to_install
elif [ -f /usr/bin/apt ]; then
    echo -e "/nInstalling packets with apt/n"
    sudo apt update && sudo apt upgrade
    sudo apt install $packets_to_install
else 
    echo "Packet manager not supported"
fi





### LINK DOTFILES ###
echo -e "\nDo you want to link dotfiles? [Y/n]: \c"
read -r yn

if [[ $yn = "Y" || $yn = "y" ]]; then 
    echo -e "\nLinking dotfiles...\n"

    dir=$(pwd)

    # Link in home dir
    for file in $dir/{.,}*; do
        if [[ ! $file =~ (\.config|install\.sh|\.$|\.git) ]]; then # RegEx expression
            ln -sv $file $HOME
        fi
    done

    # Link in .config dir
    for file in $dir/.config/{.,}*; do
        if [[ ! $file =~ \.$ ]]; then # RegEx expression
            ln -sv $file $HOME/.config
        fi
    done
fi






### INSTALL ZSH PLUGINS ###

echo -e "\nDo you want to download zsh plugins? [Y/n]: \c"
read -r yn

if [[ $yn = "Y" || $yn = "y" ]]; then 
    echo -e "\nInstalling zsh plugins...\n"
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $HOME/.zsh/fast-syntax-highlighting
    git clone https://github.com/jeffreytse/zsh-vi-mode $HOME/.zsh/zsh-vi-mode
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
    git clone https://github.com/romkatv/powerlevel10k $HOME/.zsh/powerlevel10k
fi
