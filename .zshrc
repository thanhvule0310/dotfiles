eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

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

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
source $ZSH/oh-my-zsh.sh

alias vim="nvim"

# pnpm
export PNPM_HOME="/home/thanhvule0310/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
