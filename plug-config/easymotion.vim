" Disable default mappings
let g:EasyMotion_do_mapping = 0 
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" <leader>f{char}{char} to move to {char}{char}
nmap <leader>f <Plug>(easymotion-s2)

nmap  <Leader><leader>w <Plug>(easymotion-bd-w)

" only Neovim
if !exists('g:vscode')

endif