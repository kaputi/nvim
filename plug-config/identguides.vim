" Space indents are visually identified by the "┆" character, while tabs are distinguished by "|". 
" Manually calling the command IndentGuidesToggle will toggle indent guides scoped to a specific buffer.

" If there are any files you would like to not add indent guides for, add the filetype to the ignore list:
" let g:indentguides_ignorelist = ['text','json']

" If you'd like to change the default space and tab indent characters, modify the following in your vimrc:
" let g:indentguides_spacechar = '┆'
" let g:indentguides_tabchar = '|'

let g:indent_guides_enable_on_vim_startup = 1

let g:indent_guides_auto_colors = 0
hi IndentGuidesEven guibg=#2C2C2C
hi IndentGuidesOdd guibg=#1D2021

let g:indent_guides_default_mapping = 0

let g:indent_guides_exclude_filetypes = ['startify', 'coc-explorer', 'help']
