#!/bin/bash

# tested on manjaro

# install packages
sudo pacman -Sy --noconfirm alacritty neovim universal-ctags tmux python-pip nodejs npm \
                            xorg-server xorg-xinit xorg-xrandr xorg-xsetroot bspwm sxhkd feh \
                            firefox dmenu pulseaudio pulseaudio-alsa alsa-utils \
                            noto-fonts-emoji vifm openssh zsh xclip

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
/tmp/fonts/install.sh
rm -rf /tmp/fonts

# coc-python dependencies
pip3 install --user jedi black pylint

# yabar
# will have sudo and pacman prompt
yes | yay -S --removemake --nodiffmenu --noeditmenu --nouseask --nocleanmenu --noupgrademenu yabar-git
# chinese font
yes | yay -S --nodiffmenu --noeditmenu --nouseask --nocleanmenu --noupgrademenu noto-fonts-sc

# dhcp client
sudo systemctl enable dhcpcd
sudo systemctl start dhcpcd

# if in vm install vmware tools
if grep -qi vmware /sys/class/dmi/id/product_name; then
  sudo pacman -S --noconfirm open-vm-tools xf86-video-vmware mesa gtkmm3 gtk2 \
                              xf86-input-vmmouse xf86-input-libinput
  sudo systemctl enable vmtoolsd.service
  sudo systemctl start vmtoolsd.service
  sudo systemctl enable vmware-vmblock-fuse.service
  sudo systemctl start vmware-vmblock-fuse.service
  sed -i '/exec bspwm/i vmware-user-suid-wrapper &' $HOME/.xinitrc
fi

# auto run startx when logging in on tty1
echo 'if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi' >> $HOME/.bash_profile
