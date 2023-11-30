vim.keymap.set('n', '<leader>gg', vim.cmd.Git)
vim.keymap.set('n', '<leader>gc', function() vim.cmd('Git commit') end)
vim.keymap.set('n', '<leader>gp', function() vim.cmd('Git push') end)
vim.keymap.set('n', '<leader>gr', function() vim.cmd('Git rebase -i dev') end)
vim.keymap.set('n', '<leader>gw',
function()
    vim.cmd('Git add -u')
    vim.cmd('Git commit -m "WIP"')
    vim.cmd('Git push')
end)


