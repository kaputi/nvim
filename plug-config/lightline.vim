"let g:lightline = { 'colorscheme' : 'onehalfdark', }
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  :
  if empty(info) | return '' | endif
  let msgs = []
  " if get(info, 'error', 0)
    " call add(msgs, 'E '. info['error'] )
  " endif
  " if get(info, 'warning', 0)
    " call add(msgs, '⚠ '. info['warning'] )
  " endif
  if get(info, 'information', 0)
    call add(msgs, 'I'. info['information'] )
  endif
  if get(info, 'hint' , 0)
    call add(msgs, 'H'. info['hint'])
  endif
  return join(msgs, ' ') 
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! CocGit() abort
  return get(g:,'coc_git_status', '')
endfunction

let g:lightline = {
      \ 'colorscheme' : 'onedark',
      \ 'active': {
      \   'left': [
      \     [],
      \     [ 'cocgit', 'diagnostic','cocstatus', 'filename', 'method' ]
      \   ],
      \   'right':[
      \     [ 'filetype', 'fileencoding', 'lineinfo' ],
      \   ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'cocgit': 'CocGit',
      \   'diagnostic': 'StatusDiagnostic',
      \   'cocstatus': 'coc#status',
      \   'method': 'CocCurrentFunction'
      \ }
      \ }


" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let airline#extensions#tabline#show_splits = 0
let airline#extensions#tabline#tabs_label = ''
le

" Disable tabline close button
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1

let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''

" Just show the file name
let g:airline#extensions#tabline#fnamemod = ':t'

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline#extensions#tabline#formatter = 'unique_tail'


" Switch to your current theme
let g:airline_theme = 'onedark'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Sections
" let g:airline_section_c = ''
" let g:airline_section_a = "Mach 2"
let g:airline_section_y = ''
let g:webdevicons_enable_airline_tabline = 1
