return {
  name = '>> Debug <<',
  ['b'] = { '<cmd>DapToggleBreakpoint<CR>', 'Toggle breakpoint' },
  ['c'] = { '<cmd>DapContinue<CR>', 'Continue' },
  ['u'] = {
    function()
      require('dapui').toggle()
    end,
    'UI toggle',
  },
  ['e'] = {
    function()
      require('dapui').eval()
    end,
    'Eval',
  },
}
