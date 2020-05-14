" space is leader
let mapleader=" "

" insert new line witgout leaving normal mode (can me used with counts
" 2<leader>o inserts 2 lines)
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>


" remove highlight
noremap <leader>h :nohl<cr>

"no arrow key for training with hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"move faster
noremap J 5j
noremap K 5k

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Only neovim
if !exists('g:vscode') 
  " Visualize tabs and newlines                                                 
  set listchars=tab:▸\ ,eol:¬                                                   
  " Uncomment this to enable by default:                         
  " set list " To enable by default                   
  " Or use your leader key + l to toggle on/off  
  map <leader>l :set list!<CR> " Toggle tabs and EOL

  "next tab
  map tn :tabn<CR> 
  " previous tab
  map tp :tabp<CR>
  " move tab (expects position number)
  map tm :tabm
  " new tab
  map tt :tabnew
  " split tab
  map ts :tab split<CR>
  " close tab
  map tc :tabc<CR>

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

" VScode only
else

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
