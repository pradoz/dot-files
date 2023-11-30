function ColorBackground(color)
    color = color or "rose-pine"
    require(color).setup({
        disable_italics = true
    })

    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", {blend=50})
end

-- Set colorscheme after options
ColorBackground()
