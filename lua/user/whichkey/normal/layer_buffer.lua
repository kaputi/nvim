return {
  name = '>> Buffers <<',
  ['b'] = { '<cmd>Telescope buffers<CR>', 'Find Buffer' },
  -- ['d'] = { '<cmd>bp | bd! #<CR>', 'Delete Buffer Without Saving' },
  ['d'] = { '<cmd>Bdelete!<CR>', 'Delete Buffer Without Saving' },
  ['D'] = { '<cmd>%bd<CR>', 'Delete All Buffers' },
  ['k'] = {
    '<cmd>lua require"user.functions".killWindowlessBufs()<CR>',
    'Delete buffers not in window',
  },
  ['K'] = {
    '<cmd>lua require"user.functions".killAllBuffersButFocused()<CR>',
    -- '<cmd>%bd!|edit #|bd #|normal `"<CR>',
    'Delete all Buffers but focused',
  }, -- %bd kills all, edit # opens last ,bd # kills last(after killing all there is a new empty buffer) '" goes to last place before close
  -- ['k'] = {'<cmd>BufferCloseAllButCurrent<CR>', 'Delete Other Buffers'},
  -- ['n'] = { '<cmd>BufferLineCycleNext<CR>', 'Previous Buffer' },
  ['n'] = { '<cmd>bn<CR>', 'Previous Buffer' },
  ['N'] = { '<cmd>enew<CR>', 'New Empty Buffer' },
  -- ['p'] = { '<cmd>BufferLineCyclePrev<CR>', 'Previous Buffer' },
  ['p'] = { '<cmd>bp<CR>', 'Previous Buffer' },
}
