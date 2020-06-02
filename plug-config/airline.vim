" ===============================
" => tab bar
" ===============================
" Always show tabs
set showtabline=2

" enable tabline
let g:airline#extensions#tabline#enabled = 1

"separators
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

"show
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_close_button = 1
" let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_count = 2
let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#tabline#buffer_nr_show = 1
" show only buffers
" let g:airline#extensions#tabline#show_tabs=0

"labels
" let g:airline#extensions#tabline#buffers_label = 'B'
let g:airline#extensions#tabline#tabs_label = 'T'
let g:airline#extensions#tabline#buffer_nr_format = 'b%s '
" format
let g:airline#extensions#tabline#fnamecollapse = 1
" Just show the file name
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail'

 let g:airline#extensions#tabline#tab_min_count = 0
  let g:airline#extensions#tabline#tab_min_count = 0

let g:airline#extension#tabline#ignore_bufadd_pat = '!|coc-explorer'
"================================
" => status bar
" ===============================
" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Switch to your current theme
" let g:airline_theme = 'onedark'
" let g:airline_theme = 'gruvbox'

" We don't need to see things like -- INSERT -- anymore
set noshowmode
" Sections
" let g:airline_section_c = ''
let g:airline_section_y = ''
let g:webdevicons_enable_airline_tabline = 1

let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }

