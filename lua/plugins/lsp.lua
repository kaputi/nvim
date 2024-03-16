return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  config = function()
    require('user.lsp.lspGui')

    local globalOpts = {
      on_attach = require('user.lsp.on_attach'),
      capabilities = require('user.lsp.capabilities'),
      root_dir = require('lspconfig').util.root_pattern('package.json', '.git'),
    }

    require('mason').setup({})
    require('mason-lspconfig').setup()
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        require('lspconfig')[server_name].setup(globalOpts)
      end,
    })

    vim.api.nvim_create_augroup('_lsp', {})
    vim.api.nvim_create_autocmd({ 'CursorHold' }, {
      group = '_lsp',
      callback = function()
        require('user.functions').lineDiagnostics()
      end,
    })

    -- too many errors for vulkan that don't matter to me
    -- require('lspconfig').glslls.setup({})
  end,
}
