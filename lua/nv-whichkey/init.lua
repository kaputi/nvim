local map = vim.api.nvim_set_keymap

-- vim.g.which_key_sep = '→'
vim.g.which_key_use_floating_win = 0

-- Space is leader
map('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

map('n', '<Leader>', ':WhichKey "<Space>"<CR>', {noremap = true, silent = true})
map('v', '<Leader>', ':WhichKeyVisual "<Space>"<CR>', {noremap = true, silent = true})

-- ==========================================
-- Functions ================================
-- ==========================================
vim.cmd([[
function CopyPath()
 let @+=expand("%:p")
endfunction

function YankPath()
  let @*=expand("%:p")
endfunction
]])

--==========================================

-- Create map to add keys to
local which_key_map =  {}

-- ==========================================
-- Top Layer ================================
-- ==========================================
which_key_map['/'] = {'<Plug>kommentary_line_default'                 ,'Comment' }
which_key_map['='] = {'<C-W>='                                        ,'Balance Windows' }
which_key_map[','] = {':Telescope buffers'                            ,'Buffer List'}
which_key_map[' '] = {':Telescope find_files'                         ,'Find File'}
which_key_map['d'] = {':bp | bd #'                                    ,'Delete Buffer'}
which_key_map['e'] = {':NvimTreeToggle'                               ,'File Explorer' }
which_key_map['h'] = {'<C-W>s'                                        ,'Split Below'}
which_key_map['j'] = {':HopWord'                                      ,'Jump to Word' }
which_key_map['J'] = {':HopChar2'                                     ,'Jump With 2 Chars' }
-- which_key_map['m'] = {':MaximizerToggle'                              ,'Maximize' }
which_key_map['o'] = {'append(line("."),   repeat([""], v:count1))'   ,'Line Below' }
which_key_map['O'] = {'append(line(".")-1,   repeat([""], v:count1))' ,'Line Above' }
which_key_map['p'] = {':Telescope find_files'                         ,'Search File' }
which_key_map['P'] = {':Telescope commands'                           ,'Commands' }
which_key_map['q'] = {'q'                                             ,'Quit' }
-- which_key_map['r'] = {'RnvimrToggle'                                  ,'Ranger' }
-- which_key_map['u'] = {'UndotreeToggle'                                ,'Undo Tree' }
which_key_map['v'] = {'<C-W>v'                                        ,'Split Right'}
which_key_map['y'] = {':Telescope registers'                          ,'Yank List'}


-- ==========================================
-- Dashboard layer ==========================
-- ==========================================
which_key_map['<Tab>'] = {
  name = "+Dashboard",
  ['<Tab>'] = {':Telescope' ,'Session List'},
  ['d'] = {':SDelete!'      , 'Delete Session'},
  ['D'] = {':Startify'      , 'Dashboard'},
  ['l'] = {':SLoad'         , 'Load Session'},
  ['s'] = {':SSave!'        , 'Save Session'}
}

-- ==========================================
-- Actions layer ============================
-- ==========================================
which_key_map['a'] = {
   name = '+Actions' ,
   ['c'] = {'PackerClean'      ,'Clean Old Plugin'},
   ['i'] = {'PackerInstall'    ,'Install Plugins'},
   ['s'] = {':set hls!'        ,'Remove Search Highlights'},
   ['S'] = {':source $MYVIMRC' ,'Source $MYVIMRC'},
   ['u'] = {':PackerUpdate'    ,'Update Plugins'},
   ['U'] = {':PackerSync'      ,'Sync Plugins'},
}
-- ==========================================
-- Buffer layer =============================
-- ==========================================
which_key_map['b'] = {
   name  = '+Buffer' ,
   ['b'] = {':Telescope buffers'            ,'Find Buffer'},
   ['d'] = {':bp | bd! #'                   ,'Delete Buffer Wihthout Saving'},
   ['D'] = {':%bd'                          ,'Delete All Buffers'},
   -- ['f'] = {':BufferGoto 1'    ,'First Buffer'},
   ['k'] = {':%bd!|edit #|bd #|normal `"'   ,'Delete Other Buffers'}, -- %bd kills all, edit # opens last ,bd # kills last(after killing all there is a new empty buffer) '" goes to last place before close
   -- ['l'] = {':BufferLast'     ,'Last Buffer'},
   ['n'] = {':bn'                           ,'Next Buffer'},
   ['N'] = {'enew'                          ,'New Empty Buffer'},
   ['p'] = {':bp'                           ,'Previous Buffer'}
}

-- ==========================================
-- Code layer ===============================
-- ==========================================
which_key_map['c'] = {
   name = '+Code(lsp)' ,
   ['.'] = {':CocConfig'                          , 'CocConfig'},
   [';'] = {'<Plug>(coc-refactor)'                , 'Refactor'},
   ['a'] = {'<Plug>(coc-codeaction)'              , 'Line Action'},
   ['A'] = {'<Plug>(coc-codeaction-selected)'     , 'Selected Action'},
   ['c'] = {':CocList commands'                   , 'Coc Commands'},
   ['d'] = {'<Plug>(coc-definition)'              , 'Definitions'},
   ['D'] = {'<Plug>(coc-declaration)'             , 'Declarations'},
   ['f'] = {'<Plug>(coc-format-selected)'         , 'Format Selected'},
   ['F'] = {'<Plug>(coc-format)'                  , 'Format'},
   ['h'] = {'<Plug>(coc-float-hide)'              , 'Hide Floating Windows'},
   ['i'] = {'<Plug>(coc-implementation)'          , 'Implementation'},
   ['I'] = {':CocList --normal diagnostics'       , 'Diagnostics'},
   ['j'] = {'<Plug>(coc-float-jump)'              , 'Jump Into Float Window'},
   ['k'] = {':call Coc_show_documentation()'      , 'Show Documentation'},
   ['l'] = {'<Plug>(coc-codelens-action)'         , 'Codelens Action'},
   ['o'] = {'<Plug>(coc-openlink)'                , 'Open Link'},
   ['O'] = {':CocList outline'                    , 'Outline'},
   ['q'] = {'<Plug>(coc-fix-current)'             , 'QuickFix'},
   ['r'] = {'<Plug>(coc-rename)'                  , 'Rename'},
   ['R'] = {'<Plug>(coc-references)'              , 'References'},
   ['s'] = {':CocList -I symbols'                 , 'References List'},
   ['t'] = {'<Plug>(coc-type-definition)'         , 'Type Deffinition'},
   ['u'] = {':CocListResume'                      , 'Resume List'}
}
-- Code + Next submenu
which_key_map.c['n'] = {
   name = '+Next' ,
   ['a'] = {':CocNext'                            , 'Next Action'},
   ['d'] = {'<Plug>(coc-diagnostic-next)'         , 'Next Diagnostic'},
   ['e'] = {'<Plug>(coc-diagnostic-next-error)'   , 'Next Errorj'}
 }
-- Code + Previous submenu
which_key_map.c['p'] = {
   name = '+Previous' ,
   ['a'] = {':CocPrev'                            , 'Previous Action'},
   ['d'] = {'<Plug>(coc-diagnostic-prev)'         , 'Previous Diagnostic'},
   ['e'] = {'<Plug>(coc-diagnostic-prev-error)'   , 'Previous Error'}
}

-- ==========================================
-- Debug layer ==============================
-- ==========================================
which_key_map['D'] = {
   name = '+Debug',
   ['c'] = {':call win_gotoid(g:vimspector_session_windows.code) <CR>'       , 'Code Window'},
   ['d'] = {'<Plug>VimspectorContinue'                                       , 'Launch/Continue'},
   ['e'] = {'<Plug>VimspectorBalloonEval'                                    , 'Balloon Eval'},
   ['o'] = {':call win_gotoid(g:vimspector_session_windows.output)<CR>'      , 'Output Window'},
   ['P'] = {'<Plug>VimspectorPause'                                          , 'Pause'},
   ['R'] = {'<Plug>VimspectorRestart'                                        , 'Restart'},
   ['s'] = {':call win_gotoid(g:vimspector_session_windows.stack_trace)<CR>' , 'Stack Window'},
   ['S'] = {'<Plug>VimspectorStop'                                           , 'Stop'},
   ['t'] = {':call win_gotoid(g:vimspector_session_windows.tagpage)<CR>'     , 'Tag Window'},
   ['v'] = {':call win_gotoid(g:vimspector_session_windows.variables)<CR>'   , 'Variable Window'},
   ['w'] = {':call win_gotoid(g:vimspector_session_windows.watches)<CR>'     , 'Watch Window'}
}
-- Debug Run Submenu
which_key_map.D['r'] ={
   name = '+Run',
   ['c'] = {'<Plug>VimspectorRunToCursor'                    , 'Run to Cursor'},
   ['j'] = {'<Plug>VimspectorStepOver'                       , 'Step Over'},
   ['k'] = {'<Plug>VimspectorStepOut'                        , 'Step Out'},
   ['l'] = {'<Plug>VimspectorStepInto'                       , 'Step Into'}
}
-- Debug Breakpoint Submenu
which_key_map.D['b'] ={
   name = '+Breakpoints',
   ['b'] = {'<Plug>VimspectorToggleBreakpoint'               , 'Toggle Breakpoint'},
   ['c'] = {'<Plug>VimspectorToggleConditionalBreakpoint'    , 'Toggle Conditional Breakpoint'},
   ['C'] = {':call vimspector#ClearBreakpoints()<CR>'        , 'Clean'},
   ['f'] = {'<Plug>VimspectorAddFunctionBreakpoint'          , 'Functional Breakpoint'}
}
-- ==========================================
-- File layer ===============================
-- ==========================================
which_key_map['f'] = {
   name = '+File',
   ['c'] = {':call CopyPath()'                          , 'Copy Path'},
   ['r'] = {':Telescope oldfiles'                       , 'Recent Files'},
   ['R'] = {':CocCommand workspace.renameCurrentFile'   , 'Rename File'},
   ['y'] = {':call YankPath()'                          , 'Yank Path'},
}
-- ==========================================
-- Git layer ===============================
-- ==========================================
which_key_map['g'] = {
   name = '+Git' ,
   ['A'] = {':Git add .'                        , 'Add Current'},
   ['a'] = {':Git add %'                        , 'Add ALl'},
   ['b'] = {':Git blame'                        , 'Blame'},
   ['B'] = {':GBrowse'                          , 'Browse'},
   ['c'] = {':Git commit'                       , 'Commit'},
   ['d'] = {':Git diff'                         , 'Diff'},
   ['D'] = {':Gdiffsplit'                       , 'Diff Split'},
   ['g'] = {':FloatermNew lazygit'              , 'Lazy Git'},
   ['G'] = {':GGrep'                            , 'Git Grep'},
   ['l'] = {':Git log'                          , 'Log'},
   ['P'] = {':Git push'                         , 'Push'},
   ['p'] = {':Git pull'                         , 'Pull'},
   ['r'] = {':GRemove'                          , 'Remove'},
   ['s'] = {':Gstatus'                          , 'Status'},
   ['v'] = {':GV'                               , 'View Commits'},
   ['V'] = {':GV!'                              , 'View Buffer Commits'},
 }

-- ==========================================
-- Replace  layer ===========================
-- ==========================================
map('n', '<leader>RR', ':%s/<C-r><C-w>/', {noremap = true, silent = true})
map('n', '<leader>Rr', ':s/<C-r><C-w>/', {noremap = true, silent = true})
which_key_map['R'] = {
  name='+Replace',
  ['R'] = 'Replace All',
  ['r'] = 'Replace Under Cursor'
}
-- ==========================================
-- Search layer =============================
-- ==========================================
which_key_map['s'] = {
   name = '+Search' ,
   [';'] = {':Telescope commands'          , 'Commands'},
   ['a'] = {':Ag'                , 'Text Ag'},
   ['b'] = {':Telescope current_buffer_fuzzy_find'            , 'Current Buffer'},
   ['B'] = {':Lines'             , 'Txt in Opened Buffers'} ,
   ['c'] = {':Telescope git_commits'           , 'Commits'},
   ['C'] = {':Telescope git_bcommits'          , 'Buffer Commits'},
   ['f'] = {':Telescope find_files'             , 'Filesk'},
   ['g'] = {':Telescope git_files'            , 'Git Files'},
   ['G'] = {':Telescope git_status'           , 'Modified Git Files'},
   ['h'] = {':Telescope command_history'          , 'Command History'},
   ['H'] = {':Telescope help_tags'          , 'Help Tags'} ,
   ['m'] = {':Telescope marks'             , 'Marks'} ,
   ['M'] = {':Telescope keymaps'              , 'Key Maps'} ,
   ['p'] = {':Telescope tags'              , 'Project Tags'},
   ['s'] = {':CocList snippets'  , 'Snippets'},
   ['S'] = {':Telescope colorscheme'            , 'Color Schemes'},
   ['t'] = {':Telescope live_grep'                , 'Text Rg'},
   ['T'] = {':Telescope current_buffer_tags'             , 'Buffer Tags'},
   ['w'] = {':Windows'           , 'Windows'},
   ['y'] = {':Telescope       filetypes'         , 'File Types'},
}
-- ==========================================
-- Toggle layer =============================
-- ==========================================
which_key_map['T'] ={
   name = '+Toggle',
   ['c'] = {':setlocal cursorcolumn!'                     , 'Cursor Column'},
   ['d'] = {':set background=dark'                   , 'Dark  Background'},
   ['i'] = {':IndentLinesToggle'                     , 'Indent Lines'},
   ['l'] = {':set background=light'                  , 'Light Background'},
   ['L'] = {':setlocal cursorline!'                       , 'Cursor Line'},
   ['n'] = {':setlocal nonumber!'                         , 'Line Numbers'},
   ['r'] = {':setlocal norelativenumber!'                 , 'Relative Numbers'},
   ['R'] = {':syntax on'                             , 'Reset Colors (syntax on)'},
   ['t'] = {':Vista!!'                               , 'Tag Viewer'},
   ['T'] = {':hi Normal ctermbg=NONE guibg=NONE<CR>' , 'Transparent Background'},
   ['p'] = {':RainbowToggle'                         , 'Color Parenthesis'},
   ['w'] = {':setlocal wrap!'                             , 'Wrap'},
   ['z'] = {':Goyo! 70%x90%'                                  , 'Zen Mode'}
}

-- ==========================================
-- Window layer =============================
-- ==========================================
which_key_map['w'] = {
   name = '+Window',
   ['h'] = {'<C-W>H', 'Move Left'},
   ['j'] = {'<C-W>J', 'Move Down'},
   ['k'] = {'<C-W>K', 'Move Up'},
   ['l'] = {'<C-W>L', 'Move Right'},
}
-- ==========================================
-- Scratch layer ============================
-- ==========================================
-- nnoremap <leader>xn :Scratch<cr>:w !node<cr>
map('n', '<leader>xn', ':Scratch<CR>:w !node<CR>', {noremap=true,silent=true})
which_key_map['x'] ={
   name = '+Scratch',
   ['c'] = {':ScratchSelection'    , 'Copy To Scratch Buffer'},
   ['C'] = {':ScratchSelection!'   , 'Copy To Clean Scratch Buffer'},
   ['n'] = 'Run on node',
   ['v'] = {':ScratchPreview'      , 'View Scratch Buffer'},
   ['x'] = {':Scratch'             , 'Open Scrach Buffer'},
   ['X'] = {':Scratch!'            , 'Open Clean Scrach Buffer'}
}
-- =======================================
-- Hide status line on which key
vim.cmd([[
    autocmd! FileType which_key
    autocmd  FileType which_key set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
]])

-- vim.fn['which_key#register']('<Space>', 'g:which_key_map')
vim.fn['which_key#register']('<Space>', which_key_map)

-- " Map local leader to which kwy
-- nnoremap <silent> <localleader> :<c-u>WhichKey  '-'<CR>
