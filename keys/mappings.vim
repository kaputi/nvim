" space is leader
let mapleader=" "

"no arrow key for training with hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"move faster
noremap J 5j
noremap K 5k

"begining and end of line
nnoremap B ^
nnoremap E $

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Only neovim
if !exists('g:vscode') 
  " quit and save with capitals Q W (sometimes i dont release shift in time)
  :command! -bar -bang Q quit<bang>
  :command! -bar -bang W write<bang>
  :command! -bar -bang Wq wq<bang>
  :command! -bar -bang WQ wq<bang>
  :command! -bar -bang QQQ wqa<bang>

  " Select all
  nnoremap <C-a> ggVG
  
  "next tab
  noremap tn :tabn<CR> 
  " previous tab
  noremap tp :tabp<CR>
  " move tab (expects position number)
  noremap tm :tabm
  " new tab
  noremap tt :tabnew
  " split tab
  noremap ts :tab split<CR>
  " close tab
  noremap tc :tabc<CR>

  "next buffer
  noremap bn :bn<CR>
  " previous buffer
  noremap bp :bp<CR>
  " delete buffer
  noremap bd :bd<CR>
  " list buffers
  noremap bl :Buffer<CR>

  " I hate escape more than anything else
  inoremap jk <Esc>
  inoremap kj <Esc>

  " Alternate way to save
  nnoremap <silent> <C-s> :w<CR>
  " Alternate way to quit
  nnoremap <silent> <C-Q> :wq!<CR>

  " Better window navigation
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Use alt + hjkl to resize windows
  nnoremap <silent> <M-j>    :resize -2<CR>
  nnoremap <silent> <M-k>    :resize +2<CR>
  nnoremap <silent> <M-h>    :vertical resize -2<CR>
  nnoremap <silent> <M-l>    :vertical resize +2<CR>

  nmap f <Plug>(easymotion-fl)
  nmap F <Plug>(easymotion-Fl)
  nmap t <Plug>(easymotion-tl)
  nmap T <Plug>(easymotion-Tl)
  nmap s <Plug>(easymotion-bd-w)
  
  " move selecction on visual mode
  vnoremap <C-j> :m '>+1<CR>gv=gv
  vnoremap <C-k> :m '<-2<CR>gv=gv

  " copy with ctrl-c 
  vnoremap <C-c> :w !xsel -i -b <CR><CR>

  " close <tags></tags>
  " inoremap ><Tab> ><Esc>F<lyt>o</<C-r>"><Esc>O<Space>
  " inoremap ><Tab>  ><Esc>F<lyt>f>a</<C-r>"><Esc>F>a
  " inoremap <C-t> <Esc>F<lywf>a</<C-r>"><Esc>F>a
  " exit insert, search bck <,move right, yank w, search >, insert </ paste yank, insert >, exit inster, search back <, clear search highlight, enter insert
  inoremap <C-t> <Esc>?<<cr>lyW/><cr>a</<C-r>"><Esc>?><cr>:noh<cr>a
  " nmap <silent><leader>c %lyWh%a</<C-r>"<Bs>><Esc>%i

" VScode only
else

  " insert new line witgout leaving normal mode (can me used with counts
  " 2<leader>o inserts 2 lines)
  nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
  nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
  " remove highlight
  noremap <leader>as :nohl<cr>


  "go to symbol
  map <leader>gs <cmd> call VSCodeNotify('workbench.action.gotoSymbol')<CR>

  "rename symbol
  map <leader>re <cmd> call VSCodeNotify('editor.action.rename')<CR>

  "toggle sidebar
  map <leader>b <cmd> call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>

  "reveal in explorer
  map <leader>e <cmd> call VSCodeNotify('revealInExplorer')<CR>

  "rename file
  map <leader>rf <cmd> call VSCodeNotify('fileutils.renameFile')<CR>

  "focus terminal
  map <leader>t <cmd> call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>

  "split editor down
  map <leader>wj <cmd> call VSCodeNotify('workbench.action.splitEditorDown')<CR>
  "split editor right
  map <leader>wl <cmd> call VSCodeNotify('workbench.action.splitEditorRight')<CR>
  "split editor up
  map <leader>wk <cmd> call VSCodeNotify('workbench.action.splitEditorUp')<CR>
  "split editor left
  map <leader>wh <cmd> call VSCodeNotify('workbench.action.splitEditorLeft')<CR>

endif
