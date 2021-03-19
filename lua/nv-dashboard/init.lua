vim.g.dashboard_default_executive ='telescope'


vim.g.dashboard_custom_header = {
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
}


-- "SPC mean the leaderkey
-- let g:dashboard_custom_shortcut={
-- \ 'last_session'       : 'SPC s l',
-- \ 'find_history'       : 'SPC f h',
-- \ 'find_file'          : 'SPC f f',
-- \ 'new_file'           : 'SPC c n',
-- \ 'change_colorscheme' : 'SPC t c',
-- \ 'find_word'          : 'SPC f a',
-- \ 'book_marks'         : 'SPC f b',
-- \ }
--
vim.g.dashboard_custom_shortcut = {
  last_session = 'SPC l',
  find_history = 'SPC h',
  find_file = 'SPC f',
  new_file = 'SPC n',
  change_colorscheme = 'SPC c',
  find_word = 'SPC w',
  book_marks = 'SPC b'
}
-- vim.g.dashboard_custom_shortcut['last_session'] = 'SPC s l'
-- vim.g.dashboard_custom_shortcut['find_history'] = 'SPC f h'
-- vim.g.dashboard_custom_shortcut['find_file'] = 'SPC f f'
-- vim.g.dashboard_custom_shortcut['change_colorscheme'] = 'SPC t c'
-- vim.g.dashboard_custom_shortcut['new_file'] = 'SPC c n'
-- vim.g.dashboard_custom_shortcut['find_word'] = 'SPC f a'
-- vim.g.dashboard_custom_shortcut['book_marks'] = 'SPC f b'

-- let g:dashboard_custom_shortcut_icon['last_session'] = ' '
-- let g:dashboard_custom_shortcut_icon['find_history'] = 'ﭯ '
-- let g:dashboard_custom_shortcut_icon['find_file'] = ' '
-- let g:dashboard_custom_shortcut_icon['new_file'] = ' '
-- let g:dashboard_custom_shortcut_icon['change_colorscheme'] = ' '
-- let g:dashboard_custom_shortcut_icon['find_word'] = ' '
-- let g:dashboard_custom_shortcut_icon['book_marks'] = ' '

-- vim.g.dashboard_custom_section={
  -- 'buffer_list': {
    -- 'describtion': [' Recently lase session                 SPC b b'],
    -- 'command': string or funcref type},
-- }
