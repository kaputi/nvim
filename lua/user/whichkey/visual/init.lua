local M = {}

M.setup = function(wk)
  local NonLayerKeys = {
    {
      'j',
      'grc',
      'increment selection scope',
    },
    {
      'J',
      'grn',
      'increment selection node',
    },
    {
      'k',
      ' grm ',
      'decrement selection node',
    },
    { 'r', '"_d"*p', 'Replace Selection with register' },
    -- {'/','y/V<C-R>=escape(@",'/')<CR><CR>', 'Find selection.'},
    {
      '/',
      '<escape><cmd>lua require"user.functions".findSelectedText()<CR>',
      'Find selection.',
    },
  }

  for _, mapping in ipairs(NonLayerKeys) do
    vim.keymap.set(
      'v',
      '<leader>' .. mapping[1],
      mapping[2],
      { desc = mapping[3] }
    )
  end

  local lsp = require('user.whichkey.visual.layer_lsp')
  local copilot = require('user.whichkey.visual.layer_copilot')

  local layers = {
    lsp,
    copilot,
  }

  for _, layer in ipairs(layers) do
    require('user.whichkey.utils').registerLayer(wk, layer, 'v')
  end
end

return M
