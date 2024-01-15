export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

export GOPATH="$HOME/Workspace/Extra/go"
export PATH="$GOPATH/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

export PATH="$HOME/.config/emacs/bin:$PATH"

ZSH_THEME=""

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"

plugins=(fast-syntax-highlighting zsh-completions zsh-autosuggestions extract rust yarn docker npm golang zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"

function update-all {
	echo -e "\\033[0;34m\\033[1m::\\033[0m\\033[1m Cleanup"
	sudo paccache -rk3
	paru -Sc --aur --noconfirm

	echo -e "\\033[0;34m\\033[1m::\\033[0m\\033[1m Sync fastest mirrors"
	rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist
	rate-mirrors chaotic-aur | sudo tee /etc/pacman.d/chaotic-mirrorlist

	paru -Syyu

	echo -e "\\033[0;34m\\033[1m::\\033[0m\\033[1m Flatpak"
	flatpak update
}

# pnpm
export PNPM_HOME="/home/thanhvule0310/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
