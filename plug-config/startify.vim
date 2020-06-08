let g:startify_session_dir = '~/.config/nvim/sessions'

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recent Files']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
      " \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_bookmarks = []

let g:startify_files_number = 10

let g:startify_change_to_vcs_root = 1

let g:startify_session_sort = 1

let g:turtlePoem = [
      \ '                                   ____',
      \ '                                 /   () \',
      \ '                          .--.  |   //   |  .--.',
      \ '                         : (\ ". \ ____ / ." /) :',
      \ '                          ".    `   ||     `  ."',
      \ '                           /    _        _    \',
      \ '                          /     0}      {0     \',
      \ '                         |       /      \       |',
      \ '                         |      /        \     |',
      \ '                          \    |.  .==.  .|   /',
      \ '                           "._ \.  \__/  ./ _."',
      \ '                           /  ``"._-""-_."``  \',
      \ '==========================================================================',
      \ '  _____     ____                                          ____     _____  ',
      \ ' /      \  |  o |   See the TURTLE of  Enormous Girth    | o  |  /      \ ',
      \ '|        |/ ___\|    On his shell he holds the Earth     |/___ \|        |',
      \ '|_________/        His thought is slow, but always kind        \_________|',
      \ '|_|_| |_|_|          He holds us all within his mind           |_|_| |_|_|',
      \ '                                                                          ',
      \ '==========================================================================',
      \ ]
let g:startify_custom_header = 'startify#center(g:turtlePoem)'


" nnoremap <leader><leader>s :SSave!<CR>
" nnoremap <leader><leader>d :SDelete!<CR>
" nnoremap <leader><leader>S :Startify<CR>

" highlight StartifyBracket ctermfg=240
" highlight StartifyFooter  ctermfg=240
highlight StartifyHeader  ctermfg=114 guifg=#87d787
highlight StartifyNumber    ctermfg=14 guifg=#5CCFE6
" highlight StartifyPath    ctermfg=245
" highlight StartifySlash   ctermfg=240
" highlight StartifySpecial ctermfg=240
"
let g:startify_session_before_save = [
  \ 'echo "Cleaning up"',
  \ 'silent! Vista!',
  \ ]
