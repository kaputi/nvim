return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  config = function()
    require('user.lsp.lspGui')

    local util = require('lspconfig.util')

    local commonOpts = {
      on_attach = require('user.lsp.on_attach'),
      root_markers = { '.git', '.hg' },
      capabilities = require('user.lsp.capabilities'),
    }

    -- GENERAL LSP =======================================================
    vim.lsp.config('*', commonOpts)

    -- DENO ==============================================================
    vim.lsp.config(
      'denols',
      vim.tbl_extend('force', commonOpts, {
        root_markers = nil,
        root_dir = util.root_pattern('deno.json', 'deno.jsonc'),
      })
    )
    -- TS,JS ============================================================
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
          preferTypeOnlyAutoImports = true,
        },
      },
    })
    vim.lsp.config('ts_ls', ts_options)
    vim.lsp.config('tsserver', ts_options)
    -- SHADERS ==========================================================
    -- too many errors for vulkan that don't matter to me
    -- require('lspconfig').glslls.setup({})
    -- LUA =============================================================
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
    -- GO ===============================================================
    vim.lsp.config(
      'gopls',
      vim.tbl_extend('force', commonOpts, {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      })
    )
    -- Haskell ==========================================================
    vim.lsp.config('haskell', {
      cmd = { 'haskell-language-server-wrapper', '--lsp' },
      filetypes = { 'haskell', 'lhaskell', 'cabal' },
      root_markers = {
        'stack.yaml',
        'cabal.project',
        '*.cabal',
        'package.yaml',
        'hie.yaml',
      },
      settings = {
        haskell = {
          checkProject = true,
        },
      },
    })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'haskell',
      callback = function()
        vim.lsp.enable('haskell')
      end,
    })
    -- Arduino ===========================================================
    vim.lsp.config('arduino_language_server', {
      vim.tbl_extend('force', commonOpts, {
        filetypes = { 'arduino', 'ino', 'cpp', 'c', 'h', 'hpp' },
        -- root_dir = require('lspconfig').util.root_pattern('sketch.yaml'),
        -- Neovim-native root detection, preferring sketch.yaml
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          -- 1) look for sketch.yaml upwards
          local root = vim.fs.root(fname, { 'sketch.yaml' })
          -- 2) fallback: git repo root, if any
          if not root then
            root = util.find_git_ancestor(fname)
          end
          -- 3) final fallback: directory of the file
          if not root or root == '' then
            root = vim.fn.fnamemodify(fname, ':p:h')
          end
          on_dir(root)
        end,
      }),
    })
    -- Clang =============================================================
    vim.lsp.config('clangd', {
      filetypes = { 'cpp', 'c', 'h', 'hpp' },

      root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)

        -- If this file belongs to an Arduino sketch (has sketch.yaml above),
        -- do NOT start clangd here; let arduino_language_server own it.
        local arduino_root = vim.fs.root(fname, { 'sketch.yaml' })
        if arduino_root then
          return -- no on_dir => clangd stays inactive for this buffer
        end

        -- Normal C/C++ projects: look for compile_commands.json or .git
        local root = util.root_pattern('compile_commands.json', '.git')(fname)
          or vim.fn.fnamemodify(fname, ':p:h')

        on_dir(root)
      end,
    })
    -- ===================================================================
    require('mason').setup({})
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
      'haskell',
      'lhaskell',
      'cabal',
    } -- Add your desired filetypes
    vim.api.nvim_create_autocmd('CursorHold', {
      group = vim.api.nvim_create_augroup('_lsp', { clear = true }),
      callback = function()
        local ft = vim.bo.filetype
        for _, allowed in ipairs(whitelist) do
          if ft == allowed then
            require('user.functions').cursorHold()
            break
          end
        end
      end,
    })
  end,
}
