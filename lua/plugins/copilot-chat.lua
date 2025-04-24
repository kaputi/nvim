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
      model = 'gpt-4o',
      window = {
        layout = 'float',
      },
    })
  end,
}
