" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'itchyny/lightline.vim' " Status bar
    "Plug 'itchyny/vim-gitbranch' "git branch on status bar

    "tabline
    Plug 'pacha/vem-tabline'

    " Icons
    Plug 'ryanoasis/vim-devicons'
    "lua fork of devicons
    Plug 'kyazdani42/nvim-web-devicons'

    " themes
    Plug 'itchyny/landscape.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'sonph/onehalf', {'rtp' : 'vim/'}
    Plug 'ajmwagar/vim-deus'
    Plug 'jdsimcoe/abstract.vim'
    Plug 'gilgigilgil/anderson.vim'
    Plug 'ayu-theme/ayu-vim'
    " Plug 'morhetz/gruvbox'
    Plug 'gruvbox-community/gruvbox'
    Plug 'dracula/vim' , { 'as': 'dracula' }
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'jacoborus/tender.vim'
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'dikiaap/minimalist'
    Plug 'tomasr/molokai'
    Plug 'gosukiwi/vim-atom-dark'

    " ident guides
    " Plug 'nathanaelkane/vim-indent-guides'
    " Plug 'thaerkh/vim-indentguides'
    Plug 'Yggdroot/indentLine'

    " color parenthesis
    " Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'frazrepo/vim-rainbow'

    " VSode like autocompletion and other stuff
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    "syntax
    Plug 'sheerun/vim-polyglot' " includes everything
    " Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    " Plug 'peitalin/vim-jsx-typescript'
    " Plug 'pangloss/vim-javascript' " JS highlighting
    " Plug 'mxw/vim-jsx' "JSX syntax highlighting
    " Plug 'leafgarland/typescript-vim' "typescript
    " Plug 'ianks/vim-tsx' "TSX

    " Debugger
    Plug 'puremourning/vimspector'

    " Maximize window
    Plug 'szw/vim-maximizer'

    "Search for unicode
    Plug 'chrisbra/unicode.vim'

    "Scratch buffer
    Plug 'mtth/scratch.vim'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'

    " Closetags and pairs <></> ,{},"", etc
    Plug 'tmsvg/pear-tree'

    " undo tree
    Plug 'mbbill/undotree'

    " save witg sudo
    Plug 'lambdalisue/suda.vim'

    " Text navigation
    Plug 'easymotion/vim-easymotion'
    " Plug 'justinmk/vim-sneak'
    " Plug 'unblevable/quick-scope'

    " Multiple cursors
    " Plug 'terryma/vim-multiple-cursors'

    " Surround
    Plug 'tpope/vim-surround'

    " Repeat Stuff
    " Plug 'tpope/vim-repeat'

    " Better comments
    Plug 'preservim/nerdcommenter'

    " interactive code
    Plug 'metakirby5/codi.vim'

    "ranger file explorer
    Plug 'kevinhwang91/rnvimr'

    " Terminal
    Plug 'voldikss/vim-floaterm'

    "zen mode
    Plug 'junegunn/goyo.vim'

    "Tagbar
    Plug 'liuchengxu/vista.vim'

    "change to project root
    Plug 'airblade/vim-rooter'

    "fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
       " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'


    "key mappings
    Plug 'liuchengxu/vim-which-key'

    " sessions
    " Plug 'thaerkh/vim-workspace'
    Plug 'mhinz/vim-startify'

    "snippets
    Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

    "Org mode
    Plug 'jceb/vim-orgmode'
    Plug 'dhruvasagar/vim-dotoo'
    Plug 'dhruvasagar/vim-table-mode'
    "speed dating (for orgmode)
    Plug 'tpope/vim-speeddating'

call plug#end()
" Automatically install missing plugins on startup
 augroup InstallPlugins
    autocmd! InstallPlugins
    autocmd VimEnter *
        \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        \|   PlugInstall --sync | q
        \| endif
augroup END

"wrapping  and tabs ============================="
" set wrap
set nowrap                              " Display long lines as just one line
set linebreak
set textwidth=80 wrapmargin=0
set colorcolumn=+1                     " show column no 81(textwidth +1)
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent

"popup  menu ============================"
set pumheight=10                        " Makes popup menu smaller
set pumblend=35                         " Popup menu transparency

"UI ============================"
" set showtabline=2                         " always show tab bar
set ruler                              " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set t_Co=256                            " Support 256 colors
set number relativenumber               " relative numbers
set nu rnu                              " current line number
set cursorline                          " Enable highlighting of the current line
set cursorcolumn
set scrolloff=5                         " Always see 5 lines under cursor when scrolling
set sidescrolloff=15                    " Always see 15 columns at the sides of the cursor
set laststatus=2                        " Always display the status line
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
"set guifont=Hack\ Nerd\ Font
set termguicolors
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set mmp=1300

