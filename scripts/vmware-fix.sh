#!/bin/sh
# fix the vmware tool
sudo systemctl restart vmtoolsd.service
# give it time to readjust resolution
sleep 5
# fix background
feh --bg-fill $HOME/pics/wallpaper.jpg
