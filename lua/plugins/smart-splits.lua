return {
  'mrjones2014/smart-splits.nvim',
  lazy = false,
  config = function()
    local smart_splits = require('smart-splits')
    smart_splits.setup({
      default_amount = 5,
    })
    local keymap = vim.keymap

    keymap.set('n', '<C-h>', smart_splits.move_cursor_left)
    keymap.set('n', '<C-j>', smart_splits.move_cursor_down)
    keymap.set('n', '<C-k>', smart_splits.move_cursor_up)
    keymap.set('n', '<C-l>', smart_splits.move_cursor_right)

    vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
  end,
}
