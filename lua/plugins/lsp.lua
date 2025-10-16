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

    require('mason').setup({
      ensure_installed = {
        -- 'js-debug-adapter',
      },
    })
    require('mason-lspconfig').setup()
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        local opts = globalOpts
        if server_name == 'lua_ls' then
          opts = vim.tbl_extend('force', opts, {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' },
                },
              },
            },
          })
        end
        if server_name == 'ts_ls' then
          opts = vim.tbl_extend('force', opts, {
            single_file_support = false,
            -- settings = {
            --   typescript = {
            --     inlayHints = {
            --       includeInlayParameterNameHints = 'all',
            --       includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            --       includeInlayFunctionParameterTypeHints = true,
            --       includeInlayVariableTypeHints = true,
            --       includeInlayPropertyDeclarationTypeHints = true,
            --       includeInlayFunctionLikeReturnTypes = true,
            --     },
            --   },
            -- },
          })
        end
        require('lspconfig')[server_name].setup(opts)
      end,
    })

    -- vim.api.nvim_create_augroup('_lsp', {})
    -- vim.api.nvim_create_autocmd({ 'CursorHold' }, {
    --   group = '_lsp',
    --   callback = function()
    --     -- TODO: exclude file types
    --     require('user.functions').lineDiagnostics()
    --   end,
    -- })

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

    -- too many errors for vulkan that don't matter to me
    -- require('lspconfig').glslls.setup({})

    require('lspconfig').denols.setup({
      root_dir = require('lspconfig').util.root_pattern('deno.json'),
    })
  end,
}
