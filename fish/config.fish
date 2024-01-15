fish_vi_key_bindings

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block
set fish_vi_force_cursor 1
set -g fish_greeting
set -x GOPATH $HOME/Workspace/Extra/go
set -x PNPM_HOME $HOME/.local/share/pnpm

fish_add_path -p $GOPATH/bin $HOME/.cargo/bin $HOME/.local/share/bob/nvim-bin

set -x EDITOR nvim

fnm env --use-on-cd | source
zoxide init fish | source
starship init fish | source

function vim --wraps nvim
    nvim $argv
end

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

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
