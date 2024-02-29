return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({
      ui = {
        -- code_action = '',
        code_action = '',
      },
      symbol_in_winbar = {
        enable = false,
      },
      code_action = {
        extend_gitsigns = true,
        show_server_name = true,
      },
    })
  end,
}
