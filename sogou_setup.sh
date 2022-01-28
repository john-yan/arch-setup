#!/bin/bash

cd ~

yay -S fcitx fcitx-configtool fcitx-sogoupinyin

cat > ~/.pam_environment << "EOF"
GTK_IM_MODULE DEFAULT=fcitx
QT_IM_MODULE  DEFAULT=fcitx
XMODIFIERS    DEFAULT=\@im=fcitx
EOF

echo "run_im fcitx" >> ~/.xinputrc

cat >> ~/.xprofile << "EOF"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GTK_THEME_VARIANT=dark
EOF

