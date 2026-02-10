require('nvim-treesitter.install').compilers = { 'gcc', 'clang', 'cc' }

-- New API setup
require('nvim-treesitter').setup({
    ensure_installed = {
        'markdown', 'lua', 'rust', 'typescript', 'javascript',
        'c', 'cpp', 'zig', 'python', 'bash',
    },
})

-- Enable treesitter highlighting
vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        'markdown', 'lua', 'rust', 'typescript', 'javascript',
        'c', 'cpp', 'zig', 'python', 'bash',
    },
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

-- Treesitter context
local ok, context = pcall(require, 'treesitter-context')
if ok then
    context.setup({
        enable = true,
        max_lines = 3,
        line_numbers = true,
        multiline_threshold = 3,
        trim_scope = 'outer',
        mode = 'cursor',
    })
end
