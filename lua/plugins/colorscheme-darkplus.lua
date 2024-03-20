return {
  'lunarvim/darkplus.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    if MySettings.colorscheme == 'darkplus' then
      vim.cmd('colorscheme darkplus')
    end
  end,
}
