require("zpp.set")
require("zpp.packer")
require("zpp.neogit")
-- require("zpp.debugger")
-- require("zpp.rtp")

-- -- BUG: this won't update the search count after pressing `n` or `N`
-- -- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- -- o.lazyredraw = true
--
-- -- COLORSCHEMES
-- -- Uncomment just ONE of the following colorschemes!
-- -- local ok, _ = pcall(vim.cmd, 'colorscheme base16-dracula')
-- -- local ok, _ = pcall(vim.cmd, 'colorscheme base16-gruvbox-dark-medium')
-- -- local ok, _ = pcall(vim.cmd, 'colorscheme base16-monokai')
-- -- local ok, _ = pcall(vim.cmd, 'colorscheme base16-nord')
-- -- local ok, _ = pcall(vim.cmd, 'colorscheme base16-oceanicnext')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-onedark')
-- -- local ok, _ = pcall(vim.cmd, 'colorscheme palenight')
-- -- local ok, _ = pcall(vim.cmd, 'colorscheme base16-solarized-dark')
-- -- local ok, _ = pcall(vim.cmd, 'colorscheme base16-solarized-light')
-- -- local ok, _ = pcall(vim.cmd, 'colorscheme base16-tomorrow-night')
--
--
-- -- -- Highlight the region on yank
-- -- A.nvim_create_autocmd('TextYankPost', {
-- --     group = num_au,
-- --     callback = function()
-- --         vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
-- --     end,
-- -- })
--
--
-- -- KEYBINDINGS
-- local function map(m, k, v)
--     vim.keymap.set(m, k, v, { silent = true })
-- end
--
--
-- -- PLUGINS
-- -- Only required if you have packer configured as `opt`
-- -- vim.cmd [[packadd packer.nvim]]
-- return require('packer').startup(function()
--   -- Packer can manage itself
--   use 'wbthomason/packer.nvim'
--
--   -- A better status line
--   use {
--     'nvim-lualine/lualine.nvim',
--     requires = { 'kyazdani42/nvim-web-devicons', opt = true }
--   }
--
--   -- -- File management --
--   -- use 'vifm/vifm.vim'
--   -- use 'scrooloose/nerdtree'
--   -- use 'tiagofumo/vim-nerdtree-syntax-highlight'
--   -- use 'ryanoasis/vim-devicons'
--
--   -- -- Productivity --
--   -- use 'vimwiki/vimwiki'
--   -- use 'jreybert/vimagit'
--
--   -- -- Tim Pope Plugins --
--   -- use 'tpope/vim-surround'
--
--   -- -- Syntax Highlighting and Colors --
--   -- use 'PotatoesMaster/i3-vim-syntax'
--   -- use 'kovetskiy/sxhkd-vim'
--   -- use 'vim-python/python-syntax'
--   -- use 'ap/vim-css-color'
--
--   -- -- Junegunn Choi Plugins --
--   -- use 'junegunn/goyo.vim'
--   -- use 'junegunn/limelight.vim'
--
--   -- -- Colorschemes
--   -- use 'RRethy/nvim-base16'
--   -- use 'kyazdani42/nvim-palenight.lua'
--
--   -- -- Other stuff
--   -- use 'frazrepo/vim-rainbow'
-- end)
local augroup = vim.api.nvim_create_augroup
ZppGroup = augroup('Zpp', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
    group = ZppGroup,
    pattern = "*.rs",
    callback = function()
        require("lsp_extensions").inlay_hints{}
    end
})

autocmd({"BufWritePre"}, {
    group = ZppGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
