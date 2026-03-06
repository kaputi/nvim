return {
  'Kicamon/markdown-table-mode.nvim',
  ft = 'markdown',
  opts = {
    filetype = { 'markdown' },
    options = {
      insert = true,       -- auto-format on insert
      insert_leave = true, -- format when leaving insert mode
    },
  },
}
