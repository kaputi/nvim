return {
  'yetone/avante.nvim',

  -- enabled = false,
  build = 'make',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    mode = 'legacy',
    instructions_file = 'avante.md',
    provider = 'copilot',

    hints = {
      enabled = false,
    },

    mappings = {
      --   --- @class AvanteConflictMappings
      --   diff = {
      --     ours = 'co',
      --     theirs = 'ct',
      --     all_theirs = 'ca',
      --     both = 'cb',
      --     cursor = 'cc',
      --     next = ']x',
      --     prev = '[x',
      --   },
      --   suggestion = {
      --     accept = '<M-l>',
      --     next = '<M-]>',
      --     prev = '<M-[>',
      --     dismiss = '<C-]>',
      --   },
      --   jump = {
      --     next = ']]',
      --     prev = '[[',
      --   },
      submit = {
        normal = '<CR>',
        insert = '<C-s>',
      },
      cancel = {
        normal = { '<C-c>', '<Esc>', 'q' },
        insert = { '<C-c>' },
      },
      sidebar = {
        --     apply_all = 'A',
        --     apply_cursor = 'a',
        --     retry_user_request = 'r',
        --     edit_user_request = 'e',
        --     switch_windows = '<Tab>',
        --     reverse_switch_windows = '<S-Tab>',
        remove_file = 'd',
        add_file = '@',
        close = { '<Esc>', 'q' },
        --     close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
      },
    },

    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = false,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
      minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
      enable_token_counting = true, -- Whether to enable token counting. Default to true.
      auto_add_current_file = false, -- Whether to automatically add the current file when opening a new chat. Default to true.
      auto_approve_tool_permissions = false, -- Default: auto-approve all tools (no prompts)
      -- Examples:
      -- auto_approve_tool_permissions = false,                -- Show permission prompts for all tools
      -- auto_approve_tool_permissions = {"bash", "str_replace"}, -- Auto-approve specific tools only
      ---@type "popup" | "inline_buttons"
      confirmation_ui_style = 'popup',
      --- Whether to automatically open files and navigate to lines when ACP agent makes edits
      ---@type boolean
      acp_follow_agent_locations = true,
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'stevearc/dressing.nvim', -- for input provider dressing
    'folke/snacks.nvim', -- for input provider snacks
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  },
}
