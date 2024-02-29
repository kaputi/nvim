return {
  'SmiteshP/nvim-navic',
  dependencies = 'neovim/nvim-lspconfig',
  config = function()
    local navic = require('nvim-navic')
    navic.setup({
      icons = require('user.gui').kind,
      highlight = false,
      separator = ' > ',
      depth_limit = 0,
      depth_limit_indicator = '..',
      safe_output = true,
    })

    local filetype_exclude = {
      'help',
      'startify',
      'dashboard',
      'packer',
      'neo-tree',
      'neogitstatus',
      'NvimTree',
      'Trouble',
      'alpha',
      'lir',
      'Outline',
      'spectre_panel',
      'toggleterm',
      'DressingSelect',
      'Jaq',
      'harpoon',
      'dap-repl',
      'dap-terminal',
      'dapui_console',
      'lab',
      'Markdown',
      'notify',
      'noice',
      '',
    }

    local get_gps = function()
      local status_gps_ok, gps = pcall(require, 'nvim-navic')
      if not status_gps_ok then
        return ''
      end

      local status_ok1, gps_location = pcall(gps.get_location, {})
      if not status_ok1 then
        return ''
      end

      if not gps.is_available() or gps_location == 'error' then
        return ''
      end

      if not require('user.functions').isempty(gps_location) then
        return '%#NavicSeparator#' .. '>' .. '%* ' .. gps_location
      else
        return ''
      end
    end


    local get_winbar = function()
      if vim.tbl_contains(filetype_exclude, vim.bo.filetype) then
        return
      end

      local f = require('user.functions')

      local gps_added = false
      local value = f.filename()

      if not f.isempty(value) then
        local gps_value = get_gps()
        value = value .. ' ' .. gps_value
        if not f.isempty(gps_value) then
          gps_added = true
        end
      end

      if not f.isempty(value) and f.get_buf_option('mod') then
        local mod = '%#LspCodeLens#' .. '*' .. '%*'
        if gps_added then
          value = value .. ' ' .. mod
        end
      end

      local num_tabs = #vim.api.nvim_list_tabpages()
      if num_tabs > 1 and not f.isempty(value) then
        local tab_page_number = tostring(vim.api.nvim_tabpage_get_number(0))
        value = value .. '%=' .. tab_page_number .. '/' .. tostring(num_tabs)
      end

      local status_ok2, _ = pcall(
        vim.api.nvim_set_option_value,
        'winbar',
        value,
        { scope = 'local' }
      )
      if not status_ok2 then
        return
      end
    end

    vim.api.nvim_create_augroup('_winbar', {})
    vim.api.nvim_create_autocmd({
      'CursorHoldI',
      'CursorHold',
      'BufWinEnter',
      'BufFilePost',
      'InsertEnter',
      'BufWritePost',
      'TabClosed',
    }, {
      group = '_winbar',
      callback = function()
        local status_ok1, _ =
          pcall(vim.api.nvim_buf_get_var, 0, 'lsp_floating_window')
        if not status_ok1 then
          get_winbar()
        end
      end,
    })
  end,
}
