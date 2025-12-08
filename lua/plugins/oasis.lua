local index = 1

return {
  'uhs-robert/oasis.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    if MySettings.colorscheme ~= 'oasis' then
      return
    end

    require('oasis').setup({
      style = 'lagoon', -- Primary style, default used when colorscheme is set to "oasis"
      dark_style = 'auto', -- Applies to your primary style only: "auto" uses `style`. Or override with another dark theme (e.g., "abyss")
      light_style = 'auto', -- Applies to your primary style only: "auto" uses `style`. Or override with another light theme (e.g., "dune")
      light_intensity = 3, -- Light background intensity (1-5): 1=subtle, 5=saturated
      use_legacy_comments = false, -- For "desert" style only, uses the loud skyblue comment color from desert.vim for a more retro experience
      themed_syntax = true, -- Uses the theme's primary color for statements/keywords. Set to false for the classic yellow syntax from desert.vim for a more retro experience

      -- Text styling - toggle individual styles
      styles = {
        bold = true, -- Enable bold text (keywords, functions, etc.)
        italic = true, -- Enable italics (comments, certain keywords)
        underline = true, -- Enable underlined text (matching words)
        undercurl = true, -- Enable undercurl for diagnostics/spelling
        strikethrough = true, -- Enable strikethrough text (deprecations)
      },

      -- Display options
      transparent = false, -- Set to true for transparent backgrounds (bye-bye theme backgrounds)
      terminal_colors = true, -- Apply Oasis colors to Neovim's built-in terminal

      -- Contrast controls (WCAG: AA = 4.5, AAA = 7.0)
      contrast = {
        -- Note: Light themes obey the targets below. All dark themes target 7.0 by default with only a couple of exceptions that dip to 6.5.
        min_ratio = 5.8, -- Clamp 4.5–7.0; target contrast for syntax/terminal colors. Increase for more contrast, decrease for more pop.
        force_aaa = true, -- When true, forces AAA (7.0) wherever possible; as a result some colors will appear muddy (bye bye non-primary colors).
      },

      palette_overrides = {}, -- Override colors in specific palettes
      highlight_overrides = {
        IndentBlanklineChar = { fg = '#282c34', nocombine = true },
      }, -- Override specific highlight groups
    })

    local flavours = {
      'lagoon',
      'night',
      'midnight',
      'abyss',
      'starlight',
      'desert',
      'sol',
      'canyon',
      'dune',
      'cactus',
      'mirage',
      'twilight',
      'rose',
    }

    -- if MySettings.colorscheme_flavour ~= nil and
    -- vim.tbl_contains(flavours, MySettings.colorscheme_flavour)) then
    -- index = vim.tbl_indexof(flavours, MySettings.colorscheme_flavour)
    -- end

    if MySettings.colorscheme_flavour ~= nil then
      local flavour = MySettings.colorscheme_flavour
      for i, v in ipairs(flavours) do
        if v == flavour then
          index = i
          break
        end
      end
    end

    local setColorscheme = function()
      if index > #flavours then
        index = 1
      end
      if index < 1 then
        index = #flavours
      end
      vim.cmd('colorscheme oasis-' .. flavours[index])
    end

    setColorscheme()

    local ok, wk = pcall(require, 'which-key')
    if not ok then
      return
    end

    local cycle_flavour = function()
      index = index + 1
      setColorscheme()
      vim.notify('Oasis style set to ' .. flavours[index])
    end

    wk.register({
      ['<leader>t'] = { name = '>> Theme <<' },
    }, {
      mode = 'n',
      buffer = nil,
      prefix = '<leader>',
      silent = true,
      noremap = true,
      nowait = true,
    })

    vim.keymap.set(
      'n',
      '<leader>ts',
      require('oasis').toggle_themed_syntax,
      { desc = 'Toggle themed syntax' }
    )

    vim.keymap.set(
      'n',
      '<leader>tt',
      require('oasis').toggle_transparency,
      { desc = 'Toggle transparency' }
    )

    vim.keymap.set(
      'n',
      '<leader>ti',
      require('oasis').cycle_intensity,
      { desc = 'Cycle intensity' }
    )

    vim.keymap.set('n', '<leader>tf', cycle_flavour, { desc = 'Cycle flavour' })
  end,
}
