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

Plug 'gruvbox-community/gruvbox'
Plug 'lyuts/vim-rtags'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call plug#end()



colorscheme gruvbox
set background=dark

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

let g:ctrlp_use_caching=0


let mapleader=" "

" For simple sizing of splits.
nnoremap <leader>- <C-W>-<CR>
nnoremap <leader>+ <C-W>+<CR>
nnoremap <leader>= <C-W>=<CR>

nnoremap <leader>u :UndotreeShow<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>w :wincmd w<CR>






