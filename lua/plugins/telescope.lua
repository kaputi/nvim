return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require('telescope.actions')

    require('telescope').setup({
      extensions = {
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          -- filetypes = {"png", "webp", "jpg", "jpeg"},
          find_command = 'rg', -- find command (defaults to `fd`)
        },
      },
      defaults = {
        mappings = {
          i = {
            ['<esc>'] = actions.close,
            ['<c-j>'] = actions.move_selection_next,
            ['<c-k>'] = actions.move_selection_previous,
          },
          n = { ['l'] = actions.select_default },
        },
        -- buffer_previewer_maker = new_maker,
        -- sorting_strategy = 'ascending',

        layout_strategy = 'vertical',
        -- layout_config = { preview_width = 60 },

        border = true,
        borderchars = {
          prompt = { '─', ' ', ' ', ' ', '─', '─', ' ', ' ' },
          -- results = { ' ' },
          results = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
        live_grep = {
          mappings = {
            n = {
              -- ['<C-o>'] =  actions.send_to_qflist + actions.open_qflist,
              -- ['<CR>'] = actions.select_default
            },
            i = {
              -- ['<CR>'] = {'<esc>', type = 'command'}
            },
          },
        },
      },
    })

    vim.api.nvim_create_augroup('_telescope', {})
    vim.api.nvim_create_autocmd({
      'User',
    }, {
      pattern = 'TelescopePreviewerLoaded',
      group = '_telescope',
      callback = function()
        vim.opt_local.number = true
      end,
    })

    -- TODO:
    -- require('telescope').load_extension('media_files')
  end,
}