"Behaviour==========================
set iskeyword+=-                      	" treat dash separated words as a word text object"
"set formatoptions-=cro                  " Stop newline continution of comments
set autoread                             " update file if changed
au CursorHold * checktime               " check autoread every 4s
syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
" set bufhidden=delete                      " removes bufferss not displayed in a window
set encoding=utf-8                      " The encoding displayed
set fileencoding=utf-8                  " The encoding written to file
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set conceallevel=0                      " So that I can see `` in markdown files
set incsearch
set clipboard=unnamed                   " Copy paste between vim and everything else
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set updatetime=300                      " Faster completion
set timeoutlen=300                      " By default timeoutlen is 1000 ms
" set autochdir                           " Your working directory will always be the same as your working directory
set foldcolumn=1                        " Folding abilities
" set foldmethod=indent
" set foldmethod=syntax
set foldmethod=manual       "select the text and zf is the best way with this method

" Backups and swap ============================
" create swap dir if not exist
if !isdirectory($HOME."/.config/nvim/swap")
silent call mkdir($HOME."/.config/nvim/swap", "p")
endif
set dir=~/.config/nvim/swap/           " tell vim where to put swap files
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coer

" load all help
packloadall
silent! helptags ALL

  "Auto cmd ========================
  "Trim Whitespace Function
fun! TrimWhitespace()
       let l:save = winsaveview()
       keeppatterns %s/\s\+$//e
       call winrestview(l:save)
endfun

augroup autogroup
      au!
    "Trim whitespace
    autocmd BufWritePre * : call TrimWhitespace()
    " Format options
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    "file types
    autocmd BufRead,BufNewFile .eslintrc,.babelrc,.prettierrc set filetype=json
    autocmd BufRead,BufNewFile *.js,*.jsx set filetype=typescriptreact
    autocmd BufRead,BufNewFile *.ts,*.tsx set filetype=typescriptreact
augroup END

    colorscheme ayu

let ayucolor='dark'
 "mirage setings
    hi CursorLine guibg=#1f262a
    hi CursorColumn guibg=#1f262a
"let ayucolor='mirage'
"let ayucolor='light'

" let g:gruvbox_bold = 1
" " let g:gruvbox_italic =1
" " let g:gruvbox_underline=1
" " let g:gruvbox_undercurl=1
" " let g:gruvbox_termcolors=256
" let g:gruvbox_contrast_dark='hard'
" " let g:gruvbox_contrast_light='soft'
" " let g:gruvbox_hls_cursor='orange'
" " let g:gruvbox_number_column='NONE'
" " let g:gruvbox_sign_column='bg1'
" " let g:gruvbox_color_column='bg0'
" " let g:gruvbox_vert_split='bg0'
" let g:gruvbox_italicize_comments=1
" let g:gruvbox_invert_selection=0
" " let g:gruvbox_invert_ident_guides=0
" let g:gruvbox_invert_tabline=1
" " let g:gruvbox_improved_strings=1
" " let g:gruvbox_improved_warnings=1

    " popup is too clear on this theme
    " hi Pmenu     guifg=#ffffff guibg=#393939
    " hi PmenuSel  guifg=#ffffff guibg=#666666

" always show
let g:vem_tabline_show=2


" only display shown buffers when splits
let g:vem_tabline_multiwindow_mode=1

" show  buffer number
" let g:vem_tabline_show_number='buffnr'
" let g:vem_tabline_show_number='index'

" colors
" hi link VemTablineShown Visual
" hi link VemTablineNumberShown Visual
" highlight VemTablineNormal           term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#FAFAFA guibg=#3D4751 gui=none
" highlight VemTablineLocation         term=reverse cterm=none ctermfg=239 ctermbg=251 guifg=#666666 guibg=#cdcdcd gui=none
" highlight VemTablineNumber           term=reverse cterm=none ctermfg=239 ctermbg=251 guifg=FFFFFFF guibg=#3D4751  gui=none
" highlight VemTablineSelected         term=bold    cterm=bold ctermfg=0   ctermbg=255 guifg=#242424 guibg=#ABB0B6 gui=bold
" highlight VemTablineLocationSelected term=bold    cterm=none ctermfg=239 ctermbg=255 guifg=#666666 guibg=#ffffff gui=bold
" highlight VemTablineNumberSelected   term=bold    cterm=none ctermfg=239 ctermbg=255 guifg=#666666 guibg=#ABB0B6 gui=bold
" highlight VemTablineShown            term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#242424 guibg=#cdcdcd gui=none
" highlight VemTablineLocationShown    term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#666666 guibg=#cdcdcd gui=none
" highlight VemTablineNumberShown      term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#666666 guibg=#cdcdcd gui=none
" highlight VemTablineSeparator        term=reverse cterm=none ctermfg=246 ctermbg=251 guifg=#888888 guibg=#cdcdcd gui=none
" highlight VemTablinePartialName      term=reverse cterm=none ctermfg=246 ctermbg=251 guifg=#888888 guibg=#cdcdcd gui=none
" highlight VemTablineTabNormal        term=reverse cterm=none ctermfg=0   ctermbg=251 guifg=#242424 guibg=#4a4a4a gui=none
" highlight VemTablineTabSelected      term=bold    cterm=bold ctermfg=0   ctermbg=255 guifg=#242424 guibg=#ffffff gui=bold

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Switch to your current theme
" let g:airline_theme = 'onedark'
" let g:airline_theme = 'gruvbox'
let g:airline_theme = 'deus'

" Sections
" let g:airline_section_c = ''
let g:airline_section_y = ''
let g:webdevicons_enable_airline_tabline = 1

let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }

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

