return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  config = function()
    require('user.lsp.lspGui')

    vim.lsp.config('denols', {
      root_dir = require('lspconfig').util.root_pattern('deno.json'),
    })

    vim.lsp.config('*', {
      on_attach = require('user.lsp.on_attach'),
      root_markers = { '.git', '.hg', 'package.json' },
      capabilities = require('user.lsp.capabilities'),
    })

    -- too many errors for vulkan that don't matter to me
    -- require('lspconfig').glslls.setup({})

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    require('mason').setup({
      ensure_installed = {
        -- 'js-debug-adapter',
      },
    })
    require('mason-lspconfig').setup()

    vim.api.nvim_create_augroup('_lsp', {})
    local whitelist = {
      'python',
      'lua',
      'go',
      'javascript',
      'typescript',
      'typescriptreact',
      'javascriptreact',
      'bash',
      'wgsl',
    } -- Add your desired filetypes
    vim.api.nvim_create_autocmd('CursorHold', {
      group = vim.api.nvim_create_augroup('_lsp', { clear = true }),
      callback = function()
        local ft = vim.bo.filetype
        for _, allowed in ipairs(whitelist) do
          if ft == allowed then
            require('user.functions').lineDiagnostics()
            break
          end
        end
      end,
    })
  end,
}
