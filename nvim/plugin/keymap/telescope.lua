local Remap = require("zpp.keymap")
local nnoremap = Remap.nnoremap

-- nnoremap("<leader>ps", function()
--     require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
-- end)

nnoremap("<leader>ff", function()
    require('telescope.builtin').find_files()
end)

-- nnoremap("<leader>gf", function()
--     require('telescope.builtin').git_files()
-- end)

nnoremap("<leader>fg", function()
    require('telescope.builtin').live_grep()
end)

nnoremap("<leader>fb", function()
    require('telescope.builtin').buffers()
end)

nnoremap("<leader>th", function()
    require('telescope.builtin').help_tags()
end)

-- nnoremap("<leader>vrc", function()
--     require('zpp.telescope').search_dotfiles({ hidden = true })
-- end)
-- nnoremap("<leader>va", function()
--     require('zpp.telescope').anime_selector()
-- end)
-- nnoremap("<leader>vc", function()
--     require('zpp.telescope').chat_selector()
-- end)

 nnoremap("<leader>gb", function()
     require('zpp.telescope').git_branches()
 end)
 nnoremap("<leader>gw", function()
     require('telescope').extensions.git_worktree.git_worktrees()
 end)

-- nnoremap("<leader>gm", function()
--     require('telescope').extensions.git_worktree.create_git_worktree()
-- end)
-- nnoremap("<leader>td", function()
--     require('zpp.telescope').dev()
-- end)
