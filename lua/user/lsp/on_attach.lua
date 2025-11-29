local function on_attach(client, bufnr)
  require('user.lsp.keybindings').setup(client, bufnr)

  local navic_ok, navic = pcall(require, 'nvim-navic')
  if navic_ok then
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end
end

return on_attach
