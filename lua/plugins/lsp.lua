return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  config = function()
    require('user.lsp.lspGui')

    local commonOpts = {
      on_attach = require('user.lsp.on_attach'),
      root_markers = { '.git', '.hg' },
      capabilities = require('user.lsp.capabilities'),
    }

    vim.lsp.config('*', commonOpts)

    vim.lsp.config(
      'denols',
      vim.tbl_extend('force', commonOpts, {
        root_markers = nil,
        root_dir = require('lspconfig').util.root_pattern(
          'deno.json',
          'deno.jsonc'
        ),
      })
    )

    local ts_options = vim.tbl_extend('force', commonOpts, {
      root_markers = { '.git', '.hg', 'package.json', 'tsconfig.json' },
      init_options = {
        preferences = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    })

    vim.lsp.config('ts_ls', ts_options)
    vim.lsp.config('tsserver', ts_options)

    -- too many errors for vulkan that don't matter to me
    -- require('lspconfig').glslls.setup({})

    vim.lsp.config(
      'lua_ls',
      vim.tbl_extend('force', commonOpts, {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })
    )

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
