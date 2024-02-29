return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({
      -- size can be a number or function which is passed the current terminal
      size = 20,
      -- open_mapping = [[<c-\>]],
      -- open_mapping = [[<c-t>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      persist_size = true,
      -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
      direction = 'float',
      close_on_exit = true, -- close the terminal window when the process exits
      shell = vim.o.shell, -- change the default shell
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        border = 'curved',
        -- width = <value>,
        -- height = <value>,
        winblend = 3,
        highlights = { border = 'Normal', background = 'Normal' },
      },
    })

    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
      vim.api.nvim_buf_set_keymap(
        0,
        't',
        '<F1>',
        -- '<C-\\><C-n>|<cmd>ToggleTermCloseAll<CR>',
        '<cmd>ToggleTermToggleAll<CR>',
        opts
      )
      -- vim.api.nvim_buf_set_keymap(
      --   0,
      --   't',
      --   '<F2>',
      --   '<C-\\><C-n>|<cmd>ToggleTermCloseAll<CR>',
      --   opts
      -- )
      -- vim.api.nvim_buf_set_keymap(
      --   0,
      --   't',
      --   '<F3>',
      --   '<C-\\><C-n>|<cmd>ToggleTermCloseAll<CR>',
      --   opts
      -- )
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    -- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

    vim.api.nvim_set_keymap(
      'i',
      '<F1>',
      '<cmd>1ToggleTerm direction=float<CR>',
      { noremap = true, silent = true }
    )

    -- vim.api.nvim_set_keymap(
    --   'i',
    --   '<F2>',
    --   '<cmd>2ToggleTerm direction=horizontal<CR> <C-\\><C-n>  :3ToggleTerm direction=horizontal<CR> <C-\\><C-n><C-W>h',
    --   { noremap = true, silent = true }
    -- )

    -- vim.api.nvim_set_keymap(
    --   'i',
    --   '<F3>',
    --   '<cmd>4ToggleTerm direction=float<CR>',
    --   { noremap = true, silent = true }
    -- )

    vim.api.nvim_set_keymap(
      'n',
      '<F1>',
      '<cmd>1ToggleTerm direction=float<CR>',
      { noremap = true, silent = true }
    )

    -- vim.api.nvim_set_keymap(
    --   'n',
    --   '<F2>',
    --   '<cmd>2ToggleTerm direction=horizontal<CR> <C-\\><C-n>  :3ToggleTerm direction=horizontal<CR> <C-\\><C-n><C-W>h',
    --   { noremap = true, silent = true }
    -- )

    -- vim.api.nvim_set_keymap(
    --   'n',
    --   '<F3>',
    --   '<cmd>4ToggleTerm direction=float<CR>',
    --   { noremap = true, silent = true }
    -- )
  end,
}
