syntax on
set noerrorbells
set number
set numberwidth=3
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set noswapfile
set smartcase
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0, guibg=lightgrey

set scrolloff=999

" start plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call plug#end()
"



colorscheme gruvbox
set background=dark






let mapleader=" "

" For simple sizing of splits.
map <leader>- <C-W>-
map <leader>+ <C-W>+
map <leader>= <C-W>=

map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>w :wincmd w<CR>






