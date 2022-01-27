#!/bin/bash

USERNAME=johnyan

# create user
bash ./create_user.sh $USERNAME

# install packages
pacman -Syu --needed --noconfirm \
  sudo \
  base-devel \
  zsh \
  git \
  lightdm \
  xorg \
  xorg-server \
  qtile \
  lxappearance \
  nitrogen \
  xfce4-terminal \
  picom \
  archlinux-wallpaper \
  lightdm-gtk-greeter \
  openssh \
  vim

# enable sudo for user
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# change default shell to zsh
chsh -s /bin/zsh $USERNAME

# configure display
sed -i 's/#display-setup-script=/display-setup-script=xrandr --output Virtual-1 --mode 1920x1080/' /etc/lightdm/lightdm.conf

# configure auto login
sed -i 's/#autologin-guest=false/autologin-guest=false/' /etc/lightdm/lightdm.conf
sed -i "s/#autologin-user=/autologin-user=$USERNAME/" /etc/lightdm/lightdm.conf
sed -i 's/#autologin-user-timeout=0/autologin-user-timeout=0/' /etc/lightdm/lightdm.conf
groupadd -r autologin
gpasswd -a $USERNAME autologin

# enable lightdm
systemctl enable lightdm.service

# enable ssh server
systemctl enable sshd.service

# user setup
sudo -u $USERNAME /bin/bash qtile-user-setup.sh