" Better indenting in visual mode (indent and go back to visual sellection)
vnoremap < <gv
vnoremap > >gv

" quit and save with capitals Q W (sometimes i dont release shift in time)
:command! -bar -bang Q quit<bang>
:command! -bar -bang W write<bang>
:command! -bar -bang Wq wq<bang>
:command! -bar -bang WQ wq<bang>
:command! -bar -bang QQQ wqa<bang>

" Select all
nnoremap <C-a> ggVG

"Comment
nnoremap gc :call NERDComment('n','toggle')<CR>
vnoremap gc :call NERDComment('x','toggle')<CR>gv

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

" space is leader
" let mapleader=" "
let g:mapleader = "\<Space>"
" , is local leader
let g:maplocalleader = '-'
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
" Map local leader to which kwy
nnoremap <silent> <localleader> :<c-u>WhichKey  '-'<CR>


" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

    " Hide status line on which key
    autocmd! FileType which_key
    autocmd  FileType which_key set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

function! Coc_show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"Close all buffers with fifletype
" function! BDExt(ext)
"   let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && bufname(v:val) =~ "\.'.a:ext.'$"')
"   if empty(buffers) |throw "no *.".a:ext." buffer" | endif
"   exe 'bd '.join(buffers, ' ')
" endfunction

" Top Layer
let g:which_key_map['/'] = ['<plug>NERDCommenterToggle'                     ,'Comment' ]
let g:which_key_map['='] = ['<C-W>='                                        ,'Balance Windows' ]
let g:which_key_map[','] = ['Buffers'                                       ,'Buffer List']
let g:which_key_map[' '] = ['Files'                                         ,'Find File Local']
"TODO: let g:which_key_map['.'] = ['XXXXXX'                         ,'Find File Global']
let g:which_key_map['d'] = ['bd'                                            ,'Delete Buffer']
let g:which_key_map['e'] = [':CocCommand explorer'                           ,'File Explorer' ]
let g:which_key_map['h'] = ['<C-W>s'                                        ,'Split Below']
let g:which_key_map['j'] = ['<Plug>(easymotion-bd-w)'                       ,'Jump to Word' ]
let g:which_key_map['J'] = ['<Plug>(easymotion-s2)'                         ,'Jump With 2 Chars' ]
let g:which_key_map['m'] = [':MaximizerToggle'                         ,'Maximize' ]
let g:which_key_map['o'] = ['append(line("."),   repeat([""], v:count1))'   ,'Line Below' ]
let g:which_key_map['O'] = ['append(line(".")-1,   repeat([""], v:count1))' ,'Line Above' ]
let g:which_key_map['p'] = ['Files'                                         ,'Search File Local' ]
let g:which_key_map['P'] = ['Commands'                                      ,'Commands' ]
let g:which_key_map['q'] = ['q'                                             ,'Quit' ]
let g:which_key_map['r'] = ['RnvimrToggle'                                  ,'Ranger' ]
let g:which_key_map['u'] = ['UndotreeToggle'                                ,'Undo Tree' ]
let g:which_key_map['v'] = ['<C-W>v'                                        ,'Split Right']
let g:which_key_map['y'] = [':CocList -A --normal yank'                     ,'Yank List']

" Workspaces submenu
let g:which_key_map['<Tab>'] = {
  \ 'name': '+Workspaces',
  \ '<Tab>' : [':Startify'             ,'Dashboard'],
  \ 'd'     : [':SDelete!'             ,'Delete Session'],
  \ 'l'     : [':SLoad'                ,'Load Session'],
  \ 'L'     : [':CocList sessions'    ,'Session List'],
  \ 's'     : [':SSave!'               ,'Save Session' ]
  \ }

" Actions submenu
let g:which_key_map['a'] = {
  \ 'name' : '+Actions' ,
  \ 'e' : [':CocList --normal extensions'     ,'Manage Coc Extensions'],
  \ 'c' : [':PlugClean'                       ,'Clean Old Plugin'],
  \ 'i' : [':PlugInstall'                     ,'Install Plugins'],
  \ 'I' : [':CocList --normal marketplace'    ,'Install Coc Extensions'],
  \ 's' : [':let @/ = ""'                     ,'Remove Search Hl'],
  \ 'S' : [':source $MYVIMRC'                 ,'Source $MYVIMRC'],
  \ 'u' : [':PlugUpdate'                      ,'Update Plugins'],
  \ 'U' : [':CocUpdateSync'                   ,'Update Coc']
  \ }

" Buffers submenu
let g:which_key_map['b'] = {
  \ 'name' : '+Buffer' ,
  \ '/' : ['Buffers'   ,'Find Buffer'],
  \ 'd' : ['bd'        ,'Delete Buffer'],
  \ 'D' : [':%bd'      ,'Delete All Buffers'],
  \ 'f' : ['bfirst'    ,'First Buffer'],
  \ 'k' : [':%bd|e#'   ,'Delete Other Buffers'],
  \ 'l' : ['blast'     ,'Last Buffer'],
  \ 'n' : ['bnext'     ,'Next Buffer'],
  \ 'N' : ['enew'      ,'New Empty Buffer'],
  \ 'p' : ['bprevious' ,'Previous Buffer']
  \ }

