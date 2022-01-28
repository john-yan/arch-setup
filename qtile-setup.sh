#!/bin/bash

USERNAME=johnyan

# user setup
bash ./user-setup.sh $USERNAME

# yay setup
sudo -u $USERNAME bash ./yay-setup.sh

# install packages
yay -Syu --needed --noconfirm \
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
  vim \
  ttf-meslo-nerd-font-powerlevel10k \
  adobe-source-han-sans-cn-fonts \
  adobe-source-han-serif-cn-fonts

# locale setup
bash locale-setup.sh

# yay cleanup
echo yes | yay -Scc

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
