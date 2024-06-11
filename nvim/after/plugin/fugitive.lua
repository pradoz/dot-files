local cwd = vim.fn.getcwd()

local branch
if string.find(cwd, "mission_data_lake") then
    branch = "main"
elseif string.find(cwd, "goldfish%-hpc") then
    branch = "main"
elseif string.find(cwd, "velvet") then
    branch = "trunk"
end

vim.keymap.set('n', '<leader>gg', vim.cmd.Git)
vim.keymap.set('n', '<leader>gc', function() vim.cmd('Git commit') end)
vim.keymap.set('n', '<leader>gp', function() vim.cmd('Git push') end)
vim.keymap.set('n', '<leader>gP', function() vim.cmd('Git push -fu') end)
vim.keymap.set('n', '<leader>gr', function() vim.cmd('Git rebase -i ' .. branch) end)

vim.keymap.set('n', '<leader>gw', function()
    vim.cmd('Git add -u')
    vim.cmd('Git commit -m "WIP"')
    vim.cmd('Git push')
end)

vim.keymap.set('n', '<leader>gW', function()
    vim.cmd('Git add -u')
    vim.cmd('Git commit -m "WIP"')
end)
