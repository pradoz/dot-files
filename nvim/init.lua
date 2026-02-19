require("zpprado")

local gh = function(x) return 'https://github.com/' .. x end


local plugins = {
  {
    src = gh('rose-pine/neovim'),
    name = 'rose-pine',
  },
  -- {
  --   src = gh('rebelot/kanagawa.nvim'),
  --   name = 'kanagawa',
  -- },
  { src = gh('nvim-lua/plenary.nvim') },
  { src = gh('nvim-telescope/telescope.nvim') },
  { src = gh('nvim-treesitter/nvim-treesitter') },
  { src = gh('nvim-treesitter/nvim-treesitter-context') },
  { src = gh('theprimeagen/harpoon') },
  { src = gh('mbbill/undotree') },
  { src = gh('tpope/vim-fugitive') },
  -- { src = gh('neovim/nvim-lspconfig') },
  { src = gh('mason-org/mason.nvim') },
  { src = gh('L3MON4D3/LuaSnip') },
  { src = gh('saghen/blink.cmp'), version = 'v1.8.0' },
  { src = gh('stevearc/oil.nvim') },
}

vim.pack.add(plugins)

require ('mason').setup()
require ('oil').setup({
  win_options = {
      winbar = "%#@attribute.builtin#%{substitute(v:lua.require('oil').get_current_dir(), '^' . $HOME, '~', '')}",
  }
	-- win_options = {
	-- 	winbar = "%{v:lua.require('oil').get_current_dir()}",
	-- },
})
vim.keymap.set('n', '<leader>e', ':Oil<CR>')


-- build keep-list from specs
local function get_plugin_name(spec)
  if type(spec) == 'string' then
    return spec:match('.*/(.+)$'):gsub('%.git$', '')
  end
  return spec.name or spec.src:match('.*/(.+)$'):gsub('%.git$', '')
end

function PackSync()
  local keep = {}
  for _, spec in ipairs(plugins) do
    keep[get_plugin_name(spec)] = true
  end

  local to_remove = vim.iter(vim.pack.get())
      :filter(function(x) return not keep[x.spec.name] end)
      :map(function(x) return x.spec.name end)
      :totable()

  if #to_remove == 0 then
    print("Nothing to remove")
    return
  end

  print("Removing: " .. table.concat(to_remove, ", "))
  vim.pack.del(to_remove, { force = true })
end

vim.api.nvim_create_user_command('PackSync', PackSync, {})

print("(> '.')># ... (>'#'<)")
