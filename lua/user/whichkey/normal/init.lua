return {
  ['/'] = { 'viwy/<C-r>"<CR>', 'Find under cursor' },
  ['='] = { '<C-w>=', 'Balance Windows' },
  [','] = { '<cmd>Telescope buffers initial_mode=normal<CR>', 'Buffer List' },
  [' '] = { '<cmd>Telescope find_files<CR>', 'Files' },
  ['d'] = { '<cmd>Bdelete<CR>', 'Delete Buffer' },
  -- ['D'] = { '<cmd>Neogen<CR>', 'Create Docs' },
  ['e'] = { '<cmd>Neotree reveal toggle<CR>', 'File Explorer' },
  ['E'] = { '<cmd>Neotree toggle<CR>', 'File Explorer' },
  ['h'] = {
    '<cmd>split | Telescope buffers initial_mode=normal<CR>',
    'Horizontal Split',
  },
  ['M'] = { '<cmd>delmarks A-Z0-9<CR>', 'Delete all marks' },
  ['n'] = { '<cmd>bn<CR>', 'next buffer' },
  ['o'] = {
    '<cmd>call append(line("."),   repeat([""], v:count1))<CR>',
    'Line Below',
  },
  ['O'] = {
    '<cmd>call append(line(".")-1,   repeat([""], v:count1))<CR>',
    'Line Above',
  },
  ['P'] = { '<cmd>Telescope commands<CR>', 'Commands' },
  ['q'] = { '<cmd>q<CR>', 'Quit' },
  ['Q'] = { '<cmd>qa!<CR>', 'Quit All!!' },
  ['u'] = { '<cmd>UndotreeToggle<CR>', 'Undo tree' },
  ['v'] = {
    '<cmd>vsplit | Telescope buffers initial_mode=normal<CR>',
    'Vertical Split',
  },
  ['V'] = { '<cmd>diffthis<CR>', 'Diff this' },
  ['y'] = { '<cmd>Telescope registers<CR>', 'Yank List' },

  -- Layers

  ['<tab>'] = require('user.whichkey.normal.layer_tab'),
  ['a'] = require('user.whichkey.normal.layer_action'),
  ['b'] = require('user.whichkey.normal.layer_buffer'),
  ['c'] = require('user.whichkey.normal.layer_copilot'),
  ['C'] = require('user.whichkey.normal.layer_copilotChat'),
  ['D'] = require('user.whichkey.normal.layer_dap'),
  ['f'] = require('user.whichkey.normal.layer_file'),
  ['g'] = require('user.whichkey.normal.layer_git'),
  -- NOTE: this adds functionality outside lsp, but kinda the same. for example formatter
  ['l'] = require('user.whichkey.normal.layer_lsp'),
  ['R'] = require('user.whichkey.normal.layer_replace'),
  ['s'] = require('user.whichkey.normal.layer_search'),
  ['W'] = require('user.whichkey.normal.layer_window'),
}
