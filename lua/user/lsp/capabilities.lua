local function getCapabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local cmp_ok, cmp = pcall(require, 'cmp_nvim_lsp')
  if cmp_ok then
    getCapabilities = cmp.default_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = { 'documentation', 'detail', 'additionalTextEdits' },
    }
  end
  return capabilities
end
return getCapabilities()
