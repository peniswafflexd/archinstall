#!/bin/bash

# Only Tested on Arch Linux 5.12.11 x86_64

# Custom installer script to set up Arch the way I want it

USERNAME="peniswaffle"

systemctl start dhcpcd && systemctl enable dhcpcd

pacman -Syu --noconfirm base-devel xorg xorg-xinit xmonad xmonad-contrib xmobar alacritty nitrogen dmenu virtualbox-guest-utils firefox picom pacman-contrib

git clone https://aur.archlinux.org/yay-git.git


cd yay-git && sudo -u $USERNAME makepkg --noconfirm -si

cd ../

sudo -u $USERNAME yay -S --noconfirm nerd-fonts-mononoki otf-font-awesome-5-free sublime-text

cp -r .xmonad /home/$USERNAME/
cp -r .config /home/$USERNAME/
cp -r .xinitrc /home/$USERNAME/
cp -r wallpapers /home/$USERNAME/

if [ ! -d "/home/$USERNAME/.local" ] 
then
    mkdir /home/$USERNAME/.local
fi
if [ ! -d "/home/$USERNAME/.local/bin/" ] 
then
    mkdir /home/$USERNAME/.local/bin
fi
echo "cupd=$(checkupdates | wc -l) \n echo \"$cupd updates\"" > /home/$USERNAME/.local/bin/pacupdate


nitrogen --set-scaled --random ~/wallpapers



