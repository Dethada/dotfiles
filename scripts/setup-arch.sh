#!/bin/bash

# tested on manjaro

# install packages
sudo pacman -Sy --noconfirm alacritty neovim universal-ctags tmux python-pip nodejs npm xorg-server xorg-xinit xorg-xrandr lightdm lightdm-gtk-greeter bspwm sxhkd feh firefox dmenu

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
/tmp/fonts/install.sh
rm -rf /tmp/fonts

# coc-python dependencies
pip3 install --user jedi black

# yabar
# will have sudo and pacman prompt
yay -S --removemake --nodiffmenu --noeditmenu --nouseask --nocleanmenu --noupgrademenu yabar-git

# lockscreen
sudo systemctl enable lightdm.service

# dhcp client
sudo systemctl enable dhcpcd
sudo systemctl start dhcpcd

# if in vm install vmware tools
if grep -qi vmware /sys/class/dmi/id/product_name; then
  sudo pacman -S open-vm-tools xf86-video-vmware gtkmm gtk2
  sudo systemctl enable vmtoolsd.service
  sudo systemctl start vmtoolsd.service
  sudo systemctl enable vmware-vmblock-fuse.service
  sudo systemctl start vmware-vmblock-fuse.service
fi
sudo systemctl start lightdm.service
