# multilib repository
echo "[multilib]
Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

# install packages

# dev packages
pacman -Syu base-devel git python

# system basics
pacman -Su networkmanager pipewire lib32-pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack man-db

# UI
pacman -Su awesome lightdm lightdm-slik-greeter dmenu picom

# Software
pacman -Su alacritty xterm firefox wireplumber code discord qpwgraph curl ffmpeg filezilla thunderbird gwenview vlc dolphin htop lshw blueman print-manager libreoffice-still okular gnome-screenshot spotify-launcher neofetch

# Graphics drivers
pacman -Su vulkan-icd-loader lib32-vulkan-icd-loader nvidia-utils lib32-nvidia-utils qt5ct

# Steam :)
pacman -Su ttf-liberation wqy-zenhei steam

# setup systemctls
systemctl enable NetworkManager.service
systemctl enable lightdm.service

# set lightdm greeter
echo "[Seat:*]
greeter-session=lightdm-slick-greeter
" >> /etc/lightdm/lightdm.conf

# set keyboard layout
localectl set-x11-keymap de

# Install Rustup
echo "\n\n\nInstalling Rust\n\n\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh