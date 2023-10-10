# install packages
pacman -Syu base-devel networkmanager awesome lightdm lightdm-slik-greeter alacritty xterm git pipewire lib32-pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack firefox wireplumber code discord dmenu

# setup systemctls
systemctl enable NetworkManager.service
systemctl enable lightdm.service

# set lightdm greeter
echo "[Seat:*]
greeter-session=lightdm-slick-greeter
" >> /etc/lightdm/lightdm.conf

# set keyboard layout
localectl set-x11-keymap de
