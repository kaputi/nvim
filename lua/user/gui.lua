local M = {}

M.kind = {
  Text = '󰉿',
  Method = '󰆧',
  Function = '󰊕',
  Constructor = '',
  Field = '󰜢',
  Variable = '󰀫',
  Class = '󰠱',
  Interface = '',
  Module = '',
  Property = '󰜢',
  Unit = '󰑭',
  Value = '󰎠',
  Enum = '',
  Keyword = '󰌋',
  Snippet = '',
  Color = '󰏘',
  File = '󰈙',
  Reference = '󰈇',
  Folder = '󰉋',
  EnumMember = '',
  Constant = '󰏿',
  Struct = '󰙅',
  Event = '',
  Operator = '󰆕',
  TypeParameter = '𝙏',
}
M.diagnostics = {
  error = '',
  warning = '',
  hint = '',
  info = '',
}

M.getSignAndHl = function(diagnostic)
  if diagnostic.severity == 1 then
    return M.diagnostics.error, 'DiagnosticSignError'
  end
  if diagnostic.severity == 2 then
    return M.diagnostics.warning, 'DiagnosticSignWarn'
  end
  if diagnostic.severity == 3 then
    return M.diagnostics.hint, 'DiagnosticSignHint'
  end
  if diagnostic.severity == 4 then
    return M.diagnostics.info, 'DiagnosticSignInfo'
  end
end

return M
