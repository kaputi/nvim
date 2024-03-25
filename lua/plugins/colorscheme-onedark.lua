local nevarasu = {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local palette = require('onedark.palette')
    require('onedark').setup({
      -- Main options --
      style = MySettings.colorscheme_flavour, -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = false, -- Show/hide background
      term_colors = true, -- Change terminal color as per the selected theme style
      ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- toggle theme style ---
      toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = {
        'dark',
        'darker',
        'cool',
        'deep',
        'warm',
        'warmer',
        'light',
      }, -- List of styles to toggle between

      -- Change code style ---
      -- Options are italic, bold, underline, none
      -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
      code_style = {
        comments = 'italic',
        keywords = 'italic,bold',
        functions = 'italic',
        strings = 'none',
        variables = 'none',
      },

      -- Lualine options --
      lualine = {
        transparent = false, -- lualine center bar transparency
      },

      -- Custom Highlights --
      colors = {
        comment_green = '#607C3C',
      }, -- Override default colors
      highlights = {
        ['@comment'] = { fg = '$comment_green', fmt = 'italic' },
        ['@keyword.import'] = {
          fg = palette[MySettings.colorscheme_flavour].blue,
          fmt = 'italic',
        },
        ['Search'] = {
          bg = palette[MySettings.colorscheme_flavour].diff_change,
          fg = 'none',
        },
        ['IncSearch'] = {
          bg = palette[MySettings.colorscheme_flavour].diff_change,
          fg = 'none',
          fmt = 'reverse',
        },
        ['CurSearch'] = {
          bg = palette[MySettings.colorscheme_flavour].diff_change,
          fg = 'none',
          fmt = 'reverse',
        },
      }, -- Override highlight groups

      -- Plugins Config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    })
    require('onedark').load()
  end,
}

local olimorris = {
  'olimorris/onedarkpro.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    if MySettings.colorscheme == 'onedark' then
      require('onedarkpro').setup({
        styles = {
          types = 'bold,italic',
          methods = 'NONE',
          numbers = 'NONE',
          strings = 'NONE',
          comments = 'italic',
          keywords = 'bold,italic',
          constants = 'NONE',
          functions = 'italic',
          operators = 'NONE',
          variables = 'NONE',
          parameters = 'NONE',
          conditionals = 'italic',
          virtual_text = 'NONE',
        },
      })
      vim.cmd('colorscheme onedark')
    end
  end,
}

local ChristianChiarulli = {
  'ChristianChiarulli/onedark.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    if MySettings.colorscheme == 'onedark' then
      vim.cmd('colorscheme onedark')
    end
  end,
}

-- return ChristianChiarulli
-- return olimorris
return nevarasu
