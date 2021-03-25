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
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'mbbill/undotree'

" Plug 'gruvbox-community/gruvbox'

" All of your Plugins must be added before the following line

call plug#end()

set termguicolors

let g:gruvbox_contrast_dark='hard'
if exists('+termguicolors')
    let &t_8f='\<Esc>[38;2;%lu;%lu;%lum'
    let &t_8b='\<Esc>[48;2;%lu;%lu;%lum'
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark
highlight Normal guibg=none

let mapleader=" "

" For simple sizing of splits.
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>= <C-W>=<CR>
nnoremap <leader>u :UndotreeShow<CR>

nnoremap <leader>o <C-o><CR>
nnoremap <leader>i <C-i><CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>w :wincmd w<CR>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" let g:completion_timer_cycle=160 " default=80

" navigate popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<Tab>"


let g:vsnip_snippet_dir='~/.vim/zp-snippets'
let g:completion_enable_snippets='vim-vsnip'


lua require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach }

" lua << EOF
"     require'lspconfig'.pyright.setup{}
" EOF

" telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