let g:which_key_map['c'] = {
  \ 'name' : '+Code(lsp)' ,
  \ '.' : [':CocConfig'                          , 'CocConfig'],
  \ ';' : ['<Plug>(coc-refactor)'                , 'Refactor'],
  \ 'a' : ['<Plug>(coc-codeaction)'              , 'Line Action'],
  \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'Selected Action'],
  \ 'c' : [':CocList commands'                   , 'Coc Commands'],
  \ 'd' : ['<Plug>(coc-definition)'              , 'Definitions'],
  \ 'D' : ['<Plug>(coc-declaration)'             , 'Declarations'],
  \ 'f' : ['<Plug>(coc-format-selected)'         , 'Format Selected'],
  \ 'F' : ['<Plug>(coc-format)'                  , 'Format'],
  \ 'h' : ['<Plug>(coc-float-hide)'              , 'Hide Floating Windows'],
  \ 'i' : ['<Plug>(coc-implementation)'          , 'Implementation'],
  \ 'I' : [':CocList --normal diagnostics'       , 'Diagnostics'],
  \ 'j' : ['<Plug>(coc-float-jump)'              , 'Jump Into Float Window'],
  \ 'k' : [':call Coc_show_documentation()'      , 'Show Documentation'],
  \ 'l' : ['<Plug>(coc-codelens-action)'         , 'Codelens Action'],
  \ 'o' : ['<Plug>(coc-openlink)'                , 'Open Link'],
  \ 'O' : [':CocList outline'                    , 'Outline'],
  \ 'q' : ['<Plug>(coc-fix-current)'             , 'QuickFix'],
  \ 'r' : ['<Plug>(coc-rename)'                  , 'Rename'],
  \ 'R' : ['<Plug>(coc-references)'              , 'References'],
  \ 's' : [':CocList -I symbols'                 , 'References List'],
  \ 't' : ['<Plug>(coc-type-definition)'         , 'Type Deffinition'],
  \ 'u' : [':CocListResume'                      , 'Resume List']
  \ }

" Code + Next submenu
let g:which_key_map.c['n'] = {
  \ 'name' : '+Next' ,
  \ 'a' : [':CocNext'                            , 'Next Action'],
  \ 'd' : ['<Plug>(coc-diagnostic-next)'         , 'Next Diagnostic'],
  \ 'e' : ['<Plug>(coc-diagnostic-next-error)'   , 'Next Errorj']
  \ }
" Code + Previous submenu
let g:which_key_map.c['p'] = {
  \ 'name' : '+Previous' ,
  \ 'a' : [':CocPrev'                            , 'Previous Action'],
  \ 'd' : ['<Plug>(coc-diagnostic-prev)'         , 'Previous Diagnostic'],
  \ 'e' : ['<Plug>(coc-diagnostic-prev-error)'   , 'Previous Error']
  \ }

" Debug submenu
let g:which_key_map['D'] = {
  \ 'name': '+Debug',
  \ 'c' : [':call win_gotoid(g:vimspector_session_windows.code) <CR>'            , 'Code Window'],
  \ 'd' : ['<Plug>VimspectorContinue'                                       , 'Launch/Continue'],
  \ 'e' : ['<Plug>VimspectorBalloonEval'                                    , 'Balloon Eval'],
  \ 'o' : [':call win_gotoid(g:vimspector_session_windows.output)<CR>'          , 'Output Window'],
  \ 'P' : ['<Plug>VimspectorPause'                                          , 'Pause'],
  \ 'R' : ['<Plug>VimspectorRestart'                                        , 'Restart'],
  \ 's' : [':call win_gotoid(g:vimspector_session_windows.stack_trace)<CR>'     , 'Stack Window'],
  \ 'S' : ['<Plug>VimspectorStop'                                           , 'Stop'],
  \ 't' : [':call win_gotoid(g:vimspector_session_windows.tagpage)<CR>'         , 'Tag Window'],
  \ 'v' : [':call win_gotoid(g:vimspector_session_windows.variables)<CR>'       , 'Variable Window'],
  \ 'w' : [':call win_gotoid(g:vimspector_session_windows.watches)<CR>'         , 'Watch Window']
  \ }

" Debug Run Submenu
let g:which_key_map.D['r'] ={
  \ 'name' : '+Run',
  \ 'c' : ['<Plug>VimspectorRunToCursor'                    , 'Run to Cursor'],
  \ 'j' : ['<Plug>VimspectorStepOver'                       , 'Step Over'],
  \ 'k' : ['<Plug>VimspectorStepOut'                        , 'Step Out'],
  \ 'l' : ['<Plug>VimspectorStepInto'                       , 'Step Into']
  \ }

" Debug Breakpoint Submenu
let g:which_key_map.D['b'] ={
  \ 'name' : '+Breakpoints',
  \ 'b' : ['<Plug>VimspectorToggleBreakpoint'               , 'Toggle Breakpoint'],
  \ 'c' : ['<Plug>VimspectorToggleConditionalBreakpoint'    , 'Toggle Conditional Breakpoint'],
  \ 'C' : [':call vimspector#ClearBreakpoints()<CR>'        , 'Clean'],
  \ 'f' : ['<Plug>VimspectorAddFunctionBreakpoint'          , 'Functional Breakpoint']
  \ }

