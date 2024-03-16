return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        javascript = { { 'prettier', 'prettierd' } },
        css = { { 'prettier', 'prettierd' } },
        html = { { 'prettier', 'prettierd' } },
        lua = { 'stylua' },
        go = { 'gofmt' },
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
