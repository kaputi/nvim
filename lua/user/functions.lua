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
      local source = ''
      if diagnostic.source then
        source = '[..' .. diagnostic.source .. ']'
      end
      return ' ' .. sign .. ' ' .. diagnostic.message .. source, hl
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

M.enableSearchHl = function()
  if vim.o.hls == false then
    vim.o.hls = true
  end
end

local timer = vim.uv.new_timer()
M.disableSearchHlTimer = function()
  M.enableSearchHl()
  if timer:get_due_in() == 0 then
    timer:stop()
  end

  timer:start(1000, 0, function()
    vim.schedule(function()
      vim.o.hls = false
    end)
    timer:stop()
  end)
end

M.killWindowlessBufs = function()
  local bufInfos = vim.fn.getbufinfo({ buflisted = true })
  vim.tbl_map(function(bufInfo)
    if
      bufInfo.changed == 0 and (not bufInfo.windows or #bufInfo.windows == 0)
    then
      -- print(('Deleting buffer %d : %s'):format(bufInfo.bufnr, bufInfo.name))
      vim.api.nvim_buf_delete(bufInfo.bufnr, { force = false, unload = false })
    end
  end, bufInfos)
  -- print('Deleted windowless buffers')

  M.notify('Deleted windowless buffers')
end

M.killAllBuffersButFocused = function()
  -- '<cmd>%bd!|edit #|bd #|normal `"<CR>',
  local current_buf = vim.api.nvim_get_current_buf()
  local buf_infos = vim.fn.getbufinfo({ buflisted = true })

  for _, buf_info in ipairs(buf_infos) do
    if buf_info.bufnr ~= current_buf then
      vim.api.nvim_buf_delete(buf_info.bufnr, { force = true })
    end
  end

  -- Ensure the current buffer remains active
  if vim.fn.bufexists(current_buf) == 1 then
    vim.api.nvim_set_current_buf(current_buf)
  end

  M.notify('Deleted all buffers but focused')
end

M.deepCopy = function(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[M.deepCopy(orig_key)] = M.deepCopy(orig_value)
    end
    setmetatable(copy, M.deepCopy(getmetatable(orig)))
  else
    copy = orig
  end
  return copy
end

M.runSilentMacro = function()
  local count = vim.v.count -- Gets the count before pressing <leader>r
  -- local reg = vim.fn.nr2char(vim.fn.getchar())
  -- Prompt the user with an input box
  local reg = vim.fn.input('Run macro from register: ')

  -- Validate the input
  if reg == '' or reg:match('%s') then
    print('Invalid register key.')
    return
  end

  -- If no count, default to 1
  if count == 0 then
    count = ''
  end

  vim.cmd('silent normal! ' .. count .. '@' .. reg)
end

M.copilotBufferAsk = function()
  local input = vim.fn.input('Quick Chat: ')
  if input ~= '' then
    require('CopilotChat').ask(input, {
      selection = require('CopilotChat.select').buffer,
    })
  end
end

M.toggleInlayHints = function()
  local buffer = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(
    not vim.lsp.inlay_hint.is_enabled({ bufnr = buffer }),
    { bufnr = buffer }
  )
end

return M
