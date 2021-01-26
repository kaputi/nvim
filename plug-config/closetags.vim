"
"
"
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.tsx,*.ts'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
" let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,javascriptreact,javascript.jsx,typescript,typescriptreact,typescript.tsx,javascript.js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 0

" dictionary
" Disables auto-close if not in a "valid" region (based on filetype)
"
" let g:closetag_regions = {
"     \ 'typescript.tsx': 'jsxRegion,tsxRegion',
"     \ 'javascript.jsx': 'jsxRegion',
"     \ 'javascript': '',
"     \ 'javascriptreact': '',
"     \ }

" autocmd BufNewFile,BufRead *.js,*.ts
"       \ set filetype=typescript.tsx |
"       \ set syntax=typescriptreact

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut='>'

