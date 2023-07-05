#!/bin/bash


echo -e "---# Welcome to dotfiles setup script by Pavle M #---"
echo -e "_____________________________________________________\n"


### UPDATE AND INSTALL PACKAGES ###
echo -e "\nDo you want to install packages? [Y/n]: \c"
read -r yn

if [[ $yn = "Y" || $yn = "y" ]]; then
    source ./__install_packages.sh
    install_packages
fi

if [ -f /usr/bin/pacman ]; then
    # ARCH BASED

    # Edit pacman.conf
    echo -e "\nDo you want to enable color and multilib in /etc/pacman.conf? [Y/n]: \c"
    read -r yn
    
    [[ $yn = "Y" || $yn = "y" ]] && echo -e "\n\nColor\n\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf


    
    # Install yay
    echo -e "\nDo you want to install yay (AUR Helper) [Y/n]: \c"
    read -r yn

    if [[ $yn = "Y" || $yn = "y" ]]; then
        echo -e "/nInstalling yay.../n"

        git clone https://aur.archlinux.org/yay.git $HOME/yay
        (cd $HOME/yay && makepkg -si && rm -rf $HOME/yay)
    fi
fi



### LINK DOTFILES ###
echo -e "\nDo you want to link dotfiles? [Y/n]: \c"
read -r yn

if [[ $yn = "Y" || $yn = "y" ]]; then
    stow dotfiles -t $HOME
fi

### CACHE FONTS ###
echo -e "\nDo you want to cache fonts? [Y/n]: \c"
read -r yn

[[ $yn = "Y" || $yn = "y" ]] && fc-cache -f

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


echo -e "\n\n_____________________________________________________"
echo -e "------------------ Script finished ------------------\n"
