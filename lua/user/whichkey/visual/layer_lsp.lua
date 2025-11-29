return {
  name = '>> LSP <<',
  key = 'l',
  keymaps = {
    {
      'f',
      '<escape><cmd>w<CR>gv<cmd>lua require("conform").format()<CR><escape><cmd>w<CR>',
      'Format selection',
    },
  },
}
