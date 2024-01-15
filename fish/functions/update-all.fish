function update-all
    echo -e "\\033[0;34m\\033[1m::\\033[0m\\033[1m Cleanup"
    sudo paccache -rk3
    paru -Sc --aur --noconfirm

    echo -e "\\033[0;34m\\033[1m::\\033[0m\\033[1m Sync fastest mirrors"
    rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist
    rate-mirrors chaotic-aur | sudo tee /etc/pacman.d/chaotic-mirrorlist

    paru -Syyu

    echo -e "\\033[0;34m\\033[1m::\\033[0m\\033[1m Flatpak"
    flatpak update
end
