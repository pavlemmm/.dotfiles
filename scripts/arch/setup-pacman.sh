#!/usr/bin/env bash

sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf

sudo pacman -Sy

echo "Color and multilib in /etc/pacman.conf are enabled now"
