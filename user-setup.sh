#!/bin/bash

# create user
useradd -mG wheel $1
echo -e "$1\n$1" | passwd $1

pacman -Syu --needed --noconfirm sudo zsh

# enable sudo for user
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# change default shell to zsh
chsh -s /bin/zsh $1

