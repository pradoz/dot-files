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

set clipboard+=unnamedplus

set noswapfile
set nobackup
" set undodir=~/.vim/undodir
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

" coq nvim
" let g:coq_settings = { 'clients.tabnine.enabled': 'true' }
let g:coq_settings = { 'display.icons.mode': 'none' }
let g:coq_settings = { 'auto_start': 'shut-up' }


" start plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" " Plug 'romgrk/nvim-treesitter-context'

" Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'gruvbox-community/gruvbox'

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

" source %
" nnoremap <leader>s :source ~/.vimrc <CR>
nnoremap <leader>s :sp <CR>
nnoremap <leader>v :vsp <CR>

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


lua require'lspconfig'.pyright.setup{ on_attach=require'coq'.lsp_ensure_capabilities; }
lua require'lspconfig'.tsserver.setup{ on_attach=require'coq'.lsp_ensure_capabilities; }
lua require'lspconfig'.quick_lint_js.setup{ on_attach=require'coq'.lsp_ensure_capabilities; }
" lua require'lspconfig'.yamlls.setup{}
" lua require'lspconfig'.tflint.setup{}

" telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fe <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

nnoremap <leader>fh <cmd>lua vim.diagnostic.open_float()<cr>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap gR <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap gI <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap gD <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap L <cmd>lua vim.lsp.buf.code_action()<CR>

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
nnoremap <leader>0 <cmd>lua require("harpoon.ui").nav_file(10)<cr>

" vim-fugitive
nnoremap <leader>gs <cmd>G status<cr>
nnoremap <leader>gg <cmd>G<cr>
nnoremap <leader>gc <cmd>G commit<cr>
nnoremap <leader>gp <cmd>G push<cr>

"" ----------- Clipboard fix for WSL2 ---------
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END

endif
