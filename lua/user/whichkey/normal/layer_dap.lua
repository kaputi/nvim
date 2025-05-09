return {
  name = '>> Debug <<',
  ['b'] = { '<cmd>DapToggleBreakpoint<CR>', 'Toggle breakpoint' },
  ['c'] = { '<cmd>DapContinue<CR>', 'Continue' },
  ['u'] = {
    function()
      local widgets = require('dap.ui.widgets')
      local sidebar = widgets.sidebar(widgets.scopes)
      sidebar.open()
    end,
    'Sidebar open',
  },
}
