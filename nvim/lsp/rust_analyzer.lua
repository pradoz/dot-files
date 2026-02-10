return {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml', '.git' },
    settings = {
        ["rust-analyzer"] = {
            completion = {
                postfix = { enable = true },
                callable = { snippets = "fill_arguments" },
            },
        }
    },
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    -- ignore server preselect
                    preselectSupport = false,
                },
            },
        },
    },
}
