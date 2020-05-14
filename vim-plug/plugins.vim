" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" VScode
if exists('g:vscode')
  call plug#begin('~/.config/nvim/autoload/pluggedVScode')
    Plug 'tpope/vim-surround'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'asvetliakov/vim-easymotion'
  call plug#end()
  " VScode plugins needs to be installed manually with :PlugInstall
else
" Neovim
  call plug#begin('~/.config/nvim/autoload/plugged')
    " ident guides
    Plug 'thaerkh/vim-indentguides'
    " sessions
    Plug 'thaerkh/vim-workspace'
    " Surround
    Plug 'tpope/vim-surround'
    " Repeat Stuff
    " Plug 'tpope/vim-repeat'
    " Better comments
    Plug 'preservim/nerdcommenter'
    " Status line
    Plug 'itchyny/lightline.vim' " Status bar
    "Plug 'itchyny/vim-gitbranch' "git branch on status bar
    " Git
    Plug 'tpope/vim-fugitive'
    " Icons
    "Plug 'ryanoasis/vim-devicons' 
    " Auto pairs for '(' '[' '{' 
    Plug 'jiangmiao/auto-pairs'
    " Closetags
    Plug 'alvan/vim-closetag'
    " Themes
     Plug 'christianchiarulli/onedark.vim'
    " Plug 'sonph/onehalf', {'rtp' : 'vim/'} 
    " Plug 'ajmwagar/vim-deus' 
    " Plug 'jdsimcoe/abstract.vim' 
    " Plug 'gilgigilgil/anderson.vim' 
    " Plug 'ayu-theme/ayu-vim' 
    Plug 'dracula/vim' 
    " Multiple cursors
    Plug 'terryma/vim-multiple-cursors' 
    " VSode like autocompletion and other stuff
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} 
    " Text navigation
    " Plug 'justinmk/vim-sneak'
    " Plug 'unblevable/quick-scope' 
    Plug 'easymotion/vim-easymotion'
    " undo tree
    Plug 'mbbill/undotree'
    " save witg sudo
    Plug 'lambdalisue/suda.vim'
    " Syntax 
    Plug 'pangloss/vim-javascript' "JS highlighting
    Plug 'mxw/vim-jsx' "JSX syntax highlighting
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  call plug#end()

  " Automatically install missing plugins on startup
  autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif
endif

