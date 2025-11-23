local gui = require('user.gui')

-- local signsLsp = {
--   { name = 'DiagnosticSignError', text = gui.diagnostics.error },
--   { name = 'DiagnosticSignWarn', text = gui.diagnostics.warning },
--   { name = 'DiagnosticSignHint', text = gui.diagnostics.hint },
--   { name = 'DiagnosticSignInfo', text = gui.diagnostics.info },
-- }

-- for _, sign in ipairs(signsLsp) do
--   vim.fn.sign_define(sign.name, {
--     texthl = sign.name,
--     text = sign.text,
--     numhl = sign.name,
--   })
-- end

local signsLsp = {
  error = { hl = 'DiagnosticSignError', text = gui.diagnostics.error },
  warn = { hl = 'DiagnosticSignWarn', text = gui.diagnostics.warning },
  hint = { hl = 'DiagnosticSignHint', text = gui.diagnostics.hint },
  info = { hl = 'DiagnosticSignInfo', text = gui.diagnostics.info },
}

vim.diagnostic.config({
  virtual_text = MySettings.virtual_text,
  -- signs = MySettings.signs,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signsLsp.error.text,
      [vim.diagnostic.severity.WARN] = signsLsp.warn.text,
      [vim.diagnostic.severity.INFO] = signsLsp.info.text,
      [vim.diagnostic.severity.HINT] = signsLsp.hint.text,
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = signsLsp.error.hl,
      [vim.diagnostic.severity.WARN] = signsLsp.warn.hl,
      [vim.diagnostic.severity.INFO] = signsLsp.info.hl,
      [vim.diagnostic.severity.HINT] = signsLsp.hint.hl,
    },
    -- linehl = {
    --   [vim.diagnostic.severity.ERROR] = signsLsp.error.hl,
    --   [vim.diagnostic.severity.WARN] = signsLsp.warn.hl,
    --   [vim.diagnostic.severity.INFO] = signsLsp.info.hl,
    --   [vim.diagnostic.severity.HINT] = signsLsp.hint.hl,
    -- },
  },
  underline = MySettings.underline,
  severity_sort = MySettings.severity_sort,
  virtual_lines = MySettings.virtual_lines,
})

vim.lsp.protocol.CompletionKind = gui.kind
