return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.header.val = {
      '                                   ____',
      '                                 /   () \\',
      '                          .--.  |   //   |  .--.',
      '                         : (\\ ". \\ ____ / ." /) :',
      '                          ".    `   ||     `  ."',
      '                           /    _        _    \\',
      '                          /     0}      {0     \\',
      '                         |       /      \\       |',
      '                         |      /        \\     |',
      '                          \\    |.  .==.  .|   /',
      '                           "._ \\.  \\__/  ./ _."',
      '                           /  ``"._-""-_."``  \\',
      '==========================================================================',
      '  _____     ____                                          ____     _____  ',
      ' /      \\  |  o |   See the TURTLE of  Enormous Girth    | o  |  /      \\ ',
      '|        |/ ___\\|    On his shell he holds the Earth     |/___ \\|        |',
      '|_________/        His thought is slow, but always kind        \\_________|',
      '|_|_| |_|_|          He holds us all within his mind           |_|_| |_|_|',
      '                                                                          ',
      '==========================================================================',
      '                             Stand and be true',
    }
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

    dashboard.section.footer.val = 'Go then, there are other worlds than these'

    require('alpha').setup(dashboard.opts)
  end,
}
