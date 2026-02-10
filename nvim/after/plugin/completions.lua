local ls = require('luasnip')

require('blink.cmp').setup({
  keymap = {
    preset = 'enter',
    ['<Tab>'] = {
      function(cmp)
        if cmp.is_visible() then
          return cmp.select_next()
        end

        local in_snippet = ls.session and ls.session.current_nodes and
            ls.session.current_nodes[vim.api.nvim_get_current_buf()]
        if in_snippet and ls.jumpable(1) then
          vim.schedule(function()
            ls.jump(1)
          end)
          return true
        end
      end,
      'fallback',
    },
    ['<S-Tab>'] = {
      function(cmp)
        if cmp.is_visible() then
          return cmp.select_prev()
        end

        if ls.jumpable(-1) then
          vim.schedule(function()
            ls.jump(-1)
          end)
          return true
        end
      end,
      'fallback',
    },
    ['<C-y>'] = { 'accept', 'fallback' },
    ['<CR>'] = { 'accept', 'fallback' },
    ['<C-Space>'] = { 'show', 'fallback' },
    ['<C-e>'] = { 'cancel', 'fallback' },
  },

  sources = {
    default = { 'snippets', 'lsp', 'buffer', 'path' },
    providers = {
      lsp = {
        transform_items = function(_, items)
          -- Strip preselect from all items
          for _, item in ipairs(items) do
            item.preselect = false
          end
          return items
        end,
      },
    },
  },

  snippets = {
    preset = 'luasnip',
    -- -- Custom expand to ensure LuaSnip tracks properly
    -- expand = function(snippet)
    --   ls.lsp_expand(snippet)
    -- end,
  },

  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 150 },
    list = {
      max_items = 20,
      selection = { preselect = true, auto_insert = true },
    },
    menu = {
      draw = {
        columns = {
          { "label",     "label_description", gap = 1 },
          { "kind_icon", "kind" }
        },
      }
    },
  },

  fuzzy = { implementation = 'prefer_rust' },
})
