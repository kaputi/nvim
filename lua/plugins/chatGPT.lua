return {
  'jackMort/ChatGPT.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('chatgpt').setup({
      -- TODO: move to a safe place
      api_key_cmd = 'lua '
        .. vim.loop.os_homedir()
        .. '/.config/tv2/openai_api_key.lua',

      chat = {
        question_sign = '', -- 🙂
        answer_sign = '🤖', -- 🤖
      },
      openai_params = {
        model = 'gpt-4-turbo-preview',
        max_tokens = 2000,
      },
      openai_edit_params = {
        model = 'gpt-4-turbo-preview',
      },
      show_quickfixes_cmd = 'Trouble quickfix',
      predefined_chat_gpt_prompts = 'https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv',
    })
  end,
}
