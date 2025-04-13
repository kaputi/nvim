return {
  'CopilotC-Nvim/CopilotChat.nvim',
  branch = 'main',
  dependencies = {
    { 'zbirenbaum/copilot.lua' },
    { 'nvim-lua/plenary.nvim' },
  },
  -- build = 'make tiktoken', -- Only on MacOS or Linux
  config = function()
    require('CopilotChat').setup({
      window = {
        layout = 'float',
      },
    })
  end,
}
