return {
  'sainnhe/edge',
  lazy = false,
  priority = 1000,
  config = function()
    if MySettings.colorscheme == 'edge' then
      vim.cmd('colorscheme edge')
    end
  end,
}
