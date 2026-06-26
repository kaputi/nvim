-- Quickfix titles that should auto-close when selecting an item
local auto_close_titles = {
  'References',
  'references',
  'Definitions',
  'Declarations',
  'Implementations',
  'Type Definitions',
  'Incoming Calls',
  'Outgoing Calls',
}

return {
  'kevinhwang91/nvim-bqf',
  ft = 'qf',
  dependencies = {
    -- provides `fzf#run`, required by bqf's `zf` fuzzy filter.
    -- fzf binary already lives at /usr/bin/fzf, so no build step.
    { 'junegunn/fzf' },
  },
  opts = {},
}
