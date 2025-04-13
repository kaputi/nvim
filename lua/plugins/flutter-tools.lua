return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('flutter-tools').setup({
      -- dev_log = {
        -- enabled = false,
        --   open_cmd = 'tabnew',
        --   focus_on_open = false,
      -- },
      lsp = {
        color = {
          enabled = true,
        },
        on_attach = require('user.lsp.on_attach'),
        capabilities = require('user.lsp.capabilities'),
      },
    })
  end,
}
