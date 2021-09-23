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
set indentexpr
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

set mouse=a " mouse wheel scrolling
set scrolloff=999

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" start plugins
call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'hrsh7th/nvim-compe'
" Plug 'mbbill/undotree'
Plug 'gruvbox-community/gruvbox'
" Plug 'rhysd/git-messenger.vim/'

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
" nnoremap <leader>u :UndotreeShow<CR>

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
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"

" let g:vsnip_snippet_dir='~/.vim/zp-snippets'
" let g:completion_enable_snippets='vim-vsnip'
" let g:git_messenger_include_diff='current'


lua require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach; }
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach; }
lua require'lspconfig'.yamlls.setup{ on_attach=require'completion'.on_attach; }
lua require'lspconfig'.terraformls.setup{ on_attach=require'completion'.on_attach; }

" telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fe <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

