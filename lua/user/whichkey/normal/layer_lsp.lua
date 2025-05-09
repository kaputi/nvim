-- NOTE: this adds functionality outside lsp, but kinda the same. for example formatter
-- for direct lsp functionality check  user.lsp.keybindings
return {
  ['f'] = { '<cmd>lua require("conform").format()<CR><escape>', 'format' },
}
