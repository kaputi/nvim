return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      signs = {
        add = {
          hl = 'GitSignsAdd',
          text = '▎',
          numhl = 'GitSignsAddNr',
          linehl = 'GitSignsAddLn',
        },
        change = {
          hl = 'GitSignsChange',
          text = '▎',
          numhl = 'GitSignsChangeNr',
          linehl = 'GitSignsChangeLn',
        },
        delete = {
          hl = 'GitSignsDelete',
          -- text = '契',
          text = '_',
          numhl = 'GitSignsDeleteNr',
          linehl = 'GitSignsDeleteLn',
        },
        topdelete = {
          hl = 'GitSignsDelete',
          -- text = '契',
          text = '‾',
          numhl = 'GitSignsDeleteNr',
          linehl = 'GitSignsDeleteLn',
        },
        changedelete = {
          hl = 'GitSignsChange',
          text = '▎',
          numhl = 'GitSignsChangeNr',
          linehl = 'GitSignsChangeLn',
        },
      },
      numhl = false,
      linehl = false,
      -- keymaps = {
      --   -- Default keymap options
      --   noremap = true,
      --   buffer = true,
      -- },
      max_file_length = 4500,
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_formatter = '<author>, <author_time:%d-%m-%Y> - <summary>',
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 700,
        ignore_whitespace = false,
      },
      current_line_blame_formatter_opts = {
        relative_time = false,
      },
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      -- use_decoration_api = true,
      -- use_internal_diff = true, -- If luajit is present
    })
  end,
}
