return {
  'mrcjkb/haskell-tools.nvim',
  dependencies = {
    'nvim-lspconfig',
    'nvim-telescope/telescope.nvim',
  },
  ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  config = function()
    require('haskell-tools').setup({
      tools = {
        hoogle = {
          mode = 'telescope',
        },
      },
      hls = {
        settings = {
          haskell = {
            formattingProvider = 'fourmolu',
            plugin = {
              fourmolu = {
                config = {
                  external = true,
                },
              },
            },
          },
        },
      },
    })
  end,
}
