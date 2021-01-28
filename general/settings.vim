set iskeyword+=-                      	" treat dash separated words as a word text object"
"set formatoptions-=cro                  " Stop newline continution of comments

" Neovim
if !exists('g:vscode')
  set autoread                             " update file if changed 
  au CursorHold * checktime               " check autoread every 4s
  syntax enable                           " Enables syntax highlighing
  set hidden                              " Required to keep multiple buffers open multiple buffers
  " set bufhidden=delete                      " removes bufferss not displayed in a window
  " set showtabline=2                         " always show tab bar
  set wrap
  set linebreak
  set textwidth=0 wrapmargin=0
  " set nowrap                              " Display long lines as just one line
  set encoding=utf-8                      " The encoding displayed 
  set pumheight=10                        " Makes popup menu smaller
  set pumblend=50                         " Popup menu transparency
  set fileencoding=utf-8                  " The encoding written to file
  set ruler              			            " Show the cursor position all the time
  set cmdheight=2                         " More space for displaying messages
  set mouse=a                             " Enable your mouse
  set splitbelow                          " Horizontal splits will automatically be below
  set splitright                          " Vertical splits will automatically be to the right
  set t_Co=256                            " Support 256 colors
  set conceallevel=0                      " So that I can see `` in markdown files
  set tabstop=2                           " Insert 2 spaces for a tab
  set shiftwidth=2                        " Change the number of space characters inserted for indentation
  set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
  set expandtab                           " Converts tabs to spaces
  set smartindent                         " Makes indenting smart
  set autoindent                          " Good auto indent
  set laststatus=2                        " Always display the status line
  set number relativenumber               " relative numbers
  set nu rnu                              " current line number
  set cursorline                          " Enable highlighting of the current line
  set cursorcolumn
  "set background=dark                     " tell vim what the background color looks like
  "set showtabline=2                       " Always show tabs 
  " create swap dir if not exist
  if !isdirectory($HOME."/.config/nvim/swap")
    silent call mkdir($HOME."/.config/nvim/swap", "p")
  endif
  set dir=~/.config/nvim/swap/           " tell vim where to put swap files
  set noshowmode                          " We don't need to see things like -- INSERT -- anymore
  set nobackup                            " This is recommended by coc
  set nowritebackup                       " This is recommended by coer
  set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
  set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
  set updatetime=300                      " Faster completion
  set timeoutlen=300                      " By default timeoutlen is 1000 ms
  set clipboard=unnamed                   " Copy paste between vim and everything else
  set incsearch
  "set guifont=Hack\ Nerd\ Font
  set termguicolors
  " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  " set mmp=1300
  " set autochdir                           " Your working directory will always be the same as your working directory
  " set foldcolumn=2                        " Folding abilities

  " au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  
  autocmd BufRead,BufNewFile .eslintrc,.babelrc,.prettierrc set filetype=json
  " autocmd BufNewFile,BufRead *.js,*.ts
      " \ set filetype=typescript.tsx |
      " \ set syntax=typescriptreact
  autocmd BufRead,BufNewFile *.js,*.jsx set filetype=typescriptreact
  autocmd BufRead,BufNewFile *.ts,*.tsx set filetype=typescriptreact

  " You can't stop me
"  cmap w!! w !sudo tee %

  " open everything in tabs  
  " autocmd VimEnter * tab all
  " autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'
endif
