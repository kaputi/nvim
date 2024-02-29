return {
  'windwp/windline.nvim',
  config = function()
    local helper = require('windline.helpers')
    local windline = require('windline')
    local sep = helper.separators
    -- local vim_components = require('windline.components.vim')

    local b_components = require('windline.components.basic')
    local state = _G.WindLine.state

    local lsp_comps = require('windline.components.lsp')
    local git_comps = require('windline.components.git')

    local hl_list = {
      Black = { 'white', 'black' },
      White = { 'black', 'white' },
      Inactive = { 'InactiveFg', 'InactiveBg' },
      Active = { 'ActiveFg', 'ActiveBg' },
    }
    local basic = {}

    basic.divider = { b_components.divider, '' }
    basic.space = { ' ', '' }
    basic.bg = { ' ', 'StatusLine' }
    basic.file_name_inactive = { b_components.full_file_name, hl_list.Inactive }
    basic.line_col_inactive = { b_components.line_col, hl_list.Inactive }
    basic.progress_inactive = { b_components.progress, hl_list.Inactive }

    basic.formatter = {
      hl_colors = { text = { 'white', 'black' } },
      text = function()
        local string = ''
        local formatters = require('conform').list_formatters()
        if
          require('user.functions').isempty(formatters) or #formatters == 0
        then
          string = ''
        else
          if formatters[1].available then
            string = formatters[1].name .. '|'
          end
        end
        return { { string, 'text' } }
      end,
    }

    basic.linter = {
      hl_colors = { text = { 'white', 'black' } },
      text = function()
        local string = ''
        if not MySettings.linter then
          string = ''
        else
          local lint_progress = function()
            local linters = require('lint').get_running()
            if #linters == 0 then
              return '󰦕'
            end
            -- return '󱉶 ' .. table.concat(linters, ', ')
            return '󱉶'
          end
          -- string = lint_progress()
          string = 'Lint ' .. lint_progress() .. '|'
        end
        return { { string, 'text' } }
      end,
    }

    basic.onSave = {
      hl_colors = { text = { 'white', 'black' } },
      text = function()
        local fos = {}

        if MySettings.onSave.format then
          table.insert(fos, 'Format')
        end

        if MySettings.onSave.trimWhitespace then
          table.insert(fos, 'WhiteSpace')
        end

        if
          not MySettings.onSave.format
          and not MySettings.onSave.trimWhitespace
        then
          table.insert(fos, 'None')
        end

        local string = ''
        for _, value in ipairs(fos) do
          string = string .. ' ' .. value
        end

        string = string .. ' |'

        return { { 'On Save:' .. string, 'text' } }
      end,
    }

    basic.lsp_diagnos = {
      hl_colors = {
        red = { 'red', 'black' },
        yellow = { 'yellow', 'black' },
        blue = { 'blue', 'black' },
      },
      text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
          return {
            { lsp_comps.lsp_error({ format = '  %s' }), 'red' },
            { lsp_comps.lsp_warning({ format = '  %s' }), 'yellow' },
            { lsp_comps.lsp_hint({ format = '  %s' }), 'blue' },
          }
        end
        return ''
      end,
    }

    basic.lsp_provider = {
      width = 90,
      hl_colors = { text = { 'white', 'black' } },
      text = function(bufnr)
        local string = ''

        local clients = {}
        local icon = ' '
        local lspSep = '|'

        for _, client in pairs(vim.lsp.buf_get_clients(bufnr or 0)) do
          -- DONT SHOW null-ls
          if client.name ~= 'null-ls' then
            clients[#clients + 1] = client.name
          end
        end

        if next(clients) then
          string = icon .. table.concat(clients, lspSep)
        end

        return { { string, 'text' } }
      end,
    }

    local icon_comp = b_components.cache_file_icon({
      default = '',
      hl_colors = { 'white', 'black_light' },
    })

    basic.file = {
      hl_colors = { default = { 'white', 'black_light' } },
      text = function(bufnr)
        return {
          { ' ', 'default' },
          icon_comp(bufnr),
          { ' ', 'default' },
          { b_components.cache_file_name('[No Name]', ''), '' },
          { b_components.file_modified(''), '' },
          -- { b_components.cache_file_size(), '' },
        }
      end,
    }

    basic.right = {
      hl_colors = {
        sep_before = { 'black_light', 'white_light' },
        sep_after = { 'white_light', 'black' },
        text = { 'black', 'white_light' },
      },
      text = function()
        return {
          { b_components.line_col_lua, 'text' },
          { '|', 'text' },
          { b_components.progress, 'text' },
          { sep.right_rounded, 'sep_after' },
        }
      end,
    }

    basic.filetype = {
      width = 90,
      hl_colors = { text = { 'black', 'white_light' } },
      text = function()
        return { { b_components.file_type(), 'text' }, { '|', 'text' } }
      end,
    }

    basic.git = {
      hl_colors = {
        green = { 'green', 'black' },
        red = { 'red', 'black' },
        blue = { 'blue', 'black' },
      },
      text = function(bufnr)
        if git_comps.is_git(bufnr) then
          return {
            { ' ', '' },
            { git_comps.diff_added({ format = ' %s ' }), 'green' },
            { git_comps.diff_removed({ format = ' %s ' }), 'red' },
            { git_comps.diff_changed({ format = '󱓻 %s' }), 'blue' },
          }
        end
        return ''
      end,
    }

    basic.vi_mode = {
      hl_colors = {
        Normal = { 'black', 'red', 'bold' },
        Insert = { 'black', 'green', 'bold' },
        Visual = { 'black', 'yellow', 'bold' },
        Replace = { 'black', 'blue_light', 'bold' },
        Command = { 'black', 'blue', 'bold' },
        NormalBefore = { 'red', 'black' },
        InsertBefore = { 'green', 'black' },
        VisualBefore = { 'yellow', 'black' },
        ReplaceBefore = { 'blue_light', 'black' },
        CommandBefore = { 'blue', 'black' },
        NormalAfter = { 'white', 'red' },
        InsertAfter = { 'white', 'green' },
        VisualAfter = { 'white', 'yellow' },
        ReplaceAfter = { 'white', 'blue_light' },
        CommandAfter = { 'white', 'magenta' },
      },

      text = function()
        local letters = {
          Normal = 'N',
          Insert = 'I',
          Visual = 'V',
          Replace = 'R',
          Command = 'C',
        }
        local letter = letters[state.mode[2]]

        return {
          { sep.left_rounded, state.mode[2] .. 'Before' },
          -- { state.mode[2] .. ' ', state.mode[2] },
          { letter .. ' ', state.mode[2] },
        }
      end,
    }

    local default = {
      filetypes = { 'default' },
      active = {
        { ' ', hl_list.Black },
        basic.vi_mode,
        {
          git_comps.git_branch({ icon = '  ' }),
          { 'white', 'black_light' },
          -- { 'yellow_light', 'black' },
          90,
        },
        -- basic.file,
        { sep.right_rounded, { 'black_light', 'black' } },
        basic.git,
        basic.divider,
        basic.lsp_diagnos,
        { ' ', hl_list.Black },
        basic.onSave,
        basic.formatter,
        basic.linter,
        basic.lsp_provider,
        { ' ', hl_list.Black },
        { sep.left_rounded, { 'white_light', 'black' } },
        basic.filetype,
        basic.right,
        { ' ', hl_list.Black },
      },
      inactive = {
        basic.file_name_inactive,
        basic.divider,
        basic.divider,
        basic.line_col_inactive,
        { '', { 'white', 'InactiveBg' } },
        basic.progress_inactive,
      },
    }

    local quickfix = {
      filetypes = { 'qf', 'Trouble' },
      active = {
        { '  Quickfix ', { 'white', 'black' } },
        { helper.separators.slant_right, { 'black', 'black_light' } },
        {
          function()
            return vim.fn.getqflist({ title = 0 }).title
          end,
          { 'cyan', 'black_light' },
        },
        { ' Total : %L ', { 'cyan', 'black_light' } },
        { helper.separators.slant_right, { 'black_light', 'InactiveBg' } },
        { ' ', { 'InactiveFg', 'InactiveBg' } },
        basic.divider,
        { helper.separators.slant_right, { 'InactiveBg', 'black' } },
        { ' ', { 'white', 'black' } },
      },
      always_active = true,
      show_last_status = true,
    }

    local explorer = {
      filetypes = { 'fern', 'NvimTree', 'lir', 'neo-tree' },
      active = {
        { '  ', { 'white', 'black' } },
        { helper.separators.slant_right, { 'black', 'black_light' } },
        { b_components.divider, '' },
        { b_components.file_name(''), { 'white', 'black_light' } },
      },
      always_active = true,
      show_last_status = true,
    }

    local tag_view = {
      filetypes = { 'vista_kind', 'Outline' },
      active = {
        { '  ', { 'white', 'black' } },
        { helper.separators.slant_right, { 'black', 'black_light' } },
        { b_components.divider, '' },
        -- {b_components.file_name(''), {'white', 'black_light'}}
      },
      always_active = true,
      show_last_status = true,
    }

    windline.setup({

      -- local colors = {
      --   bg = '#282c34',
      --   yellow = '#fabd2f',
      --   cyan = '#008080',
      --   darkblue = '#081633',
      --   green = '#608B4E',
      --   orange = '#FF8800',
      --   purple = '#5d4d7a',
      --   magenta = '#d16d9e',
      --   grey = '#c0c0c0',
      --   blue = '#569CD6',
      --   red = '#D16969'
      -- }
      colors_name = function(colors)
        -- print(vim.inspect(colors))
        -- ADD MORE COLOR HERE ----
        --- add new colors
        colors.green = '#608B4E'
        -- colors.FilenameFg = colors.white_light
        -- colors.FilenameBg = colors.black

        -- this color will not update if you change a colorscheme
        -- colors.gray = "#fefefe"

        -- dynamically get color from colorscheme hightlight group
        -- local searchFg, searchBg = require('windline.themes').get_hl_color('Search')
        -- colors.SearchFg = searchFg or colors.white
        -- colors.SearchBg = searchBg or colors.yellow
        return colors
      end,
      statuslines = { default, quickfix, explorer, tag_view },
    })
  end,
}
