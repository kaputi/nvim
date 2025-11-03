return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        javascript = { 'prettier', 'prettierd' },
        typescript = { 'prettier', 'prettierd' },
        javascriptreact = { 'prettier', 'prettierd' },
        typescriptreact = { 'prettier', 'prettierd' },
        json = { 'prettier', 'prettierd' },
        jsonc = { 'prettier', 'prettierd' },
        css = { 'prettier', 'prettierd' },
        html = { 'prettier', 'prettierd' },
        lua = { 'stylua' },
        go = { 'goimports', 'gofmt' },
        sh = { 'shfmt' },
        dart = { 'dart_format' },
        glsl = { 'clang-format' },
        -- wgsl = { 'clang-format' },
        -- wgsl = { 'rustfmt' },
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
  end,
}
