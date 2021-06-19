#!/bin/bash

# Only Tested on Arch Linux 5.12.11 x86_64

# Custom installer script to set up Arch the way I want it

systemctl start dhcpcd && systemctl enable dhcpcd

curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg

echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

sudo pacman --noconfirm -Syu base-devel sublime-text xorg xorg-xinit xmonad xmonad-contrib xmobar git alacritty nitrogen dmenu virtualbox-guest-utils firefox 

git clone https://aur.archlinux.org/yay-git.git

cd yay && makepkg -si 

cd ../

yay -S --noconfirm nerd-fonts-mononoki

cp .xmonad ~
cp .config ~
cp .xinitrc ~
cp -r wallpapers ~

nitrogen --set-scaled --random ~/wallpapers



