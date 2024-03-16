return {
  -- 'sainnhe/edge',
  'lunarvim/darkplus.nvim',
  -- 'catppuccin/nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- vim.cmd('colorscheme edge')
    vim.cmd('colorscheme darkplus')
    -- vim.cmd('colorscheme catppuccin')
  end,
}
