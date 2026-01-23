-- NOTE: this adds functionality outside lsp, but kinda the same. for example formatter
-- for direct lsp functionality check  user.lsp.keybindings
return {
  name = '>> LSP <<',
  key = 'l',
  keymaps = {
    {
      'f',
      '<cmd>lua require("conform").format({async = false, timeout_ms = 3000})<CR><escape>',
      'format',
    },
  },
}
