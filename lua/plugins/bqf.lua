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
  opts = {
    func_map = {
      open = '',
    },
  },
  keys = {
    {
      '<CR>',
      function()
        local title = vim.fn.getqflist({ title = 1 }).title or ''
        vim.cmd('.cc')
        for _, pattern in ipairs(auto_close_titles) do
          if title:match(pattern) then
            vim.cmd('cclose')
            return
          end
        end
      end,
      ft = 'qf',
      desc = 'Open item and conditionally close quickfix',
    },
  },
}
