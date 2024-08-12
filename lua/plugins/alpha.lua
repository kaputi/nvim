local drawings = {
  require('user.asciiArt.shardik'),
  require('user.asciiArt.treeOfGondor'),
}

return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local dashboard = require('alpha.themes.dashboard')
    math.randomseed(os.time())
    local selectedDrawing = math.random(#drawings)

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
  end,
}
