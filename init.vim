" space is leader
let mapleader=" "


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VScode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:vscode')

call plug#begin('~/.config/nvim/pluggedVscode')

   Plug 'tpope/vim-surround'
   Plug 'terryma/vim-multiple-cursors'
   Plug 'asvetliakov/vim-easymotion'
    
call plug#end()

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

"comment selection
"map <leader>/ <cmd> call VSCodeNotify('editor.action.commentLine')<CR>

" move faster
noremap J 5j
noremap K 5k

"no arrow key for training with hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" fix for backspace problems
set backspace=indent,eol,start

" remove highlight
noremap <leader>h :nohl<cr>

" get clipboard for register
set clipboard=unnamedplus

"""""""""""""""""""""
"=> multi cursor
"""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
"let g:multi_cursor_select_all_word_key = '<A-m>'
"let g:multi_cursor_start_key           = 'g<C-m>'
"let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-i>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

else

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')
"themes
"Plug 'tomasiser/vim-code-dark' "dark theme
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim' " Status bar
Plug 'itchyny/vim-gitbranch' "git branch on status bar
"Plug 'ryanoasis/vim-devicons' "icons for explorer tree
Plug 'sonph/onehalf', {'rtp' : 'vim/'} "theme

"tools
Plug 'terryma/vim-multiple-cursors' " Multiple cursors
"Plug 'preservim/nerdtree' " File explorer
"Plug 'Xuyuanp/nerdtree-git-plugin' " File explorer git integration
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " VS-code like autocomplete
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'} "javascript, ts extension
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'} " html
Plug 'neoclide/coc-css' , {'do': 'yarn install --frozen-lockfile'} " css
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'} " json
"Plug 'iamcco/coc-actions', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
"Plug 'iamcco/coc-spell-checker', {'do': 'yarn install --frozen-lockfile'}
"Plug 'iamcco/coc-cspell-dicts', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'tpope/vim-surround' 
Plug 'jiangmiao/auto-pairs' " auto close {[.....
"Plug 'tpope/vim-fugitive'     "git
"Plug 'jreybert/vimagit'   " git side by side with :Magit
"Plug 'airblade/vim-gitgutter' " git on gutter
"Plug 'prettier/vim-prettier'  "format
"Plug 'w0rp/ale' "for eslint to format with prettier
Plug 'easymotion/vim-easymotion'
"Plug 'lilydjwg/colorizer' " Show color when type hex or rgba....
Plug 'alvan/vim-closetag' "auto close html/jsx tags
"Plug 'ctrlpvim/ctrlp.vim'  " file finder

" Language Syntax Support
Plug 'pangloss/vim-javascript' "JS highlighting
Plug 'mxw/vim-jsx' "JSX syntax highlighting
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set t_ut=
"colorscheme codedark
colorscheme onehalfdark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Conquer of Completion 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Introduce class/struct/interface text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ic <Plug>(coc-classobj-i)
omap ac <Plug>(coc-classobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Open file explorer
nmap <leader>b :CocCommand explorer<CR>

"needed for coc-highlight
set termguicolors

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
"<leader>a for the current selected range
"<leader>aw for the current word
"<leader>aas for the current sentence
"<leader>aap for the current paragraph
":h text-objects to see more detail

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Find File
nmap <leader>p :CocList files<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Auto Close Tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> ctrlp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set runtimepath^=~/.config/nvim/plugged/ctrlp.vim
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"lightline
"let g:lightline = { 'colorscheme' : 'onehalfdark', }
" lightline
let g:lightline = {
      \ 'colorscheme' : 'onehalfdark',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'ctrlpmark', 'gitbranch', 'diagnostic', 'cocstatus', 'filename', 'method' ]
      \   ],
      \   'right':[
      \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
      \     [ 'blame' ]
      \   ],
      \ },
      \ 'component_function': {
      \   'blame': 'LightlineGitBlame',
      \   'gitbranch': 'gitbranch#name'
      \ }
      \ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction
set laststatus=2
set noshowmode

"show comand 
set showcmd
"set cmdheight=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> multi cursor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
"let g:multi_cursor_select_all_word_key = '<A-m>'
"let g:multi_cursor_start_key           = 'g<C-m>'
"let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-i>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8

"turn on syntax highlight
syntax on

" Blink cursor on error instead of beeping (grr)
set visualbell

set backup                 " create backups
set backupdir=~/.config/nvim/backup         " tell vim where to put its backup files
set dir=~/.config/nvim/swap               " tell vim where to put swap files
set timeoutlen=1000        " speed vim up
set ttimeoutlen=0          " https://stackoverflow.com/questions/37644682/why-is-vim-so-slow/37645334
set ttyfast                " Rendering

set wildmenu                "better comand menu

"turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" Visualize tabs and newlines                                                 
set listchars=tab:▸\ ,eol:¬                                                   
" Uncomment this to enable by default:                         
" set list " To enable by default                   
" Or use your leader key + l to toggle on/off  
map <leader>l :set list!<CR> " Toggle tabs and EOL

"tab = 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

set tw=80                 " Line Length set to 80

set ai            " Auto indent
" set si            " Smart indent
set wrap          " Wrap lines
set nowrap        " Don't wrap text

" Shows the title within the window
set title titlestring=

" Necesary for lots of cool vim things
set nocompatible

" mouse 
set mouse=a

""move faster
noremap J 5j
noremap K 5k

"no arrow key for training with hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" fix for backspace problems
set backspace=indent,eol,start

" remove highlight
noremap <leader>h :nohl<cr>

" insert new line witgout leaving nomral mode (can me used with counts
" 2<leader>o inserts 2 lines)
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" get clipboard for register
"set clipboard=unnamedplus

" save as sudo
ca w!! w !sudo tee "%"

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

endif
