set exrc
set noerrorbells
set number
set relativenumber
set incsearch
set nohlsearch
set hidden
set nowrap

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

set smartcase
set smartindent
set noshowmode
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set clipboard=unnamedplus

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set updatetime=50

set colorcolumn=80
highlight ColorColumn ctermbg=0, guibg=lightgrey

set scrolloff=999

" start plugins
call plug#begin('~/.vim/plugged')

" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'neovim/nvim-lspconfig'
" Plug 'gruvbox-community/gruvbox'
" Plug 'mbbill/undotree'

" All of your Plugins must be added before the following line

call plug#end()


colorscheme gruvbox
" set background=dark
highlight Normal guibg=none

let mapleader=" "

" For simple sizing of splits.
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>= <C-W>=<CR>
nnoremap <leader>u :UndotreeShow<CR>

" nnoremap gd gD

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>w :wincmd w<CR>

" lua << EOF
"     require'lspconfig'.pyright.setup{}
" EOF
