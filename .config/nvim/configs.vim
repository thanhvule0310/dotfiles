set termguicolors
set background=dark
colorscheme nord
set t_Co=256
highlight Normal ctermbg=None
highlight SpecialKey ctermbg=none ctermfg=8
highlight NonText ctermbg=none ctermfg=8
highlight Comment cterm=italic
highlight htmlArg cterm=italic
syntax on

set cursorline

let mapleader = "\<Space>"
filetype plugin on
filetype indent plugin on
" autocmd BufEnter * :set scroll=10
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

set encoding=UTF-8
set mouse=a
set nojoinspaces
set incsearch 
set hlsearch
set laststatus=2
set autowrite
set autoread
set noshowmode
set showcmd
set ruler

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

set ignorecase
set smartcase

set softtabstop=0
set textwidth=80
"set colorcolumn=+1

set visualbell
set noerrorbells
set lazyredraw

set nobackup
set noswapfile
set nowrap

set number
set relativenumber
set numberwidth=5

set clipboard=unnamedplus

let g:python3_host_prog = '/usr/bin/python3'
let g:perl_host_prog = '/usr/bin/perl'
" ===== KEYBINDINGS =====
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

nnoremap <Left> :echom "⛔ Use h bro! 😈"<CR>
nnoremap <Right> :echom "⛔ Use l bro! 😈"<CR>
nnoremap <Up> :echom "⛔ Use k bro! 😈"<CR>
nnoremap <Down> :echom "⛔ Use j bro! 😈"<CR>
