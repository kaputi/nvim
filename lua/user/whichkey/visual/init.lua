return {
  ['r'] = { '"_d"*p', 'Replace Selection with register' },
  -- ['/'] = {'y/V<C-R>=escape(@",'/')<CR><CR>', 'Find selection.'},
  ['/'] = {
    '<escape><cmd>lua require"user.functions".findSelectedText()<CR>',
    'Find selection.',
  },

  -- Layers
  ['l'] = require('user.whichkey.visual.layer_lsp'),
  ['C'] = require('user.whichkey.visual.layer_copilot'),
}
