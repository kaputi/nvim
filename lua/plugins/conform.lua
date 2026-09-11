return {
  'stevearc/conform.nvim',
  config = function()
    local eslint = require('user.functions').eslintCmd()

    local function js_formatters(bufnr)
      local prettier = 'prettierd'
      if require('conform').get_formatter_info('prettier', bufnr).available then
        prettier = 'prettier'
      end
      return { eslint, prettier, stop_after_first = false }
    end

    require('conform').setup({
      formatters_by_ft = {
        javascript = js_formatters,
        typescript = js_formatters,
        javascriptreact = js_formatters,
        typescriptreact = js_formatters,
        json = { 'prettier', 'prettierd' },
        jsonc = { 'prettier', 'prettierd' },
        css = { 'prettier', 'prettierd' },
        html = { 'prettier', 'prettierd' },
        lua = { 'stylua' },
        go = { 'goimports', 'gofmt' },
        sh = { 'shfmt' },
        dart = { 'dart_format' },
        -- glsl = { 'clang-format' },
        -- wgsl = { 'clang-format' },
        wgsl = { 'prettier', 'prettierd' },
        haskell = { 'ormolu' },
        arduino = { 'clang_format' },
      },
    })

    require('conform').formatters.stylua = {
      prepend_args = function(self, ctx)
        return {
          '--column-width=80',
          '--indent-type=Spaces',
          '--indent-width=2',
          '--quote-style=AutoPreferSingle',
        }
      end,
    }

    require('conform').formatters.fourmolu = {
      prepend_args = function(self, ctx)
        return {
          '--indentation=2',
          '--indent-between-operators=never',
          '--indent-newline-operators=false',
          '--indent-singleline=no',
          '--tabs=false',
          '--print-width=100',
        }
      end,
    }

    require('conform').formatters['cabal-fmt'] = {
      prepend_args = function()
        return { '--check' }
      end,
    }
  end,
}
