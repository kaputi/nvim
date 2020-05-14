" Disable default mappings
let g:EasyMotion_do_mapping = 0 
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" <leader>f{char} find char to the right
nmap <leader>f <Plug>(easymotion-fl)
" <leader>F{char} find char to the left
nmap <leader>F <Plug>(easymotion-Fl)

" <leader>t{char} go before char to right
nmap <leader>t <Plug>(easymotion-tl)
" <leader>T{char} go before char to left
nmap <leader>T <Plug>(easymotion-Tl)

" <leader><leader>f{char}{char} to move to {char}{char}
nmap <leader><leader>f <Plug>(easymotion-s2)

nmap  <Leader><leader>w <Plug>(easymotion-bd-w)

" only Neovim
if !exists('g:vscode')
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
endif
