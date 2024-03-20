return {
  'catppuccin/nvim',
  lazy = false,
  priority = 1000,
  config = function()
    if MySettings.colorscheme == 'catppuccin' then
      vim.cmd('colorscheme catppuccin')
    end
  end,
}
