let g:startify_session_dir = '~/.config/nvim/sessions'

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
      \ { 'type': 'files',     'header': ['   Recent Files']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_bookmarks = []

let g:startify_files_number = 10

let g:startify_session_autoload = 1

let g:startify_session_persistence = 1

let g:startify_session_delete_buffers = 1

let g:startify_enable_special = 0

let g:startify_change_to_dir = 0

let g:startify_change_to_vcs_root = 1

let g:startify_session_sort = 1

let g:startify_custom_header = [
      \ '     ==========================================================================',
      \ '       _____     ____                                          ____     _____  ',
      \ '      /      \  |  o |   See the TURTLE of  Enormous Girth    | o  |  /      \ ',
      \ '     |        |/ ___\|    On his shell he holds the Earth     |/___ \|        |',
      \ '     |_________/        His thought is slow, but always kind        \_________|',
      \ '     |_|_| |_|_|          He holds us all within his mind           |_|_| |_|_|',
      \ '                                                                               ',
      \ '     ==========================================================================',
      \]


nnoremap <leader><leader>s :SSave!<CR>
nnoremap <leader><leader>d :SDelete!<CR>
nnoremap <leader><leader>S :Startify<CR>
