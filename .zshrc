#   ____  __                             _____        __       
#  / __ \/ /_        ____ ___  __  __   /__  /  _____/ /_      
# / / / / __ \______/ __ `__ \/ / / /_____/ /  / ___/ __ \     
#/ /_/ / / / /_____/ / / / / / /_/ /_____/ /__(__  ) / / /     
#\____/_/ /_/     /_/ /_/ /_/\__, /     /____/____/_/ /_/      
#                           /____/                             

# Export ENV - Path
export ZSH="/home/vu/.oh-my-zsh"
export DENO_INSTALL="/home/vu/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export EDITOR="nvim"
export TERM="xterm-256color"
export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab

# Theme
ZSH_THEME="typewritten"
TYPEWRITTEN_RIGHT_PROMPT_PREFIX=" "
TYPEWRITTEN_DISABLE_RETURN_CODE="true"
TYPEWRITTEN_SYMBOL="$"

#Plugins 
plugins=(git zsh-syntax-highlighting zsh-autosuggestions nvm zsh-z zsh-completions docker docker-compose docker-machine sudo npm yarn)

# Sources
source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh

# Alias
alias cat="bat"
alias sl="lsd"
alias ls="lsd"
alias ll="lsd -l"
alias lst="lsd --tree"
alias grep="rg"
alias find="fd"
alias reload="source ~/.zshrc"
alias vim="nvim"
alias :q="exit"
alias cd..="cd .."
alias ..="cd .."
alias du="dust"
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir="mkdir -vp"
alias df="df -h"
alias rm="rm -ir"
alias open="xdg-open"
alias xclip="xclip -sel clip"
alias merge="xrdb -merge ~/.Xresources"
alias svim="sudoedit"
alias fuck="code-insiders"
alias als="alacritty-theme-switch"
alias mirror="sudo reflector --latest 10 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist"

# Functions
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
