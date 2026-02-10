vim.g.mapleader = " "

vim.keymap.set('n', '<leader>-', ':vertical resize -5<CR>')
vim.keymap.set('n', '<leader>+', ':vertical resize +5<CR>')
vim.keymap.set('n', '<leader>=','<C-W>=<CR>')
vim.keymap.set('n', '<leader>r', ':resize <bar> vertical resize<CR>')

-- quickfix list navigation
vim.keymap.set('n', '[q', ':cprev<CR>')
vim.keymap.set('n', ']q', ':cnext<CR>')


vim.keymap.set('n', '<BS>p', ':!python3 %<CR>')
vim.keymap.set('n', '<BS>b', ':!bash %<CR>')
vim.keymap.set('n', '<BS>c', ':!clip.exe < %<CR>')
vim.keymap.set('n', '<BS>x', ':!chmod +x %')
vim.keymap.set('n', '<BS>w', ':w<CR>')
vim.keymap.set('n', '<BS>s', ':so<CR>')
vim.keymap.set('n', '<BS>z', ':<C-z><CR>')

vim.keymap.set('n', '<Del>', ':')


vim.keymap.set('n', '<leader>s', ':sp<CR>')
vim.keymap.set('n', '<leader>v', ':vsp<CR>')

vim.keymap.set('n', '<leader>o', '<C-o>')
vim.keymap.set('n', '<leader>i', '<C-i>')

vim.keymap.set('n', '<leader>h', ':wincmd h<CR>')
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>')
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>')
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>w', ':wincmd w<CR>')

-- vim.keymap.set("n", "gd", [[/\<<C-r><C-w>\>]])

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
