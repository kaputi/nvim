return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    vim.api.nvim_set_hl(
      0,
      'IndentBlanklineChar',
      { fg = '#282c34', nocombine = true }
    )

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
