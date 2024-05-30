return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dapui.setup()

    -- setup signs ---------------------------------------------
    local dapSigns = {
      { name = 'DapBreakpoint', text = ' ' },
      { name = 'DapLogPoint', text = ' ' },
      { name = 'DapStopped', text = '⏸' },
      { name = 'DapBreakpointRejected', text = '󰜺 ' },
      { name = 'DapBreakpointCondition', text = ' ' },
    }

    for _, sign in ipairs(dapSigns) do
      vim.fn.sign_define(sign.name, {
        text = sign.text,
        texthl = '',
        linehl = '',
        numhl = 'DiagnosticError',
      })
    end

    -- auto open the ui ---------------------------------------------
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- setup adapters ---------------------------------------------
    -- go is easy because of package
    require('dap-go').setup()
    -- dap.configurations.go = {
    --   {
    --     type = 'go',
    --     name = 'Debug',
    --     request = 'launch',
    --     program = '${file}',
    --   },
    -- }
    -- dap.adapters.go = {
    --   type = 'server',
    --   port = '38697',
    --   executalbe = {
    --     command = 'dlv',
    --     args = { 'dap', '-l', '127.0.0.1:38697' },
    --   },
    -- }
  end,
}
