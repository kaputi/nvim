return {
  'EdenEast/nightfox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    if MySettings.colorscheme == 'nightfox' then
      require('nightfox').setup({
        options = {
          transparent = false, -- Disable setting background
          terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false, -- Non focused panes set to alternative background
          styles = { -- Style to be applied to different syntax groups
            comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
            -- conditionals = 'NONE',
            -- constants = 'NONE',
            functions = 'italic',
            -- keywords = 'NONE',
            -- numbers = 'NONE',
            -- operators = 'NONE',
            -- strings = 'NONE',
            types = 'italic,bold',
            -- variables = 'NONE',
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
        },
      })

      if MySettings.colorscheme_flavour ~= nil then
        vim.cmd('colorscheme ' .. MySettings.colorscheme_flavour)
      else
        vim.cmd('colorscheme nightfox')
      end
    end
  end,
}
