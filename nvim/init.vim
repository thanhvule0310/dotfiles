"    _   ____________ _    ________  ___
"   / | / / ____/ __ \ |  / /  _/  |/  /
"  /  |/ / __/ / / / / | / // // /|_/ / 
" / /|  / /___/ /_/ /| |/ // // /  / /  
"/_/ |_/_____/\____/ |___/___/_/  /_/   
"

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/configs.vim

for f in split(glob('~/.config/nvim/lua/*.vim'), '\n')
    exe 'source' f
endfor