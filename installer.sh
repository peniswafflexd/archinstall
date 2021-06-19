#!/bin/bash

# Only Tested on Arch Linux 5.12.11 x86_64

# Custom installer script to set up Arch the way I want it

systemctl start dhcpcd && systemctl enable dhcpcd

sudo pacman -Syu --noconfirm base-devel xorg xorg-xinit xmonad xmonad-contrib xmobar alacritty nitrogen dmenu virtualbox-guest-utils firefox picom

git clone https://aur.archlinux.org/yay-git.git

cd yay-git && su nobody -c "makepkg --noconfirm -si"

cd ../

su nobody -c "yay -S --noconfirm nerd-fonts-mononoki otf-font-awesome-5-free sublime-text"

cp -r .xmonad ~
cp -r .config ~
cp -r .xinitrc ~
cp -r wallpapers ~

if [ ! -d "~/.local/bin/" ] 
then
    mkdir ~/.local/bin/
fi
echo "cupd=$(checkupdates | wc -l) \n echo \"$cupd updates\"" >> ~/.local/bin/pacupdate


nitrogen --set-scaled --random ~/wallpapers



