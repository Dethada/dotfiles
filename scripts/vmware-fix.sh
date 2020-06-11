#!/bin/sh
# fix the vmware tool
sudo systemctl restart vmtoolsd.service
# give it time to readjust resolution
read -p "Press enter to readjust wallpaper"
# fix background
feh --bg-fill $HOME/pics/wallpaper.jpg
