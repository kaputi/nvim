local M = {}
M.setup = function(wk)
  local NonLayerKeys = {
    { '/', 'viwy/<C-r>"<CR>', 'Find under cursor' },

    { '/', 'viwy/<C-r>"<CR>', 'Find under cursor' },

    { '=', '<C-w>=', 'Balance Windows' },
    { ',', '<cmd>Telescope buffers initial_mode=normal<CR>', 'Buffer List' },
    { ' ', '<cmd>TelescopeFindFiles<CR>', 'Files' },
    { 'd', '<cmd>Bdelete<CR>', 'Delete Buffer' },
    { 'e', '<cmd>Neotree reveal toggle<CR>', 'File Explorer (current file)' },
    { 'E', '<cmd>Neotree toggle<CR>', 'File Explorer' },
    {
      'h',
      '<cmd>split | Telescope buffers initial_mode=normal<CR>',
      'Horizontal Split',
    },
    { 'j', 'gnn', 'Start text object selection' },
    {
      'm',
      '<cmd>lua require"user.functions".runSilentMacro()<CR>',
      'Run macro silenty (promtp for macro)',
    },
    { 'M', '<cmd>delmarks A-Z0-9<CR>', 'Delete all marks' },
    { 'n', '<cmd>bn<CR>', 'next buffer' },
    {
      'o',
      '<cmd>call append(line("."),   repeat([""], v:count1))<CR>',
      'Line Below',
    },
    {
      'O',
      '<cmd>call append(line(".")-1,   repeat([""], v:count1))<CR>',
      'Line Above',
    },
    { 'P', '<cmd>Telescope commands<CR>', 'Commands' },
    { 'q', '<cmd>q<CR>', 'Quit' },
    { 'Q', '<cmd>qa!<CR>', 'Quit All!!' },
    { 'u', '<cmd>Telescope undo<CR>', 'Undo tree' },
    {
      'v',
      '<cmd>vsplit | Telescope buffers initial_mode=normal<CR>',
      'Vertical Split',
    },
    { 'V', '<cmd>diffthis<CR>', 'Diff this' },
    { 'y', '<cmd>Telescope registers<CR>', 'Yank List' },
  }

  for _, mapping in ipairs(NonLayerKeys) do
    vim.keymap.set(
      'n',
      '<leader>' .. mapping[1],
      mapping[2],
      { desc = mapping[3] }
    )
  end

  -- Layer
  local dashboard = require('user.whichkey.normal.layer_dashboard')
  local action = require('user.whichkey.normal.layer_action')
  local buffer = require('user.whichkey.normal.layer_buffer')
  -- local copilot = require('user.whichkey.normal.layer_copilot')
  -- local copilotChat = require('user.whichkey.normal.layer_copilotChat')
  local dap = require('user.whichkey.normal.layer_dap')
  local git = require('user.whichkey.normal.layer_git')
  local lsp = require('user.whichkey.normal.layer_lsp')
  local replace = require('user.whichkey.normal.layer_replace')
  local search = require('user.whichkey.normal.layer_search')

  local layers = {
    dashboard,
    action,
    buffer,
    -- copilot,
    -- copilotChat,
    dap,
    git,
    lsp,
    replace,
    search,
  }

  for _, layer in ipairs(layers) do
    require('user.whichkey.utils').registerLayer(wk, layer, 'n')
  end
end

return M
