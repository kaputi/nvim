local goku_drawings = require('user.asciiArt.goku')
local other_drawings = {
  require('user.asciiArt.shardik'),
  require('user.asciiArt.treeOfGondor'),
}

local drawings = vim.list_extend(other_drawings, goku_drawings)

local cache_dir = vim.fn.stdpath('cache')
local counter_file = cache_dir .. '/my_counter.json'

-- Load counter (default 0)
local function load_counter()
  local file = io.open(counter_file, 'r')
  if file then
    local content = file:read('*a')
    file:close()
    local ok, data = pcall(vim.fn.json_decode, content)
    return ok and data.counter or 1
  end
  return 1
end

-- Save counter
local function save_counter(value)
  local data = { counter = value }
  local file = io.open(counter_file, 'w')
  if file then
    file:write(vim.fn.json_encode(data))
    file:close()
  end
end

return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local dashboard = require('alpha.themes.dashboard')
    -- math.randomseed(os.time())
    -- local selectedDrawing = math.random(#drawings)
    local selectedDrawing = load_counter()
    if selectedDrawing > #drawings then
      selectedDrawing = 1
    end

    dashboard.section.header.val = drawings[selectedDrawing]
    local name = ''

    local scandir = require('plenary.scandir')
    local get_last_session_filename = function()
      local sessions_path = vim.fn.stdpath('data') .. '/sessions'

      local most_recent_filename = nil
      local most_recent_timestamp = 0
      for _, session_filename in ipairs(scandir.scan_dir(sessions_path)) do
        local timestamp = vim.fn.getftime(session_filename)
        if most_recent_timestamp < timestamp then
          most_recent_timestamp = timestamp
          most_recent_filename = session_filename
        end
      end
      return most_recent_filename
    end

    local filename = get_last_session_filename()

    if filename ~= nil then
      name = ': ' .. filename:match('^.+_(.+)$')
    end

    dashboard.section.buttons.val = {
      dashboard.button('a', '  Last session' .. name, ':LoadSession<CR>'),
      dashboard.button(
        's',
        '  Open session',
        ':Telescope sessions initial_mode=normal<CR>'
      ),
      dashboard.button(
        'r',
        '  Recent',
        ':Telescope oldfiles initial_mode=normal<CR>'
      ),
      dashboard.button('e', '  New file', ':ene<CR>'),
      dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
      dashboard.button('q', '  Quit', ':qa<CR>'),
    }

    -- dashboard.section.footer.val = 'Go then, there are other worlds than these'
    if selectedDrawing == 1 then
      dashboard.section.footer.val =
        'Go then, there are other worlds than these'
    end

    require('alpha').setup(dashboard.opts)

    selectedDrawing = selectedDrawing + 1
    save_counter(selectedDrawing)
  end,
}
