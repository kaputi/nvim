return {
  'eero-lehtinen/oklch-color-picker.nvim',
  event = 'VeryLazy',
  version = '*',
  keys = {
    {
      '<leader>i',
      function()
        require('oklch-color-picker').pick_under_cursor()
      end,
      desc = 'Color pick under cursor',
    },
  },
  opts = {},
}
