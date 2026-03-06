return {
  name = '>> Table <<',
  key = 't',
  keymaps = {
    {
      'f',
      '<cmd>lua require"user.table".format_tables()<CR>',
      'Format all tables',
    },
  },
}
