#!/bin/bash

# create config directory
mkdir -p ~/.config/{qtile,nitrogen,alacritty}

# configure qtile
cp qtile-config.py ~/.config/qtile/config.py
pip install psutil

# configure alacritty
cp alacritty.yml ~/.config/alacritty/alacritty.yml

# configure sogou, vim and zsh
bash $HELPER_DIR/sogou_setup.sh
bash $HELPER_DIR/vim_setup.sh
bash $HELPER_DIR/zsh_setup.sh

# configure gtk theme
bash $HELPER_DIR/theme_setup.sh

# configure xprofile
cat > ~/.xprofile << 'EOF'
nitrogen --restore
picom -b
fcitx -d
EOF

# configure picom
cp /etc/xdg/picom.conf ~/.config/picom.conf
sed -i 's/vsync = true/vsync = false/' ~/.config/picom.conf
cat >> ~/.config/picom.conf << EOF

opacity-rule = [
    "90:class_g = 'Alacritty'",
];

EOF

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

## configure terminal
#mkdir -p ~/.config/xfce4/terminal/
#cat > ~/.config/xfce4/terminal/terminalrc << "EOF"
#[Configuration]
#MiscAlwaysShowTabs=FALSE
#MiscBell=FALSE
#MiscBellUrgent=FALSE
#MiscBordersDefault=TRUE
#MiscCursorBlinks=FALSE
#MiscCursorShape=TERMINAL_CURSOR_SHAPE_BLOCK
#MiscDefaultGeometry=80x24
#MiscInheritGeometry=FALSE
#MiscMenubarDefault=FALSE
#MiscMouseAutohide=FALSE
#MiscMouseWheelZoom=TRUE
#MiscToolbarDefault=FALSE
#MiscConfirmClose=TRUE
#MiscCycleTabs=TRUE
#MiscTabCloseButtons=TRUE
#MiscTabCloseMiddleClick=TRUE
#MiscTabPosition=GTK_POS_TOP
#MiscHighlightUrls=TRUE
#MiscMiddleClickOpensUri=FALSE
#MiscCopyOnSelect=FALSE
#MiscShowRelaunchDialog=TRUE
#MiscRewrapOnResize=TRUE
#MiscUseShiftArrowsToScroll=FALSE
#MiscSlimTabs=FALSE
#MiscNewTabAdjacent=FALSE
#MiscSearchDialogOpacity=100
#MiscShowUnsafePasteDialog=TRUE
#ScrollingBar=TERMINAL_SCROLLBAR_NONE
#BackgroundMode=TERMINAL_BACKGROUND_TRANSPARENT
#BackgroundDarkness=0.800000
#FontName=MesloLGS NF 12
#FontAllowBold=FALSE
#Encoding=UTF-8
#EOF


