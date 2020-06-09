#!/bin/bash

# install packages
sudo pacman -Sy --noconfirm alacritty neovim universal-ctags tmux python-pip nodejs npm xorg-server xorg-xinit xorg-xrandr lightdm lightdm-gtk-greeter bspwm sxhkd yabar-git open-vm-tools

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
/tmp/fonts/install.sh
rm -rf /tmp/fonts

# coc-python dependencies
pip3 install --user jedi black

# yabar
# will have sudo and pacman prompt
yay -S --removemake --nodiffmenu --noeditmenu --nouseask --nocleanmenu --noupgrademenu yabar-git
