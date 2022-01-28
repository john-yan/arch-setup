#!/bin/bash

# sogou setup
bash sogou_setup.sh

cat > ~/.xprofile << 'EOF'
nitrogen --restore
picom -b
fcitx -d
EOF

# configure zsh
cd ~
git clone --recursive https://github.com/john-yan/ohmyzsh.git .oh-my-zsh
cp ~/.oh-my-zsh/zshrc ~/.zshrc
cp ~/.oh-my-zsh/p10k.zsh ~/.p10k.zsh

# create config directory
mkdir -p ~/.config/{qtile,nitrogen,xfce4}
mkdir -p ~/.config/xfce4/terminal/

# configure picom
cp /etc/xdg/picom.conf ~/.config/picom.conf
sed -i 's/vsync = true/vsync = false/' ~/.config/picom.conf

# configure nitrogen
cat > ~/.config/nitrogen/bg-saved.cfg << "EOF"
[xin_-1]
file=/usr/share/backgrounds/archlinux/landscape.jpg
mode=4
bgcolor=#000000
EOF

cat > ~/.config/nitrogen/nitrogen.cfg << "EOF"
[geometry]
posx=960
posy=0
sizex=952
sizey=1048

[nitrogen]
view=icon
recurse=true
sort=alpha
icon_caps=false
dirs=/usr/share/backgrounds/archlinux;
EOF

# configure terminal
cat > ~/.config/xfce4/terminal/terminalrc << "EOF"
[Configuration]
MiscAlwaysShowTabs=FALSE
MiscBell=FALSE
MiscBellUrgent=FALSE
MiscBordersDefault=TRUE
MiscCursorBlinks=FALSE
MiscCursorShape=TERMINAL_CURSOR_SHAPE_BLOCK
MiscDefaultGeometry=80x24
MiscInheritGeometry=FALSE
MiscMenubarDefault=FALSE
MiscMouseAutohide=FALSE
MiscMouseWheelZoom=TRUE
MiscToolbarDefault=FALSE
MiscConfirmClose=TRUE
MiscCycleTabs=TRUE
MiscTabCloseButtons=TRUE
MiscTabCloseMiddleClick=TRUE
MiscTabPosition=GTK_POS_TOP
MiscHighlightUrls=TRUE
MiscMiddleClickOpensUri=FALSE
MiscCopyOnSelect=FALSE
MiscShowRelaunchDialog=TRUE
MiscRewrapOnResize=TRUE
MiscUseShiftArrowsToScroll=FALSE
MiscSlimTabs=FALSE
MiscNewTabAdjacent=FALSE
MiscSearchDialogOpacity=100
MiscShowUnsafePasteDialog=TRUE
ScrollingBar=TERMINAL_SCROLLBAR_NONE
BackgroundMode=TERMINAL_BACKGROUND_TRANSPARENT
BackgroundDarkness=0.800000
FontName=MesloLGS NF 12
FontAllowBold=FALSE
Encoding=UTF-8
EOF


