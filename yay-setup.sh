#!/bin/bash

# install yay
cd ~
pacman -Syu --needed --noconfirm base-devel git
git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si --noconfirm

# clean up
cd ..
rm -rf yay-bin
