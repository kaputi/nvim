return {
  name = '>> Dashboard <<',
  -- ['<tab>'] = {'<cmd>Startify<CR>', 'Dashboard'},
  -- ['d'] = {'<cmd>:SDelete<CR>', 'Delete Session'},
  -- ['l'] = {'<cmd>:SLoad<CR>', 'Load Session'},
  -- ['s'] = {'<cmd>:SSave<CR>', 'Save Session'},
  ['a'] = { '<cmd>Alpha<CR>', 'Dashboard' },
  ['<tab>'] = {
    '<cmd>:Telescope sessions initial_mode=normal save_current=true<CR>',
    'Load Session',
  },
  ['s'] = { '<cmd>:SaveSession<CR>', 'Save Session' },
}
