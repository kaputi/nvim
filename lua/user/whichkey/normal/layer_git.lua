return {
  name = '>> Git <<',
  key = 'g',
  keymaps = {
    { 'b', '<cmd>Gitsigns blame_line<CR>', 'Blame' },
    {
      'B',
      '<cmd>Gitsigns toggle_current_line_blame<CR>',
      'Toggle Blame Line',
    },
    { 'd', '<cmd>Gitsigns diffthis<CR>', 'Gitsigns DiffView' },
    { 'D', '<cmd>DiffviewOpen<CR>', 'DiffView' },
    { 'H', '<cmd>DiffviewFileHistory %<CR>', 'File History' },
    { 'l', '<cmd>LazyGit<CR>', 'Lazygit' },
    { 'L', '<cmd>Gitsigns toggle_linehl<CR>', 'Line Highlights' },
    { 'n', '<cmd>Gitsigns next_hunk<CR>', 'Next Hunk' },
    { 'N', '<cmd>Neogit<CR>', 'Neogit' },
    { 'p', '<cmd>Gitsigns prev_hunk<CR>', 'Previous Hunk' },
    { 'P', '<cmd>Gitsigns preview_hunk<CR>', 'Preview Hunk' },
    { 'Q', '<cmd>DiffviewClose<CR>', 'DiffView Close' },
    { 'q', '<cmd>Gitsigns setqflist<CR>', 'Hunks to qf list' },
    { 'R', '<cmd>Gitsigns refresh<CR>', 'Gitsigns Refresh' },
    { 'S', '<cmd>Gitsigns stage_buffer<CR>', 'Stage Buffer' },
    { 's', '<cmd>Gitsigns stage_hunk<CR>', 'Stage hunk' },
    { 'u', '<cmd>Gitsigns undo_stage_hunk<CR>', 'Undo stage hunk' },
    { 'v', '<cmd>Gitsigns select_hunk<CR>', 'Select Hunk' },
    {
      ']',
      '<cmd>Gitsigns next_hunk<CR><cmd>Gitsigns preview_hunk_inline<CR>',
      'Next Hunk with preview',
    },
  },
  sublayers = {
    {
      key = 'gr',
      name = '>> Reset <<',
      keymaps = {
        { 'B', '<cmd>Gitsigns reset_buffer<CR>', 'Reset Buffer' },
        { 'h', '<cmd>Gitsigns reset_hunk<CR>', 'Reset Hunk' },
        {
          'n',
          '<cmd>Gitsigns reset_hunk<CR> <cmd>Gitsigns next_hunk<CR> <cmd>Gitsigns preview_hunk<CR>',
          'Reset Hunk and go to next change (preview)',
        },
      },
    },
  },
  -- TODO:
}
