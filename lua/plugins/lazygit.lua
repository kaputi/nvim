return {
  'kdheepak/lazygit.nvim',
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 0.9
  end,
}
