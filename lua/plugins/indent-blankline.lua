return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    require('ibl').setup({
      indent = {
        -- char = '│',
        char = '▏',
        -- char = '',
        -- highlight = 'Comment',
        highlight = 'IndentBlanklineChar',
        -- highlight = 'Normal'
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        injected_languages = false,
        highlight = { 'Conditional', 'Label' },
        priority = 500,
        -- include = { node_type = { ['*'] = { '*' } } },
      },
    })
  end,
}
