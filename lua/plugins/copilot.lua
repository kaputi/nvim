return {
  enabled = false, 
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  dependencies = {
    'copilotlsp-nvim/copilot-lsp',
  },
  config = function()
    require('copilot').setup({
      panel = {
        enabled = false,
        auto_refresh = false,
        keymap = {
          --   jump_prev = '[[',
          --   jump_next = ']]',
          --   accept = '<CR>',
          --   refresh = 'gr',
          -- open = '<M-CR>',
        },
        -- layout = {
        --   position = 'bottom', -- | top | left | right
        --   ratio = 0.4,
        -- },
      },
      suggestion = {
        enabled = false,
        auto_trigger = true,
        debounce = 75,
        accept = false, -- disable buil-in keymapping
        keymap = {
          accept = '<M-l>',
          --   accept_word = false,
          --   accept_line = false,
          next = '<M-]>',
          prev = '<M-[>',
          --   dismiss = '<C-]>',
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = false,
      },

      nes = {
        enabled = true, -- requires copilot-lsp as a dependency
        auto_trigger = true,
        keymap = {
          accept_and_goto = false,
          accept = '<leader>c<CR>',
          dismiss = '<leader>c<BS>',
          -- accept = 'false',
          -- dismiss = 'false',
        },
      },
    })

    local wk_ok, wk = pcall(require, 'which-key')
    if wk_ok then
      wk.register({
        --   ['<leader>c'] = {
        --     name = 'Copilot',
        --     r = { '<cmd>Copilot panel<cr>', 'Open Copilot Panel' },
        --   },
        ['<leader>c<CR>'] = { 'Accept Copilot Suggestion', mode = 'n' },
        ['<leader>c<BS>'] = { 'Dismiss Copilot Suggestion', mode = 'n' },
      })
    end

    -- local cmp_ok, cmp = pcall(require, 'cmp')
    -- if not cmp_ok then
    --   return
    -- end
    -- cmp.event:on('menu_opened', function()
    --   vim.b.copilot_suggestion_hidden = true
    -- end)

    -- cmp.event:on('menu_closed', function()
    --   vim.b.copilot_suggestion_hidden = false
    -- end)
  end,
}