" File Submenu
  "TODO: \ 'c' : [':let @+=expand("%:p")'                      , 'Copy Path'],
  " \ 'f' : ['','Find File Globaly']
  " \ 'm' : [''                                    , 'Move File'],
  " \ 'y' : [':let @*=expand("%:p")'                       , 'Yank Path']
let g:which_key_map['f'] = {
  \ 'name': '+File',
  \ 'r' : [':History'                                    , 'Recent Files'],
  \ 'R' : [':CocCommand workspace.renameCurrentFile'     , 'Rename File'],
  \ }

" Git submenu
let g:which_key_map['g'] = {
  \ 'name' : '+Git' ,
  \ 'A' : [':Git add .'                        , 'Add Current'],
  \ 'a' : [':Git add %'                        , 'Add ALl'],
  \ 'b' : [':Git blame'                        , 'Blame'],
  \ 'B' : [':GBrowse'                          , 'Browse'],
  \ 'c' : [':Git commit'                       , 'Commit'],
  \ 'd' : [':Git diff'                         , 'Diff'],
  \ 'D' : [':Gdiffsplit'                       , 'Diff Split'],
  \ 'g' : [':FloatermNew lazygit'              , 'Lazy Git'],
  \ 'G' : [':GGrep'                            , 'Git Grep'],
  \ 'l' : [':Git log'                          , 'Log'],
  \ 'P' : [':Git push'                         , 'Push'],
  \ 'p' : [':Git pull'                         , 'Pull'],
  \ 'r' : [':GRemove'                          , 'Remove'],
  \ 's' : [':Gstatus'                          , 'Status'],
  \ 'v' : [':GV'                               , 'View Commits'],
  \ 'V' : [':GV!'                              , 'View Buffer Commits'],
  \ }
  " TODO: Check
  " \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
  " \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
  " \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
  " \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
  " \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
  " \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
  " \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],

" Insert Submenu
let g:which_key_map['i'] = {
  \ 'name': '+Insert',
  \ 'n': [':put %'              ,'Current File Name'],
  \ 'p': [':put=expand("%:p")'  ,'Current File Path'],
  \ 'u': [':UnicodeTable'       ,'Unicode']
  \ }

" Lists Submenu
let g:which_key_map['l'] = {
  \ 'name': '+Lists',
  \ 'a' : [':CocList --normal todolist'    ,'Todos'],
  \ 'b' : [':CocList --normal buffers'     ,'Buffers'],
  \ 'c' : [':CocList --normal commands'    ,'Coc Commands'],
  \ 'd' : [':CocList --normal snippets'    ,'Snippets'],
  \ 'e' : [':CocList --normal extensions'  ,'Coc Extensions'],
  \ 'i' : [':CocList --normal issues'      ,'Github Issues'],
  \ 'l' : [':CocList --normal links'       ,'Current Buffer Links'],
  \ 'm' : [':CocList --normal maps'        ,'Maps'],
  \ 'M' : [':CocList --normal marks'       ,'Marks'],
  \ 'q' : [':CocList --normal quickfix'    ,'Quickfix'],
  \ 'r' : [':CocList --normal services'    ,'Coc Services'],
  \ 's' : [':CocList --normal -I symbols'  ,'Workplace Symbols'],
  \ 'S' : [':CocList --normal sources'     ,'Completion Sources'],
  \ 't' : [':CocList --normal floaterm'    ,'Terminals'],
  \ 'T' : [':CocList --normal tags'        ,'Tags'],
  \ 'v' : [':CocList --normal vimcommands' ,'Vim Commands'],
  \ 'x' : [':CocList --normal marketplace' ,'Marketplace']
  \ }

" Search Submenu
let g:which_key_map['s'] = {
  \ 'name' : '+Search' ,
  \ '/' : [':History/'          , 'Search History'],
  \ ';' : [':Commands'          , 'Commands'],
  \ 'a' : [':Ag'                , 'Text Ag'],
  \ 'b' : [':BLines'            , 'Current Buffer'],
  \ 'B' : [':Lines'             , 'Txt in Opened Buffers'] ,
  \ 'c' : [':Commits'           , 'Commits'],
  \ 'C' : [':BCommits'          , 'Buffer Commits'],
  \ 'f' : [':Files'             , 'Local Files'],
  \ 'g' : [':GFiles'            , 'Git Files'],
  \ 'G' : [':GFiles?'           , 'Modified Git Files'],
  \ 'h' : [':History'           , 'Files History'],
  \ 'H' : [':History:'          , 'Command History'],
  \ 'm' : [':Marks'             , 'Marks'] ,
  \ 'M' : [':Maps'              , 'Normal Maps'] ,
  \ 'p' : [':Helptags'          , 'Help Tags'] ,
  \ 'P' : [':Tags'              , 'Project Tags'],
  \ 's' : [':CocList snippets'  , 'Snippets'],
  \ 'S' : [':Colors'            , 'Color Schemes'],
  \ 't' : [':Rg'                , 'Text Rg'],
  \ 'T' : [':BTags'             , 'Buffer Tags'],
  \ 'w' : [':Windows'           , 'Windows'],
  \ 'y' : [':Filetypes'         , 'File Types'],
  \ 'z' : [':FZF'               , 'FZF'],
  \ }

