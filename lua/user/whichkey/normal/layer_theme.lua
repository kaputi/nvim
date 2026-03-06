return {
  name = '>> Theme <<',
  key = 'T',
  keymaps = {
    {
      'f',
      '<cmd>lua require"user.theme".cycle_tokyonight()<CR>',
      'Cycle flavour',
    },
  },
}
