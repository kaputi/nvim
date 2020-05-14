"let g:lightline = { 'colorscheme' : 'onehalfdark', }
let g:lightline = {
      \ 'colorscheme' : 'onedark',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'ctrlpmark', 'gitbranch', 'diagnostic', 'cocstatus', 'filename', 'method' ]
      \   ],
      \   'right':[
      \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
      \   ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ }
      \ }
