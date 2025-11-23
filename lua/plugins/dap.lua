return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
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

    dap.listeners.after.event_initialized['dapui'] = function()
      dapui.open()
    end

    dap.listeners.after.event_stopped['dapui'] = function()
      dapui.open()
      vim.cmd('stopinsert!') -- optionally exit insert mode
    end

    -- dap.listeners.after.event_continued['dapui'] = function()
    --   dapui.close()
    -- end

    dap.listeners.after.event_terminated['dapui'] = function()
      dapui.close()
    end

    -- setup adapters ---------------------------------------------
    -- go is easy because of package
    require('dap-go').setup()
    -- NODE

    -- local js_debug_pkg = mason_registry.get_package('js-debug')
    -- -- local js_debug_path = js_debug_pkg:get_install_path()
    -- --   .. '/js-debug/src/dapDebugServer.js'
    -- print(vim.inspect(js_debug_pkg))

    local js_debug_path =
      '/home/eduardo/.local/share/tv2/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js'

    if not dap.adapters['pwa-node'] then
      dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'node',
          args = { js_debug_path, '${port}' },
        },
      }
    end

    local js_filetypes = {
      'typescript',
      'javascript',
      'typescriptreact',
      'javascriptreact',
    }

    for _, lang in ipairs(js_filetypes) do
      if not dap.configurations[lang] then
        dap.configurations[lang] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch File',
            program = '${file}',
            cwd = '${workspaceFolder}',
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach to Node app',
            address = 'localhost',
            port = 9229,
            cwd = '${workspaceFolder}',
            restart = true,
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach to Electron Main',
            address = 'localhost',
            port = 9229,
            stopOnEntry = false,
            skipFiles = {
              -- '<node_internals>/**',
              -- '/node_modules/**',
              -- '**/default_app.asar/**',
            },
            -- restart = false,
            -- smartStep = true,
            sourceMaps = true,
            outFiles = { '${workspaceFolder}/.vite/build/**/*.js' },
            resolveSourceMapLocations = {
              '${workspaceFolder}/.vite/build/**/*.js',
              '${workspaceFolder}/src/**/*.ts',
              '!**/node_modules/**',
            },
            sourceMapPathOverrides = {
              ['webpack:///./~/*'] = '${workspaceFolder}/node_modules/*',
              ['webpack:///*'] = '${workspaceFolder}/*',
              ['file:///*'] = '${workspaceFolder}/*',
              ['*'] = '${workspaceFolder}/*',

              ['webpack:///@/*'] = '${workspaceFolder}/src/*',
              ['webpack:///src/*'] = '${workspaceFolder}/src/*',
              ['webpack:///@types/*'] = '${workspaceFolder}/@types/*',
            },
          },
        }
      end
    end

    dap.set_log_level('TRACE')
  end,
}
