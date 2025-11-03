return {
  'CopilotC-Nvim/CopilotChat.nvim',
  branch = 'main',
  dependencies = {
    { 'zbirenbaum/copilot.lua' },
    { 'nvim-lua/plenary.nvim' },
  },
  build = 'make tiktoken', -- Only on MacOS or Linux
  config = function()
    require('CopilotChat').setup({
      model = 'gpt-4o',
      window = {
        -- layout = 'float',
        -- layout = 'horizontal',
        layout = 'vertical',
        width = 0.3,
      },

      -- highlight_headers = false,
      -- separator = '---',
      -- error_header = '> [!ERROR] Error',
      -- question_header = '# ', -- Header to use for user questions
      -- answer_header = '# ', -- Header to use for AI answers

      chat_autocomplete = true,

      headers = {
        user = ' You',
        assistant = '#  Copilot',
        tool = 'Tool',
      },
      separator = '━━',

      insert_at_end = false,

      mappings = {
        complete = {
          insert = '<Tab>',
        },
        close = {
          normal = 'q',
          -- insert = '<C-c>',
        },
        reset = {
          normal = '<S-l>',
          -- insert = '<S-l>',
        },
        submit_prompt = {
          normal = '<CR>',
          -- insert = '<C-s>',
        },
        toggle_sticky = {
          normal = 'grr',
        },
        clear_stickies = {
          normal = 'grx',
        },
        accept_diff = {
          normal = '<C-y>',
          -- insert = '<C-y>',
        },
        jump_to_diff = {
          normal = 'gj',
        },
        quickfix_answers = {
          normal = 'gqa',
        },
        quickfix_diffs = {
          normal = 'gqd',
        },
        yank_diff = {
          normal = 'gy',
          register = '"', -- Default register to use for yanking
        },
        show_diff = {
          normal = 'gd',
          full_diff = false, -- Show full diff instead of unified diff when showing diff window
        },
        show_info = {
          normal = 'gi',
        },
        show_context = {
          normal = 'gc',
        },
        show_help = {
          normal = 'gh',
        },
      },
    })
  end,
}
