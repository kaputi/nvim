return {
  'yetone/avante.nvim',

  build = 'make',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  config = function()
    local ok, anthropic_api_key = pcall(require, 'secrets')
    if not ok then
      vim.notify(
        'Avante: anthropic_api_key not found in secrets.lua',
        vim.log.levels.ERROR
      )
      anthropic_api_key = ''
    end

    require('avante').setup({
      -- Mode: 'legacy' shows suggestions in sidebar only, apply manually with 'a'/'A'
      --       'agentic' is more autonomous, may show inline diffs automatically
      mode = 'legacy',
      -- mode = 'agentic',
      instructions_file = 'avante.md',
      provider = 'claude',

      providers = {
        claude = {
          api_key_name = 'cmd:echo ' .. anthropic_api_key, -- or whatever key name you use
        },
      },

      hints = {
        enabled = false,
      },

      mappings = {
        --   --- @class AvanteConflictMappings
        diff = {
          ours = 'co',
          theirs = 'ct',
          all_theirs = 'ca',
          both = 'cb',
          cursor = 'cc',
          next = ']x',
          prev = '[x',
        },
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
          apply_all = 'A',
          apply_cursor = 'a',
          --     retry_user_request = 'r',
          --     edit_user_request = 'e',
          --     switch_windows = '<Tab>',
          --     reverse_switch_windows = '<S-Tab>',
          remove_file = 'd',
          add_file = '@',
          close = { 'q' },
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

      windows = {
        ---@type "right" | "left" | "top" | "bottom"
        position = 'right', -- the position of the sidebar
        wrap = true, -- similar to vim.o.wrap
        width = 30, -- default % based on available width
        sidebar_header = {
          enabled = true, -- true, false to enable/disable the header
          align = 'center', -- left, center, right for title
          rounded = true,
        },
        input = {
          prefix = '> ',
          height = 8, -- Height of the input window in vertical layout
        },
        edit = {
          border = 'rounded',
          start_insert = true, -- Start insert mode when opening the edit window
        },
        ask = {
          floating = false, -- Open the 'AvanteAsk' prompt in a floating window
          start_insert = true, -- Start insert mode when opening the ask window
          border = 'rounded',
          ---@type "ours" | "theirs"
          focus_on_apply = 'ours', -- which diff to focus after applying
        },
      },

      shortcuts = {
        {
          name = 'tests',
          description = 'Generate tests for the current code',
          prompt = 'Please generate tests for my code.',
        },
        {
          name = 'document',
          description = 'Generate documentation for the current code',
          prompt = 'Please add documentation comments to the selected code.',
        },
        {
          name = 'optimize',
          description = 'Optimize the current code',
          prompt = 'Optimize the selected code to improve performance and readability. Explain your optimization strategy and the benefits of your changes.',
        },
        {
          name = 'fix',
          description = 'Fix the current code',
          prompt = 'There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems.',
        },
        {
          name = 'review',
          description = 'Review the current code',
          prompt = [[
You are a code reviewer focused on improving code quality and maintainability.

Format each issue you find precisely as:
line=<line_number>: <issue_description>
OR
line=<start_line>-<end_line>: <issue_description>

Check for:
- Unclear or non-conventional naming
- Comment quality (missing or unnecessary)
- Complex expressions needing simplification
- Deep nesting or complex control flow
- Inconsistent style or formatting
- Code duplication or redundancy
- Potential performance issues
- Error handling gaps
- Security concerns
- Breaking of SOLID principles

Multiple issues on one line should be separated by semicolons.
End with: "**`To clear buffer highlights, please ask a different question.`**"

If no issues found, confirm the code is well-written and explain why.

Review the selected code.
        ]],
        },
        {
          name = 'explain',
          description = 'Explain the current code',
          prompt = [[
You are a programming instructor focused on clear, practical explanations.

When explaining code:
- Provide concise high-level overview first
- Highlight non-obvious implementation details
- Identify patterns and programming principles
- Address any existing diagnostics or warnings
- Focus on complex parts rather than basic syntax
- Use short paragraphs with clear structure
- Mention performance considerations where relevant

Write anexplanation for the selected code as paragraphs of text.
]],
        },
      },
    })
  end,
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
