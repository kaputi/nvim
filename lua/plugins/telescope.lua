return {
  'nvim-telescope/telescope.nvim',
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'debugloop/telescope-undo.nvim',
  },
  config = function()
    local actions = require('telescope.actions')

    local file_ignore_defaults = {
      '%.git/',
      '%node_modules/',
      '%vendor/',
      '%build/',
      '%dist/',
      '%tmp/',
      '%.next/',
      '%.lock$',
      'package%-lock%.json',
    }

    local function get_file_ignore_patterns()
      local extra = (vim.g.project_telescope or {}).file_ignore_patterns or {}
      return vim.list_extend(vim.deepcopy(file_ignore_defaults), extra)
    end

    require('telescope').setup({
      extensions = {
        undo = {
          -- telescope-undo.nvim config, see below
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown({
            -- even more opts
            -- width = 0.5,
            -- previewer = false,
            -- prompt_title = 'UI Select',
            -- results_title = 'Results',
            -- layout_strategy = 'vertical',
            -- layout_config = { preview_width = 60 },
          }),
        },
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          -- filetypes = {"png", "webp", "jpg", "jpeg"},
          find_command = 'rg', -- find command (defaults to `fd`)
        },
      },
      defaults = {
        preview = {
          filesize_limit = 0.8, -- in MB
        },
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
        find_files = {
          hidden = true,
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
    require('telescope').load_extension('ui-select')
    require('telescope').load_extension('undo')

    local builtin = require('telescope.builtin')

    vim.api.nvim_create_user_command('TelescopeFindFiles', function()
      builtin.find_files({ file_ignore_patterns = get_file_ignore_patterns() })
    end, {})

    vim.api.nvim_create_user_command('TelescopeLiveGrep', function()
      builtin.live_grep({ file_ignore_patterns = get_file_ignore_patterns() })
    end, {})

    vim.api.nvim_create_user_command('TelescopeGrepString', function()
      builtin.grep_string({ file_ignore_patterns = get_file_ignore_patterns() })
    end, {})
  end,
}
