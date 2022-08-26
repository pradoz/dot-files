local Remap = require("zpp.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("Y", "y$")
nnoremap("n", "nzz")
nnoremap("N", "Nzz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- For simple sizing of splits.
nnoremap("<leader>-", ":vertical resize -5<CR>")
nnoremap("<leader>+", ":vertical resize +5<CR>")
nnoremap("<leader>=", "<C-W>=<CR>")

-- source %
-- nnoremap("<leader>s :source ~/.vimrc", "<CR>")
nnoremap("<leader>s", ":sp <CR>")
nnoremap("<leader>v", ":vsp <CR>")

nnoremap("<leader>o", "<C-o><CR>")
nnoremap("<leader>i", "<C-i><CR>")

nnoremap("<leader>h", ":wincmd h<CR>")
nnoremap("<leader>j", ":wincmd j<CR>")
nnoremap("<leader>k", ":wincmd k<CR>")
nnoremap("<leader>l", ":wincmd l<CR>")
nnoremap("<leader>w", ":wincmd w<CR>")


--  vnoremap("<leader>d", "\"_d")
--
--  -- greatest remap ever
--  xnoremap("<leader>p", "\"_dP")
--
--  -- next greatest remap ever : asbjornHaland
--  nnoremap("<leader>y", "\"+y")
--  vnoremap("<leader>y", "\"+y")
--  nmap("<leader>Y", "\"+Y")
--
--  nnoremap("<leader>d", "\"_d")
--  vnoremap("<leader>d", "\"_d")
--
-- This is going to get me cancelled
-- inoremap("<C-c>", "<Esc>")

-- nnoremap("Q", "<nop>")
-- nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- nnoremap("<C-k>", "<cmd>cnext<CR>zz")
-- nnoremap("<C-j>", "<cmd>cprev<CR>zz")
-- nnoremap("<leader>k", "<cmd>lnext<CR>zz")
-- nnoremap("<leader>j", "<cmd>lprev<CR>zz")

-- nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--[[
nnoremap("<leader>tc", function()
    tail.reset()
    tmux.reset()
end);

nnoremap("<leader>ta", function()
    tail.reset()
    tmux.reset()
end);
]]--
