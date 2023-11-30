vim.opt.exrc = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.wrap = false


vim.opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50'
vim.opt.termguicolors = true

vim.opt.lazyredraw = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.showmode = false

vim.opt.mouse = "a" -- mouse wheel scrolling

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.isfname:append("@-@")
vim.opt.scrolloff = 16


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.clipboard = "unnamedplus"

if vim.fn.has('wsl') == 1 then
    vim.api.nvim_create_autocmd('TextYankPost', {
        group = vim.api.nvim_create_augroup('Yank', { clear = true }),
        callback = function()
            vim.fn.system('clip.exe', vim.fn.getreg('"'))
        end,
    })
end
-- in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil
--
-- if in_wsl then
--     vim.g.clipboard = {
--         name = 'wsl clipboard',
--         copy =  { ["+"] = { "clip.exe" },   ["*"] = { "clip.exe" } },
--         paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
--         cache_enabled = false,
--     }
-- end
