#!/bin/bash

cd ~
yay -S --noconfirm gnome-themes-extra gtk-engine-murrine sassc
echo yes | yay -Scc

git clone https://github.com/vinceliuice/Fluent-gtk-theme.git && \
  cd Fluent-gtk-theme && \
  bash ./install.sh -c dark -s standard -i arch --tweaks round

gsettings set org.gnome.desktop.interface gtk-theme Fluent-round-dark
gsettings set org.gnome.desktop.default-applications.terminal exec alacritty
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''


mkdir -p ~/.config/gtk-3.0
cat > ~/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-application-prefer-dark-theme = true
gtk-theme-name = Fluent-round-dark
EOF