" Terminal Submenu
let g:which_key_map['t'] = {
  \ 'name' : '+Terminal' ,
  \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'New Terminal'],
  \ 'b' : [':FloatermNew btm'                               , 'Bottom Monitor'],
  \ 'd' : [':FloatermNew lazydocker'                        , 'Lazydocker'],
  \ 'h' : [':FloatermNew htop'                              , 'Htop Monitor'],
  \ 'l' : [':CocList floaterm'                              , 'List Terminals'],
  \ 'n' : [':FloatermNew node'                              , 'Node'],
  \ 't' : [':FloatermToggle'                                , 'Toggle Terminal'],
  \ 'y' : [':FloatermNew ytop'                              , 'Ytop Monitor']
  \ }

" Toggle submenu
let g:which_key_map['T'] ={
  \ 'name' : '+Toggle',
  \ 'c' : [':set cursorcolumn!'                     , 'Cursor Column'],
  \ 'd' : [':set background=dark'                   , 'Dark  Background'],
  \ 'i' : [':IndentLinesToggle'                     , 'Indent Lines'],
  \ 'l' : [':set background=light'                  , 'Light Background'],
  \ 'L' : [':set cursorline!'                       , 'Cursor Line'],
  \ 'n' : [':set nonumber!'                         , 'Line Numbers'],
  \ 'r' : [':set norelativenumber!'                 , 'Relative Numbers'],
  \ 'R' : [':syntax on'                             , 'Reset Colors (syntax on)'],
  \ 't' : [':Vista!!'                               , 'Tag Viewer'],
  \ 'T' : [':hi Normal ctermbg=NONE guibg=NONE<CR>' , 'Transparent Background'],
  \ 'p' : [':RainbowToggle'                         , 'Color Parenthesis'],
  \ 'w' : [':set wrap!'                             , 'Wrap'],
  \ 'z' : [':Goyo! 70%x90%'                                  , 'Zen Mode']
  \ }

" Window submenu
let g:which_key_map['w'] = {
  \ 'name' : '+Window',
  \ 'h' : ['<C-W>H', 'Move Left'],
  \ 'j' : ['<C-W>J', 'Move Down'],
  \ 'k' : ['<C-W>K', 'Move Up'],
  \ 'l' : ['<C-W>L', 'Move Right'],
  \ }

" Scratch Buffer submenu
let g:which_key_map['x'] ={
  \ 'name': '+Scratch',
  \ 'c' : [':ScratchSelection'    , 'Copy To Scratch Buffer'],
  \ 'C' : [':ScratchSelection!'   , 'Copy To Clean Scratch Buffer'],
  \ 'v' : [':ScratchPreview'      , 'View Scratch Buffer'],
  \ 'x' : [':Scratch'             , 'Open Scrach Buffer'],
  \ 'X' : [':Scratch!'            , 'Open Clean Scrach Buffer']
  \ }

let g:which_key_local_org_map = {}

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
call which_key#register('-', "g:which_key_local_org_map")

let g:NERDCreateDefaultMappings = 0
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

let g:maximizer_restor_on_winleave=1
let g:maximizer_set_default_mapping = 0
let g:maximizer_set_mapping_with_bang = 0

" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

 let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_enabled = 0
let g:indentLine_setColors = 0

    " Default rules for matching:
let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'},
            \ '`': {'closer': '`'},
            \ '<*>': {'closer' : '</*>',
            \         'not_if': ['br', 'hr', 'img', 'input', 'link', 'meta',
            \                    'area', 'base', 'col', 'command', 'embed',
            \                    'keygen', 'param', 'source', 'track', 'wbr'],
            \         'not_like': '/$',
            \         'not_in': ['typescriptTypeReference', 'TypeReference','String']
            \        }
            \ }
" See pear-tree/after/ftplugin/ for filetype-specific matching rules

" Pear Tree is enabled for all filetypes by default:
let g:pear_tree_ft_disabled = []

" Pair expansion is dot-repeatable by default:
let g:pear_tree_repeatable_expand = 1

" Smart pairs are disabled by default:
let g:pear_tree_smart_openers = 0
let g:pear_tree_smart_closers = 0
let g:pear_tree_smart_backspace = 0

" If enabled, smart pair functions timeout after 60ms:
let g:pear_tree_timeout = 60

" Automatically map <BS>, <CR>, and <Esc>
let g:pear_tree_map_special_keys = 1

" Default mappings:
imap <BS> <Plug>(PearTreeBackspace)
imap <CR> <Plug>(PearTreeExpand)
imap <Esc> <Plug>(PearTreeFinishExpansion)
" Pear Tree also makes <Plug> mappings for each opening and closing string.
"     :help <Plug>(PearTreeOpener)
"     :help <Plug>(PearTreeCloser)

" Not mapped by default:
" <Plug>(PearTreeSpace)
" <Plug>(PearTreeJump)
" <Plug>(PearTreeExpandOne)
" <Plug>(PearTreeJNR)

let g:rainbow_active = 1

