#!/bin/bash


echo -e "---# Welcome to dotfiles setup script by Pavle M #---"
echo -e "_____________________________________________________\n"


### UPDATE AND INSTALL PACKAGES ###
packages_to_install="git base-devel neovim zsh lsd tree stow"

echo -e "\nWhat WM/DE do you want to setup?\n"
choice=("Qtile" "Sway" "Other xorg" "Other wayland" "None")

install=true
select c in "${choice[@]}"; do
    case $c in
        "Qtile")
            packages_to_install="$packages_to_install qtile redshift rofi xf86-video-amdgpu mesa"
            break
            ;;
        "Sway")
            packages_to_install="$packages_to_install sway swayidle swaylock swayimg swaybg waybar wofi alacritty gammastep libva-mesa-driver mesa"
            break
            ;;
        "Other xorg")
            packages_to_install="$packages_to_install redshift xf86-video-amdgpu mesa"
            break
            ;;
        "Other wayland")
            packages_to_install="$packages_to_install gammastep libva-mesa-driver mesa"
            break
            ;;
        "None")
            install=false
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done


if [ -f /usr/bin/pacman ]; then
    # ARCH BASED
    if $install; then
        echo -e "/nInstalling packages with pacman.../n"
        sudo pacman -Syu
        sudo pacman -S --needed $packages_to_install
    fi

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


elif [ -f /usr/bin/apt ]; then
    # DEBIAN BASED
    if $install; then
        sudo apt update && sudo apt upgrade
        sudo apt install $packages_to_install
    fi


else 
    echo -e "\nPacket manager not supported\n"
fi





### LINK DOTFILES ###
echo -e "\nDo you want to link dotfiles? [Y/n]: \c"
read -r yn

if [[ $yn = "Y" || $yn = "y" ]]; then
    (cd ./dotfiles/ && stow * -t $HOME)
    fc-cache -f -v
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
