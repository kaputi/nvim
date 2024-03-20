return {
  'oxfist/night-owl.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    if MySettings.colorscheme == 'night-owl' then
      require('night-owl').setup({
        bold = true,
        italics = true,
        underline = true,
        undercurl = true,
        transparent_background = false,
      })
      vim.cmd('colorscheme night-owl')
    end
  end,
}
