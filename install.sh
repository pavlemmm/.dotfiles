#!/bin/bash


echo -e "-- Welcome to dotfiles setup script by Pavle M --\n\n"

echo "Insert your distro [arch, debian]:"
read distro

echo -e "\n"

# Define distro specific commands
if [ $distro = arch ]; then

    update_system_cmd='sudo pacman -Syu' 
    package_install_cmd='sudo pacman -S --needed' 

elif [ $distro = debian ]; then

    update_system_cmd='sudo apt update && sudo apt upgrade' 
    package_install_cmd='sudo apt install' 

else 
    echo "Wrong distro"
    exit 0
fi


# Update system
echo -e "\nUpdating system...\n"
#$update_system_cmd

# Install essential packages
echo -e "\nInstalling packages...\n"
#$package_install_cmd git neovim zsh lsd tree redshift



# Link dotfiles
echo -e "\nLinking dotfiles...\n"

dir=$(pwd)

ln -s $dir/.config/nvim $HOME/.config/nvim
ln -s $dir/.zshrc $HOME/.zshrc
ln -s $dir/.xinit $HOME/.xinit
ln -s $dir/.xprofile $HOME/.xprofile



# Install zsh plugins
echo -e "\nInstalling zsh plugins...\n"
#git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $HOME/.zsh/fast-syntax-highlighting
#git clone https://github.com/jeffreytse/zsh-vi-mode $HOME/.zsh/zsh-vi-mode
#git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
#git clone https://github.com/romkatv/powerlevel10k $HOME/.zsh/powerlevel10k





