" Space indents are visually identified by the "┆" character, while tabs are distinguished by "|". 
" Manually calling the command IndentGuidesToggle will toggle indent guides scoped to a specific buffer.

" If there are any files you would like to not add indent guides for, add the filetype to the ignore list:
let g:indentguides_ignorelist = ['text']

" If you'd like to change the default space and tab indent characters, modify the following in your vimrc:
" let g:indentguides_spacechar = '┆'
" let g:indentguides_tabchar = '|'

set nolist
