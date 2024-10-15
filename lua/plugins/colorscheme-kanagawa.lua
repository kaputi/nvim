return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    if MySettings.colorscheme == 'kanagawa' then
      vim.cmd('colorscheme kanagawa')
    end
  end,
}
