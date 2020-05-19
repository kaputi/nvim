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