if has("persistent_undo")
  if !isdirectory($HOME."/.config/nvim/undodir")
    silent call mkdir($HOME."/.config/nvim/undodir", "p")
  endif
  set undodir=~/.config/nvim/undodir
  set undofile
endif

    let g:rooter_silent_chdir = 1

    let g:startify_session_dir = '~/.config/nvim/sessions'

  if !isdirectory($HOME."/.config/nvim/sessions")
    silent call mkdir($HOME."/.config/nvim/sessions", "p")
  endif

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recent Files']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
      " \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_bookmarks = []

let g:startify_files_number = 10

let g:startify_change_to_vcs_root = 1

let g:startify_session_sort = 1

let g:turtlePoem = [
      \ '                                   ____',
      \ '                                 /   () \',
      \ '                          .--.  |   //   |  .--.',
      \ '                         : (\ ". \ ____ / ." /) :',
      \ '                          ".    `   ||     `  ."',
      \ '                           /    _        _    \',
      \ '                          /     0}      {0     \',
      \ '                         |       /      \       |',
      \ '                         |      /        \     |',
      \ '                          \    |.  .==.  .|   /',
      \ '                           "._ \.  \__/  ./ _."',
      \ '                           /  ``"._-""-_."``  \',
      \ '==========================================================================',
      \ '  _____     ____                                          ____     _____  ',
      \ ' /      \  |  o |   See the TURTLE of  Enormous Girth    | o  |  /      \ ',
      \ '|        |/ ___\|    On his shell he holds the Earth     |/___ \|        |',
      \ '|_________/        His thought is slow, but always kind        \_________|',
      \ '|_|_| |_|_|          He holds us all within his mind           |_|_| |_|_|',
      \ '                                                                          ',
      \ '==========================================================================',
      \ ]
let g:startify_custom_header = 'startify#center(g:turtlePoem)'

" highlight StartifyBracket ctermfg=240
" highlight StartifyFooter  ctermfg=240
highlight StartifyHeader  ctermfg=114 guifg=#87d787
highlight StartifyNumber    ctermfg=14 guifg=#5CCFE6
" highlight StartifyPath    ctermfg=245
" highlight StartifySlash   ctermfg=240
" highlight StartifySpecial ctermfg=240
"
let g:startify_session_before_save = [
  \ 'echo "Cleaning up"',
  \ 'silent! Vista!',
  \ ]

" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

    " :h Scratch for info
   let  g:scratch_height = 20
   let g:scratch_top = 0
   let g:scratch_horizontal = 1
   " let g:scratch_persistence_file '.scratch.vim' "Project based scratch
   let g:scratch_persistence_file = '~/.config/nvim/scratch.vim' " Global Scratch

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-actions',
  \ 'coc-emmet',
  \ 'coc-git',
  \ 'coc-highlight',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ 'coc-explorer',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-spell-checker',
  \ 'coc-cspell-dicts',
  \ 'coc-tabnine',
  \ 'coc-prettier',
  \ 'coc-floaterm',
  \ 'coc-marketplace',
  \ 'coc-yank',
  \ 'coc-todolist',
  \ 'coc-react-refactor',
  \ 'coc-docthis',
  \ 'coc-tag'
  \ ]

" only load eslint if module is present
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" use ctrl+j and ctro+k for navigate completion
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-h>"


" Use tab for scroll completions and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<S-tab>'

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

 " Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" TODO: gi is used for go to the last pace you inserted
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show documentation on hover
" function! ShowDocIfNoDiagnostic(timer_id)
" if (coc#util#has_float() == 0)
"   silent call CocActionAsync('doHover')
" endif
" endfunction


"
" function! s:show_hover_doc()
  " call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction
"
" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()


" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" Use leader K to show documentation in preview window.
" nnoremap <silent> <leader><leader>k :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
augroup Coc
    autocmd! Coc
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

" xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
"<leader>a for the current selected range
"<leader>aw for the current word
"<leader>aas for the current sentence
"<leader>aap for the current paragraph
":h text-objects to see more detail

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

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Mappings using CoCList:
" Show all diagnostics of current window.
" nnoremap <silent> <leader>?  :<C-u>CocList --normal diagnostics <cr>
" Show all diagnostics of workspace
" nnoremap <silent> <leader><leader>? :<C-u>CocAction('coc-diagnostic-list')
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent> <leader><leader>p  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent> <leader>gs  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <leader><leader>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Find File
" nmap <leader>p :CocList files<CR>

" Open file explorer
" nmap <leader>e :CocCommand explorer<CR>

"  multiple cursors
  function! s:select_current_word()
    if !get(b:, 'coc_cursors_activated', 0)
      return "\<Plug>(coc-cursors-word)"
    endif
    return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
  endfunc

  nmap <C-LeftRelease>  <Plug>(coc-cursors-position)
  " nmap <M-LeftRelease> <Plug>(coc-cursors-word)

let g:vimspector_install_gadgets = ['debugger-for-chrome','vscode-node-debug2']
let g:vimspector_base_dir=expand( '$HOME/.config/nvim/vimspector-config' )

