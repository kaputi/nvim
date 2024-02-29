local function on_attach(client, bufnr)
  require('user.lsp.keybindings').setup(bufnr)

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    severity_sort = true,
  })

  local navic_ok, navic = pcall(require, 'nvim-navic')
  if navic_ok then
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end
end

return on_attach
