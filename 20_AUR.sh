#!/bin/bash
echo "installing base-devel"
sudo pacman -S --needed base-devel
mkdir ~/aur_inst_builds
cd ~/aur_inst_builds

curl -L -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
tar -xvf package-query.tar.gz
cd package-query
makepkg -si
cd ..

curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar -xvf yaourt.tar.gz
cd yaourt
makepkg -si
cd ..

yaourt package-query
yaourt yaourt

rm -rf ~/aur_inst_builds

