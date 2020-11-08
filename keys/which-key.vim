" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

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

" Hide status line
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

" MAPPINGS
let g:which_key_map['/'] = [ '<plug>NERDCommenterToggle' , 'comment' ]
let g:which_key_map['='] = [ '<C-W>='                     , 'balance windows' ]
" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'n' : [':set nonumber!'          , 'line-numbers'],
      \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
      \ 's' : [':let @/ = ""'            , 'remove search highlight'],
      \ 'v' : [':Vista!!'                , 'tag viewer'],
      \ 'b' : [':syntax on'    , 'reset colors'],
      \ 'B' : [':hi Normal ctermbg=NONE guibg=NONE<CR>', 'remove background'],
      \ 'i' : ['IndentGuidesToggle'      , 'toggle indent guides'],
      \ 'p' : [':RainbowToggle'       , 'Color Parenthesis']
      \ }
      " \ 'c' : [':ColorizerToggle'        , 'colorizer'],
" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }
nnoremap <silent> <leader>bt :bufdo tab split<CR>:tablast<CR>:tabclose<CR>:syntax on<CR>
let g:which_key_map.b.t ='buffers to tabs'
let g:which_key_map['B'] = [ 'Buffers'                    , 'buffer list']
let g:which_key_map['d'] = [ ':bd'                        , 'delete buffer']
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }
      " \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      " \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      " \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      " \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      " \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      " \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      " \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
let g:which_key_map['j'] = [ '<Plug>(easymotion-bd-w)'    , 'jump to word' ]
let g:which_key_map['J'] = ['<Plug>(easymotion-s2)'       , 'jump with 2 chars' ]
" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp(coc)' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList --normal diagnostics'       , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'k' : [':call Coc_show_documentation()'           , 'show domunentation'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
      \ 'O' : [':CocList outline'                    , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'R' : ['<Plug>(coc-references)'              , 'references'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ 'v' : [':Vista!!'                            , 'tag viewer'],
      \ }
let g:which_key_map.m = {
      \ 'name' : 'move split',
      \ 'h' : ['<C-W>H', 'move left'],
      \ 'j' : ['<C-W>J', 'move down'],
      \ 'k' : ['<C-W>K', 'move up'],
      \ 'l' : ['<C-W>L', 'move right'],
      \ }
let g:which_key_map['o'] = [ 'append(line("."),   repeat([""], v:count1))', 'line below' ]
let g:which_key_map['O'] = [ 'append(line(".")-1,   repeat([""], v:count1))', 'line above' ]
let g:which_key_map['p'] = [ ':Files'                     , 'search files' ]
let g:which_key_map['P'] = [ ':Commands'                  , 'commands' ]
let g:which_key_map['q'] = [ 'q'                          , 'quit' ]
let g:which_key_map['r'] = [ ':RnvimrToggle'              , 'ranger' ]
" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }
" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 'l' : [':CocList floaterm'                               , 'list terminals']
      \ }
let g:which_key_map['u'] = [ 'UndotreeToggle'             , 'undo tree' ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
" w is for workspaces
let g:which_key_map.w = {
      \ 'name': '+workspaces',
      \ 's'   : [':SSave!',                        'save session' ],
      \ 'l'   : [':SLoad'                          , 'load  session'],
      \ 'd'   : [':SDelete!'                        , 'delete session'],
      \ 'S'   : [':Startify'                       , 'start screen'],
      \ 'L'   : [':CocList sessions'               , 'session list'], 
      \ }
let g:which_key_map['z'] = [ 'Goyo '                       , 'zen' ]





" Register which key map
call which_key#register('<Space>', "g:which_key_map")
