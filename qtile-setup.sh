#!/bin/bash

export USERNAME=johnyan
export HELPER_DIR=$(pwd)/helpers
export QTILE_SETUP_DIR=$(pwd)/qtile-setup

# user setup
bash $HELPER_DIR/user-setup.sh $USERNAME

# locale setup
bash $HELPER_DIR/locale-setup.sh

# yay setup
sudo -u $USERNAME bash $HELPER_DIR/yay-setup.sh

# install packages
yay -Syu --needed --noconfirm \
  lightdm \
  lightdm-gtk-greeter \
  accountsservice \
  xorg \
  xorg-server \
  qtile \
  python-pip \
  lxappearance \
  nitrogen \
  alacritty \
  picom \
  archlinux-wallpaper \
  openssh \
  vim \
  alsa-utils \
  pulseaudio \
  pulseaudio-alsa \
  ttf-meslo-nerd-font-powerlevel10k \
  adobe-source-han-sans-cn-fonts \
  adobe-source-han-serif-cn-fonts \
  # xfce4-terminal

# yay cleanup
echo yes | yay -Scc

# configure display
sed -i 's/#display-setup-script=/display-setup-script=xrandr --output Virtual-1 --mode 1920x1080/' /etc/lightdm/lightdm.conf

# configure audio
amixer sset Master '50%'

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
cd $QTILE_SETUP_DIR
sudo -u $USERNAME -E HELPER_DIR -E QTILE_SETUP_DIR /bin/bash qtile-user-setup.sh

