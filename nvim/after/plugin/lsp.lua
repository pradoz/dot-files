-- Enable language servers
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('lua_ls')
-- vim.lsp.enable('basedpyright')
-- vim.lsp.enable('gopls')
vim.lsp.enable('clangd')
-- vim.lsp.enable('ts_ls')
-- vim.lsp.enable('sneklsp')


vim.api.nvim_create_autocmd("LspAttach", {
  -- group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    -- local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- if client:supports_method('textDocument/completion') then
    --   -- Optional: trigger autocompletion on EVERY keypress. May be slow!
    --   -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
    --   -- client.server_capabilities.completionProvider.triggerCharacters = chars
    --   vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    -- end

    -- Custom keymaps
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gR', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'L', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>fh', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>F', vim.lsp.buf.format, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
  end,
})

vim.cmd [[set completeopt+=menuone,noselect,popup]]
