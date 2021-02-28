"  ____  _             _           
" |  _ \| |_   _  __ _(_)_ __  ___ 
" | |_) | | | | |/ _` | | '_ \/ __|
" |  __/| | |_| | (_| | | | | \__ \
" |_|   |_|\__,_|\__, |_|_| |_|___/
"                |___/    

call plug#begin('~/.config/nvim/bundles')

" Utilities
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'SirVer/ultisnips'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'

" Colors & Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'yggdroot/indentline'
" Plug 'vim-airline/vim-airline'
Plug 'glepnir/dashboard-nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'akinsho/nvim-bufferline.lua'

" Javascript - Typescript - React Development
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'ap/vim-css-color'
Plug 'alvan/vim-closetag'

" Docker
Plug 'ekalinin/dockerfile.vim'

" Markdown
Plug 'plasticboy/vim-markdown'

call plug#end()