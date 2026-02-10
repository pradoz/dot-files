vim.o.exrc = true
vim.o.nu = true
vim.o.relativenumber = true
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.hidden = true
vim.o.wrap = false
vim.o.winborder = 'rounded'

-- vim.g.netrw_dirhistmax = 0
-- vim.g.netrw_home = vim.fn.stdpath('data')
-- vim.g.netrw_localcopydircmd = 'cp -r'
-- vim.g.netrw_liststyle = 0      -- Simple list (fastest)
-- vim.g.netrw_fastbrowse = 2     -- Fast browsing

vim.o.shada = "'50,<50,s10,h"

vim.o.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50'
vim.o.termguicolors = true

vim.o.lazyredraw = false

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "python",
  command = "setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab"
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "c,lua,yaml,yml,javascript,javascriptreact,javascript.jsx,typescript,typescriptreact,typescript.tsx",
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab"
})

vim.o.smartcase = true
vim.o.smartindent = true
vim.o.showmode = false

vim.o.mouse = "a" -- mouse wheel scrolling

vim.o.updatetime = 50
vim.o.colorcolumn = "80"
vim.opt.isfname:append("@-@")
vim.o.scrolloff = 16


vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.clipboard = "unnamedplus"

vim.opt_local.formatoptions:remove({ 'r', 'o' })

if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
    -- ` as prefix for clipboard operations
    vim.keymap.set('n', '`y', '"+y', { remap = true, desc = 'Yank to clipboard (operator)' })
    vim.keymap.set('n', '`yy', '"+yy', { remap = true, desc = 'Yank line to clipboard' })
    vim.keymap.set('n', '`Y', '"+y$', { remap = true, desc = 'Yank to end to clipboard' })
    vim.keymap.set('n', '`Y', '"+y$', { remap = true, desc = 'Yank to end to clipboard' })
    vim.keymap.set('v', '`y', '"+y', { remap = true, desc = 'Yank selection to clipboard' })
    vim.keymap.set('n', '`p', '"+p', { remap = true, desc = 'Paste from clipboard after' })
    vim.keymap.set('n', '`P', '"+P', { remap = true, desc = 'Paste from clipboard before' })
    vim.keymap.set('v', '`p', '"+p', { remap = true, desc = 'Paste from clipboard' })
    vim.keymap.set('n', '`d', '"+d', { remap = true, desc = 'Delete to clipboard (operator)' })
    vim.keymap.set('n', '`dd', '"+dd', { remap = true, desc = 'Delete line to clipboard' })
    vim.keymap.set('v', '`d', '"+d', { remap = true, desc = 'Delete selection to clipboard' })
end

-- Don't sync with system clipboard by default
vim.o.clipboard = ''
