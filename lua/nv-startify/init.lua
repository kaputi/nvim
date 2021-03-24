require 'nvim_utils'

vim.g.startify_session_dir = DATA_PATH .. '/startify-session'

if vim.fn.empty(vim.fn.glob(vim.g.startify_session_dir)) > 0 then
  vim.api.nvim_command ('!mkdir -p ' .. vim.g.startify_session_dir)
end


vim.g.startify_update_oldfiles = 1 -- dont wait for vim to close to update old files
vim.g.startify_session_autoload = 1 -- if dir contains a sesion file load it automatically
vim.g.startify_session_persistence = 1 -- update session before leaving vim and before SLoad
vim.g.startify_session_delete_buffers = 1 -- delete buffers when load or close session
vim.g.startify_change_to_vcs_root = 1 -- when opening a file change to VCS dir
vim.g.startify_fortune_use_unicode = 1 -- use unicode for header
vim.g.startify_files_number = 10
vim.g.startify_padding_left = 3
vim.g.startify_enable_special = 0 -- show <empty-buffer> and <quit>
vim.g.startify_session_sort = 1 -- sort sessions by modification time
vim.g.startify_session_number = 10

-- Dont show tab or status bar
local autocmds = {
	Startify = {
		{"User", "StartifyReady", "set laststatus=0"},
		{"User", "StartifyReady", "set showtabline=0"},
    {"User", "StartifyBufferOpened", "set showtabline=2"},
    {"User", "StartifyBufferOpened", "set laststatus=2"}
	};
}

nvim_create_augroups(autocmds)


-- show file icons
vim.cmd([[
function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
]])

vim.g.startify_bookmarks = {}
vim.g.startify_lists = {
  { type = 'sessions',  header = {'   Sessions'},indices= {'a','s','d','f','g'}},
  { type = 'files',     header = {'   Recent Files'} },
  -- { type = 'bookmarks', header = {'   Bookmarks'}},
  -- { type = 'commands',  header = {'   Commands'}},
 }
-- let g:startify_session_before_save = [
--   \ 'echo "Cleaning up"',
--   \ 'silent! Vista!',
--   \ ]

vim.g.turtle_poem = {
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

vim.g.startify_custom_header = vim.fn['startify#center'](vim.g.turtle_poem)
vim.g.startify_custom_footer = vim.fn['startify#center']({'Eduardo Lonighi'})

-- " highlight StartifyBracket ctermfg=240
-- " highlight StartifyFooter  ctermfg=240
-- highlight StartifyHeader  ctermfg=114 guifg=#87d787
-- highlight StartifyNumber    ctermfg=14 guifg=#5CCFE6
-- " highlight StartifyPath    ctermfg=245
-- " highlight StartifySlash   ctermfg=240
-- " highlight StartifySpecial ctermfg=240
-- "
