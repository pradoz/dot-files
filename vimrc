 1 set nocompatible              " be iMproved, required
 2 filetype off                  " required
 3
 4 " set the runtime path to include Vundle and initialize
 5 set rtp+=~/.vim/bundle/Vundle.vim
 6 call vundle#begin()
 7 " alternatively, pass a path where Vundle should install plugins
 8 "call vundle#begin('~/some/path/here')
 9
10 " let Vundle manage Vundle, required
11 Plugin 'VundleVim/Vundle.vim'
12 Plugin 'preservim/nerdtree'
13 Plugin 'morhetz/gruvbox'
14
15
16
17
18
19 " All of your Plugins must be added before the following line
20 call vundle#end()            " required
21 filetype plugin indent on    " required
22 " To ignore plugin indent changes, instead use:
23 "filetype plugin on
24 "
25 " Brief help
26 " :PluginList       - lists configured plugins
27 " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
28 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
29 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
30 "
31 " see :h vundle for more details or wiki for FAQ
32 " Put your non-Plugin stuff after this line
33
34 colorscheme gruvbox
35
36
37 set number
38 set numberwidth=3
39 set tabstop=4
40 set shiftwidth=4
41 set expandtab
42
43
44
45
46
47
48 " let
49 let mapleader = " "
50
51 " For simple sizing of splits.
52 map <leader>- <C-W>-
53 map <leader>+ <C-W>+
54 map <leader>= <C-W>=
55
56 map <leader>h :wincmd h<CR>
57 map <leader>j :wincmd j<CR>
58 map <leader>k :wincmd k<CR>
59 map <leader>l :wincmd l<CR>
60 map <leader>w :wincmd w<CR>
61
62 map <leader>f :NERDTreeToggle<CR>
63
