local M = {}

-- Buffer last-viewed tracking
M.buffer_last_viewed = {}

-- UTILS ===========================================

local onOrOff = function(setting)
  if setting then
    return 'ON'
  end
  return 'OFF'
end

M.notify = function(text)
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

-- Find nearest eslint config directory (monorepo support)
local function find_eslint_root()
  local eslint_configs = {
    'eslint.config.js',
    'eslint.config.mjs',
    'eslint.config.cjs',
    '.eslintrc.js',
    '.eslintrc.json',
    '.eslintrc',
  }
  local found = vim.fs.find(eslint_configs, {
    upward = true,
    path = vim.api.nvim_buf_get_name(0),
  })
  if found[1] then
    return vim.fn.fnamemodify(found[1], ':h')
  end
end

M.lint = function(linter)
  if MySettings.linter then
    local opts = {}
    local ft = vim.bo.filetype
    if
      ft == 'javascript'
      or ft == 'typescript'
      or ft == 'javascriptreact'
      or ft == 'typescriptreact'
    then
      opts.cwd = find_eslint_root()
    end
    require('lint').try_lint(linter, opts)
  end
end

M.preSave = function()
  M.trimWhiteSpace()
  M.format()
end

M.has_diagnostics_on_line = function(bufnr, line)
  bufnr = bufnr or 0 -- Use the current buffer if not specified
  local diagnostics = vim.diagnostic.get(bufnr, { lnum = line })
  return #diagnostics > 0
end

M.is_fold_closed_on_line = function(line)
  line = line or vim.fn.line('.') -- Default to the current line
  return vim.fn.foldclosed(line) ~= -1
end

M.cursorHold = function()
  local line = vim.fn.line('.') - 1 -- Current line (0-indexed)

  local has_diagnostic = M.has_diagnostics_on_line(0, line)

  if has_diagnostic and MySettings.lineDiagnostics then
    local ft = vim.bo.filetype
    local is_ts = ft == 'typescript'
      or ft == 'typescriptreact'
      or ft == 'javascript'
      or ft == 'javascriptreact'

    if is_ts then
      local bufnr = vim.diagnostic.open_float({
        focusable = false,
        header = '',
        prefix = '',
        format = function(diagnostic)
          local source = ''
          if diagnostic.source then
            source = ' ' .. diagnostic.source
          end

          -- Map severity to callout
          -- HINT options: [!TIP], [!HINT], [!INFO], [!SUCCESS], [!CHECK], [!DONE], [!QUESTION], [!HELP], [!FAQ], [!ABSTRACT], [!SUMMARY], [!TLDR], [!IMPORTANT], [!EXAMPLE], [!QUOTE], [!CITE]
          local callout = ({
            [vim.diagnostic.severity.ERROR] = '[!CAUTION]',
            [vim.diagnostic.severity.WARN] = '[!WARNING]',
            [vim.diagnostic.severity.INFO] = '[!NOTE]',
            [vim.diagnostic.severity.HINT] = '[!NOTE]',
          })[diagnostic.severity] or '[!NOTE]'

          return '> '
            .. callout
            .. source
            .. '\n> '
            .. vim.fn.PrettyTsFormat(diagnostic.message)
        end,
      })

      if bufnr then
        -- Clear all default diagnostic highlights from the float
        vim.api.nvim_buf_clear_namespace(bufnr, -1, 0, -1)

        -- Set filetype so render-markdown attaches
        vim.bo[bufnr].filetype = 'markdown'
      end
    else
      vim.diagnostic.open_float({
        focusable = false,
        header = '',
        prefix = '',
        format = function(diagnostic)
          local sign, hl = require('user.gui').getSignAndHl(diagnostic)
          local source = ''
          if diagnostic.source then
            source = '[' .. diagnostic.source .. ']'
          end
          return ' ' .. sign .. ' ' .. diagnostic.message .. source, hl
        end,
      })
    end

    return
  end

  -- UNCOMENT FOR PEAK FOLD ON CURSOR HOLD
  -- local has_closed_fold = M.is_fold_closed_on_line()
  -- if has_closed_fold then
  --   local ok, ufo = pcall(require, 'ufo')
  --   if not ok then
  --     return
  --   end
  --   ufo.peekFoldedLinesUnderCursor()
  -- end
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

-- Track when buffer becomes hidden (no longer visible in any window)
M.trackBufferHidden = function(bufnr)
  M.buffer_last_viewed[bufnr] = os.time()
end

-- Clear tracking when buffer becomes visible again
M.clearBufferHidden = function(bufnr)
  M.buffer_last_viewed[bufnr] = nil
end

-- Kill windowless buffers not viewed in `max_age_minutes`
M.killStaleWindowlessBufs = function(max_age_minutes)
  max_age_minutes = max_age_minutes or 30
  local max_age_seconds = max_age_minutes * 60
  local now = os.time()
  local killed = 0

  local bufInfos = vim.fn.getbufinfo({ buflisted = true })
  for _, bufInfo in ipairs(bufInfos) do
    local bufnr = bufInfo.bufnr
    local is_windowless = not bufInfo.windows or #bufInfo.windows == 0
    local is_unchanged = bufInfo.changed == 0
    local has_name = bufInfo.name and bufInfo.name ~= ''

    -- Skip special buffers (terminal, quickfix, help, etc.)
    local buftype = vim.bo[bufnr].buftype
    local is_regular_file = buftype == ''

    if is_windowless and is_unchanged and has_name and is_regular_file then
      local last_hidden = M.buffer_last_viewed[bufnr] or 0
      local age = now - last_hidden

      if age >= max_age_seconds then
        pcall(vim.api.nvim_buf_delete, bufnr, { force = false, unload = false })
        M.buffer_last_viewed[bufnr] = nil
        killed = killed + 1
      end
    end
  end

  if killed > 0 then
    M.notify('Killed ' .. killed .. ' stale buffer(s)')
  end
end

-- Timer for periodic buffer cleanup
local cleanup_timer = nil

-- Start periodic buffer cleanup (interval_minutes, max_age_minutes)
M.startBufferCleanup = function(interval_minutes, max_age_minutes)
  interval_minutes = interval_minutes or 5
  max_age_minutes = max_age_minutes or 30

  if cleanup_timer then
    cleanup_timer:stop()
    cleanup_timer:close()
  end

  cleanup_timer = vim.uv.new_timer()
  cleanup_timer:start(
    interval_minutes * 60 * 1000,
    interval_minutes * 60 * 1000,
    vim.schedule_wrap(function()
      M.killStaleWindowlessBufs(max_age_minutes)
    end)
  )

  M.notify(
    'Buffer cleanup: every '
      .. interval_minutes
      .. 'min, max age '
      .. max_age_minutes
      .. 'min'
  )
end

-- Stop periodic buffer cleanup
M.stopBufferCleanup = function()
  if cleanup_timer then
    cleanup_timer:stop()
    cleanup_timer:close()
    cleanup_timer = nil
    M.notify('Buffer cleanup stopped')
  end
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

M.toggleDiff = function()
  if vim.wo.diff then
    vim.cmd('diffoff')
  else
    vim.cmd('diffthis')
  end
end

M.saveSession = function()
  vim.cmd('silent SaveSession')
  M.notify('Saved Project')
end

return M
