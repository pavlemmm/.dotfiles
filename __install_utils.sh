#!/bin/bash

is_yes() {
    [[ -z "$1" || "$1" == "Y" || "$1" == "y" ]]
}

install_packages() {
    if [[ ! -f /usr/bin/pacman && ! -f /usr/bin/apt  ]]; then
        echo -e "\nPacket manager not supported\n"
        return
    fi

    source ./__packages_to_install.sh

    if [ -f /usr/bin/pacman ]; then
            # ARCH BASED
            echo -e "\nInstalling packages with pacman...\n"
            sudo pacman -Syu
            sudo pacman -S --needed $packages_to_install
    else
        # DEBIAN BASED
        echo -e "\nInstalling packages with apt...\n"
        sudo apt update && sudo apt upgrade
        sudo apt install $packages_to_install

    fi

}

enable_color_and_multilib() {
    echo -e "\nEnabling color and multilib in /etc/pacman.conf...\n"

    echo -e "\n\nColor\n\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" | sudo tee -a /etc/pacman.conf > /dev/null
}

install_yay() {
    echo -e "\nInstalling yay...\n"

    git clone https://aur.archlinux.org/yay.git $HOME/yay
    (cd $HOME/yay && makepkg -si && rm -rf $HOME/yay)
}

install_zsh_plugins() {
    echo -e "\nInstalling zsh plugins...\n"
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $HOME/.zsh/fast-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
    git clone https://github.com/romkatv/powerlevel10k $HOME/.zsh/powerlevel10k
}
