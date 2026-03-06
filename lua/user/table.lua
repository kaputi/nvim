local M = {}

M.format_tables = function()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  local function is_table_line(line)
    return line:match('^%s*|.*|%s*$')
  end

  local function strwidth(s)
    return vim.fn.strdisplaywidth(s)
  end

  local function parse_cells(line)
    local cells = {}
    for cell in line:gmatch('|([^|]*)') do
      table.insert(cells, vim.trim(cell))
    end
    table.remove(cells)
    return cells
  end

  local function get_alignments(sep_row)
    local aligns = {}
    for cell in sep_row:gmatch('|([^|]*)') do
      cell = vim.trim(cell)
      if cell:match('^:.*:$') then
        table.insert(aligns, 'center')
      elseif cell:match(':$') then
        table.insert(aligns, 'right')
      else
        table.insert(aligns, 'left')
      end
    end
    table.remove(aligns)
    return aligns
  end

  -- Find all tables
  local tables = {}
  local i = 1
  while i <= #lines do
    if is_table_line(lines[i]) then
      local start_row = i
      while i <= #lines and is_table_line(lines[i]) do
        i = i + 1
      end
      table.insert(tables, { start_row = start_row, end_row = i - 1 })
    else
      i = i + 1
    end
  end

  -- Process tables from bottom to top (to preserve line numbers)
  for t = #tables, 1, -1 do
    local tbl = tables[t]
    local start_row, end_row = tbl.start_row, tbl.end_row

    -- Parse rows
    local rows = {}
    local sep_idx = nil
    for j = start_row, end_row do
      local cells = parse_cells(lines[j])
      table.insert(rows, cells)
      if lines[j]:match('^%s*|[%-:]+|') then
        sep_idx = j - start_row + 1
      end
    end

    -- Find max columns and fill missing
    local max_cols = 0
    for _, r in ipairs(rows) do
      max_cols = math.max(max_cols, #r)
    end
    for j, r in ipairs(rows) do
      while #r < max_cols do
        if j == sep_idx then
          table.insert(r, '---')
        else
          table.insert(r, '')
        end
      end
    end

    -- Calculate column widths
    local widths = {}
    for col = 1, max_cols do
      widths[col] = 1
      for j, r in ipairs(rows) do
        if j ~= sep_idx then
          widths[col] = math.max(widths[col], strwidth(r[col] or ''))
        end
      end
      widths[col] = widths[col] + 2
    end

    -- Get alignments
    local aligns = sep_idx and get_alignments(lines[start_row + sep_idx - 1]) or {}
    while #aligns < max_cols do
      table.insert(aligns, 'left')
    end

    -- Format each row
    local result = {}
    for j, r in ipairs(rows) do
      local parts = {}
      for col = 1, max_cols do
        local cell = r[col] or ''
        local w = widths[col]
        local inner = w - 2
        local formatted
        if j == sep_idx then
          local a = aligns[col]
          if a == 'center' then
            formatted = ':' .. string.rep('-', w - 2) .. ':'
          elseif a == 'right' then
            formatted = string.rep('-', w - 1) .. ':'
          else
            formatted = ':' .. string.rep('-', w - 1)
          end
        else
          local pad_right = inner - strwidth(cell)
          formatted = ' ' .. cell .. string.rep(' ', pad_right + 1)
        end
        table.insert(parts, formatted)
      end
      table.insert(result, '|' .. table.concat(parts, '|') .. '|')
    end

    vim.api.nvim_buf_set_lines(0, start_row - 1, end_row, false, result)
  end
end

return M
