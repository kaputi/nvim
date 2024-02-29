local gui = require('user.gui')

local signsLsp = {
  { name = 'DiagnosticSignError', text = gui.diagnostics.error },
  { name = 'DiagnosticSignWarn', text = gui.diagnostics.warning },
  { name = 'DiagnosticSignHint', text = gui.diagnostics.hint },
  { name = 'DiagnosticSignInfo', text = gui.diagnostics.info },
}

for _, sign in ipairs(signsLsp) do
  vim.fn.sign_define(sign.name, {
    texthl = sign.name,
    text = sign.text,
    numhl = sign.name,
  })
end

vim.lsp.protocol.CompletionKind = gui.kind
