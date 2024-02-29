local M = {}

-- UTILS ===========================================

local onOrOff = function(setting)
  if setting then
    return 'ON'
  end
  return 'OFF'
end

M.notify = function(text)
  print(text)
  local ok, _ = pcall(require, 'notify')
  if not ok then
    return
  end
  vim.notify(text)
end

M.get_buf_option = function(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

M.isempty = function(s)
  return s == nil or s == ''
end

M.filename = function()
  local filename = vim.fn.expand('%:t')
  local extension = ''
  local file_icon = ''
  local file_icon_color = ''
  local default_file_icon = ''
  local default_file_icon_color = ''

  if not M.isempty(filename) then
    extension = vim.fn.expand('%:e')

    local default = false

    if M.isempty(extension) then
      extension = ''
      default = true
    end

    file_icon, file_icon_color = require('nvim-web-devicons').get_icon_color(
      filename,
      extension,
      { default = default }
    )

    local hl_group = 'FileIconColor' .. extension

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    if file_icon == nil then
      file_icon = default_file_icon
      file_icon_color = default_file_icon_color
    end

    return '%#CursorLineNr#      %m %*'
      .. '%#'
      .. hl_group
      .. '#'
      .. file_icon
      .. '%*'
      .. ' '
      .. '%#LineNr#'
      .. filename
      .. '%*'
  end
end

M.findSelectedText = function()
  -- local vstart = vim.fn.getpos("'<")

  -- local vend = vim.fn.getpos("'>")

  -- local line_start = vstart[2]
  -- local line_end = vend[2]

  -- -- or use api.nvim_buf_get_lines
  -- local lines = vim.fn.getline(line_start, line_end)
  -- -- local lines = vim.api.nvim_buf_get_lines(line_start, line_end)
  -- P(lines)
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  local a = table.concat(lines, '\n')
  a = a:gsub('%/', '\\/')
  P(a)

  vim.cmd('/' .. a)

  -- return table.concat(lines, '\n')
end

-- AUTO CMDS ========================================

M.trimWhiteSpace = function()
  if MySettings.onSave.trimWhitespace then
    local save = vim.fn.winsaveview()
    vim.api.nvim_exec(string.format('silent! %s', [[%s/\s\+$//e]]), false)
    vim.fn.winrestview(save)
  end
end

M.format = function()
  if MySettings.onSave.format then
    require('conform').format()
  end
end

M.lint = function()
  if MySettings.linter then
    require('lint').try_lint()
  end
end

M.preSave = function()
  M.trimWhiteSpace()
  M.format()
end

M.lineDiagnostics = function()
  if not MySettings.lineDiagnostics then
    return
  end
  vim.diagnostic.open_float({
    focusable = false,
    header = '',
    prefix = '',
    format = function(diagnostic)
      local sign, hl = require('user.gui').getSignAndHl(diagnostic)
      return ' '
        .. sign
        .. ' '
        .. diagnostic.message
        .. ' ['
        .. diagnostic.source
        .. '] ',
        hl
    end,
  })
end

-- TOGGLERS ========================================
M.toggleTrimWhitespace = function()
  MySettings.onSave.trimWhitespace = not MySettings.onSave.trimWhitespace
  M.notify('Trim Whitespace = ' .. onOrOff(MySettings.onSave.trimWhitespace))
end

M.toggleFormatOnSave = function()
  MySettings.onSave.format = not MySettings.onSave.format
  M.notify('Format On Save = ' .. onOrOff(MySettings.onSave.format))
end

M.toggleLinter = function()
  MySettings.linter = not MySettings.linter
  if not MySettings.linter then
    vim.diagnostic.reset()
  end
  M.notify('Linter = ' .. onOrOff(MySettings.linter))
end

M.toggleLineDiagnostics = function()
  MySettings.lineDiagnostics = not MySettings.lineDiagnostics
  M.notify('Line Diagnostics = ' .. onOrOff(MySettings.lineDiagnostics))
end

return M
