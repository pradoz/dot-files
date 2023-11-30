local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
    'pylsp',
    'tsserver',
    'lua_ls',
})


local cmp = require('cmp')

local cmp_select = { behavior = cmp.SelectBehavior.Insert }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = { }
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false}
    vim.keymap.set('n', '<leader>fh', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', 'gR', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', 'gI', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('n', 'gd', function() vim.cmd('execute \"normal g*\"') vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', 'gh', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', 'L', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
