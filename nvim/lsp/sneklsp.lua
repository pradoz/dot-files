local sneklsp_bin = vim.fn.expand('~/sneklsp/target/release/sneklsp')

if vim.fn.executable(sneklsp_bin) ~= 1 then
  vim.notify("sneklsp binary not found at: " .. sneklsp_bin, vim.log.levels.ERROR)
  return
end

---@type vim.lsp.Config
return {
  cmd = { sneklsp_bin, 'lsp' },
  filetypes = { 'python' },
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  on_attach = function(client, bufnr)
    vim.notify("sneklsp attached to buffer " .. bufnr, vim.log.levels.INFO)
  end,
  root_dir = vim.fs.dirname(
    vim.fs.find({ "pyproject.toml", "setup.py", ".git" }, { upward = true })[1]
  ) or vim.fn.getcwd(),
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    '.git',
  },
}