hi CocGitAddedSign guifg=#B8CC52 guibg=NONE
hi CocGitChangedSign guifg=#36A3D9 guibg=NONE
hi CocGitRemovedSign guifg=#bf0505 guibg=NONE

let g:org_todo_keywords = [['TODO(t)', 'DOING(d)', '|', 'DONE(D)']]

let g:org_todo_keyword_faces = [['TODO', ' red'],['DOING','yellow'],['DONE','green']]
let g:org_agenda_files = ['~/Documents/OrgFiles/projects.org']
let g:org_heading_shade_leading_stars = 1

" let g:org_todo_keyword_faces = [['WAITING', 'cyan'], ['CANCELED',
"   \   [':foreground red', ':background black', ':weight bold',
"   \   ':slant italic', ':decoration underline']]]

                  " This setting defines whether the leading stars of the headlines
            " will be shaded. Set this to 0 if you don't want them to be shaded. >
                let g:dotoo_headline_shade_leading_stars = 1

            " This setting defines what the faces of various TODO states look
            " like. >
                let g:dotoo_todo_keyword_faces = [
                  \ ['TODO', [':foreground 160', ':weight bold']],
                  \ ['DOING', [':foreground 27', ':weight bold']],
                  \ ['DONE', [':foreground 22', ':weight bold']],
                  \ ]

            " This setting defines various todo keywords to be recognized. A `|`
            " separates final done states from others. >
                let g:dotoo#parser#todo_keywords = [
                  \ 'TODO',
                  \ 'DOING',
                  \ '|',
                  \ 'DONE']


            " This setting sets the warning period, so you're warned about TODOs
            " that are due within the warning period from today. It is a string
            " of the form '{number}[dmy]' where 'd' stands for day, 'm' for
            " month, 'y' for year. >
                let g:dotoo#agenda#warning_days = '30d'

            " This setting is an array of files the agenda will read to show
            " what's on the agenda within the warning days. They can include
            " wildcards which will be expanded using |glob()| >
                " let g:dotoo#agenda#files = ['~/Documents/dotoo-files/*.dotoo']
                let g:dotoo#agenda#files = ['~/Documents/OrgFiles/projects.org']

            " This setting defines whether the time_ago would output a short
            " value near the closest years, months, days, hours, minutes or
            " seconds or a long value with the full time ago. Set it to 1 to see
            " a short time ago. >
                let g:dotoo#time#time_ago_short = 0

            " This setting defines the default refile file where the capture
            " captures templates into. >
                let g:dotoo#capture#refile = expand('~/Documents/dotoo-files/refile.dotoo')

            " This setting enables clocking while capturing. >
                let g:dotoo#capture#clock = 1

            " This setting defines the capture templates the capture menu uses. >
                let g:dotoo#capture#templates = {
                      \ 't': {
                      \   'description': 'Todo',
                      \   'lines': [
                      \     '* TODO %?',
                      \     'DEADLINE: [%(strftime(g:dotoo#time#datetime_format))]'
                      \   ],
                      \  'target': 'refile:Tasks'
                      \ },
                      \ 'n': {
                      \   'description': 'Note',
                      \   'lines': ['* %? :NOTE:'],
                      \ },
                      \ 'm': {
                      \   'description': 'Meeting',
                      \   'lines': ['* MEETING with %? :MEETING:'],
                      \ },
                      \ 'p': {
                      \   'description': 'Phone call',
                      \   'lines': ['* PHONE %? :PHONE:'],
                      \ },
                      \ 'h': {
                      \   'description': 'Habit',
                      \   'lines': [
                      \     '* NEXT %?',
                      \     'SCHEDULED: [%(strftime(g:dotoo#time#date_day_format)) +1m]',
                      \     ':PROPERTIES:',
                      \     ':STYLE: habit',
                      \     ':REPEAT_TO_STATE: NEXT',
                      \     ':END:'
                      \   ]
                      \ }
                      \}

            " Templates are represented by a dictionary where the key is the
            " short_key used to select the template from the capture menu.

            " It has the following structure

            " ,* `description` provides a human friendly explanation of what this
            "    template represents
            " ,* `lines` is a list for each line of the template. You can use
            "    `%?` as a placeholder for where the cursor will be while editing
            "    the template immidiately after selecting it and `%(...)` to
            "    inline viml code that will be evaluated.
            " ,* `target` defines the target for  this capture template should be
            "    saved to, it can either be a dotoo file path or a dotoo move
            "    target such as `todo:Tasks` which represents a dotoo file
            "    headline to use as the parent for this captured headline.

            " For easier customization this allows you to be able to add new or
            " override the provided templates easily. >
                let g:dotoo#capture#templates = {
                      \ 't': {
                      \   'target': 'refile-personal:Todos'
                      \ }
                      \}

                " Or add new template
                let g:dotoo#capture#templates = {
                      \ 'x': {
                      \   'description': 'eXtra template',
                      \   'lines': ['* eXtra %? :EXTRA:'],
                      \ }
                      \}

                " Or both
                let g:dotoo#capture#templates = {
                      \ 't': {
                      \   'target': 'refile-personal:Todos'
                      \ },
                      \ 'x': {
                      \   'description': 'eXtra template',
                      \   'lines': ['* eXtra %? :EXTRA:'],
                      \ }
                      \}
