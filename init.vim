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

set clipboard+=unnamedplus
" let g:clipboard = {
"           \   'name': 'win32yank-wsl',
"           \   'copy': {
"           \      '+': 'win32yank.exe -i --crlf',
"           \      '*': 'win32yank.exe -i --crlf',
"           \    },
"           \   'paste': {
"           \      '+': 'win32yank.exe -o --lf',
"           \      '*': 'win32yank.exe -o --lf',
"           \   },
"           \   'cache_enabled': 0,
"           \ }

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set updatetime=50

set colorcolumn=80
highlight ColorColumn ctermbg=0, guibg=lightgrey

 set mouse=a " mouse wheel scrolling
set scrolloff=999

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" start plugins
call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'hrsh7th/nvim-compe'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
" Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'gruvbox-community/gruvbox'

" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

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

" run current file
nnoremap <leader>rp :!python %<CR>

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
lua require'lspconfig'.graphql.setup{ on_attach=require'completion'.on_attach; }
lua require'lspconfig'.quick_lint_js.setup{ on_attach=require'completion'.on_attach; }
" lua require'lspconfig'.yamlls.setup{ on_attach=require'completion'.on_attach; }
" lua require'lspconfig'.tflint.setup{ on_attach=require'completion'.on_attach; }

" telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fe <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" harpoon
nnoremap <leader>; <cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>
nnoremap <leader>a <cmd>lua require('harpoon.mark').add_file()<cr>
nnoremap <leader>1 <cmd>lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <leader>2 <cmd>lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <leader>3 <cmd>lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <leader>4 <cmd>lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <leader>5 <cmd>lua require("harpoon.ui").nav_file(5)<cr>
nnoremap <leader>6 <cmd>lua require("harpoon.ui").nav_file(6)<cr>
nnoremap <leader>7 <cmd>lua require("harpoon.ui").nav_file(7)<cr>
nnoremap <leader>8 <cmd>lua require("harpoon.ui").nav_file(8)<cr>
nnoremap <leader>9 <cmd>lua require("harpoon.ui").nav_file(9)<cr>

" vim-fugitive
nnoremap <leader>gs <cmd>G status<cr>
nnoremap <leader>gg <cmd>G<cr>
nnoremap <leader>gc <cmd>G commit<cr>
nnoremap <leader>gp <cmd>G push<cr>

let g:compe.source.tabnine = {}
let g:compe.source.tabnine.max_line = 1000
let g:compe.source.tabnine.max_num_results = 6
let g:compe.source.tabnine.priority = 5000
" setting sort to false means compe will leave tabnine to sort the completion items
let g:compe.source.tabnine.sort = v:false
let g:compe.source.tabnine.show_prediction_strength = v:true
let g:compe.source.tabnine.ignore_pattern = ''
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
let g:compe.source.tabnine = v:true
