local M = {}

M.setup = function(bufnr)
  local status_ok, wk = pcall(require, 'which-key')
  if not status_ok then
    return
  end

  local leader_keys = {
    -- ['k'] = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Show hover' },
    ['k'] = {
      '<cmd>lua vim.lsp.buf.signature_help()<CR>',
      'Show hover',
    },
    ['l'] = {
      name = '>> LSP <<',
      -- ['A'] = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'lsp code action' },
      ['a'] = { '<cmd>Lspsaga code_action<CR>', 'lsp code action' },
      -- ['a'] = {
      --   '<cmd>Telescope lsp_code_actions<CR>',
      --   'telescope code action',
      -- },
      ['d'] = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Goto Definition' },
      ['D'] = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Goto declaration' },
      ['f'] = { '<cmd>lua require("conform").format()<CR><escape>', 'format' },
      ['F'] = { '<cmd>Lspsaga finder<CR>', 'Finder' },
      ['l'] = {
        '<cmd>lua require("user.functions").lineDiagnostics()<CR>',
        'line diagnostic',
      },
      -- ['f'] = { '<cmd>lua vim.lsp.buf.formatting_sync(nil,1000)<CR>', 'Format'},
      ['R'] = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Goto references' },
      ['r'] = {
        '<cmd>lua vim.lsp.buf.rename()<CR>',
        'Rename symbol projectwise',
      },
      ['I'] = {
        '<cmd>lua vim.lsp.buf.implementation()<CR>',
        'Goto Implementation',
      },
      ['p'] = {
        "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
        'Peak Definition',
      },
      ['s'] = {
        '<cmd>lua vim.lsp.buf.signature_help()<CR>',
        'show signature help',
      },
      -- ['p'] = {
      --   "<cmd>lua require'lsp.peek'.Peek('definition')<CR>",
      --   'Peek definition',
      -- },
      -- ['l'] = {
      --   "<cmd>lua require'lsp.handlers'.show_line_diagnostics()<CR>",
      --   'Show line diagnostics',
      -- },
      ['t'] = { '<cmd>TroubleToggle<CR>', 'Trouble' },
    },
  }

  local keys = {
    ['gd'] = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Goto Definition' },
    ['gD'] = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Goto declaration' },
    ['gr'] = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Goto references' },
    ['gI'] = {
      '<cmd>lua vim.lsp.buf.implementation()<CR>',
      'Goto Implementation',
    },
    ['gp'] = {
      "<cmd>Lspsaga peek_definition<CR>",
      'Peak Definition',
    },
    ['gs'] = {
      '<cmd>lua vim.lsp.buf.signature_help()<CR>',
      'show signature help',
    },
    -- TODO: this fucks up gv for go visual
    -- ['gvd'] = { '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>', 'Goto Definition' },
    -- ['gp'] =key {
    --   "<cmd>lua require'lsp.peek'.Peek('definition')<CR>",
    --   'Peek definition',
    -- },
  }

  local common_opts = {
    mode = 'n', -- NORMAL mode
    buffer = bufnr, -- buffer number
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  wk.register(keys, common_opts)

  common_opts.prefix = '<leader>'

  wk.register(leader_keys, common_opts)

  -- local visual_options = common_opts
  -- visual_options.mode = 'v'

  -- wk.register(visual_keys, visual_options)
end

return M
