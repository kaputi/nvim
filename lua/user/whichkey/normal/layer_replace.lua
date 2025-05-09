return {
  name = '>> Replace <<',
  ['R'] = { ':%s/<C-r><C-w>/', 'Replace All Ocurrences' },
  ['r'] = { ':s/<C-r><C-w>/', 'Replace Under Cursor' },
  ['s'] = {
    '<cmd>lua require("spectre").open_visual()<CR>',
    'Spectre (project)',
  },
  ['S'] = {
    '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
    'Spectre (project) word under cursor',
  },
  ['b'] = {
    '<cmd>lua require("spectre").open_file_search()<CR>',
    'Spectre (buffer)',
  },
  -- TODO: move to visual  and check if works ['s'] = {'"_d"*p','Replace Selection with register'},
  ['y'] = {
    ':s/<C-r><C-w>/<C-r>0<CR>',
    'Replace Under Cursor With Register',
  },
  ['Y'] = {
    ':%s/<C-r><C-w>/<C-r>0/g<CR>',
    'Replace All Ocurrences With Register',
  },
}
