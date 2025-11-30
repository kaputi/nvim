return {
  name = '>> Copilot Chat <<',
  key = 'C',
  keymaps = {
    -- { 'a', '<cmd>CopilotChatAgent<CR>', 'Select Agent' },
    -- {
    --   'b',
    --   '<cmd>lua require("user.functions").copilotBufferAsk()<CR>',
    --   'Toggle Chat',
    -- },
    -- { 'c', '<cmd>CopilotChatOpen<CR>', 'Open Chat' },
    -- { 'l', '<cmd>CopilotChatLoad<CR>', 'Load Chat' },
    -- { 'm', '<cmd>CopilotChatModel<CR>', 'Select Model' },
    -- { 'p', '<cmd>CopilotChatPrompt<CR>', 'Select Prompt' },
    -- { 's', '<cmd>CopilotChatSave<CR>', 'Save Chat' },
    -- { 'R', '<cmd>CopilotChatReset<CR>', 'Reset Chat' },
    ----------------------------------------------------------------------------
    { 'h', '<cmd>AvanteHistory<CR>', 'Chat History' },
    { 'c', '<cmd>AvanteChat<CR>', 'Open Chat' },
    { 'C', '<cmd>AvanteClear<CR>', 'Clear Chat' },
    { 'm', '<cmd>AvanteModels<CR>', 'Select Model' },
    { 'p', '<cmd>AvanteSwitchProvider<CR>', 'Change Provider' },
    { 'n', '<cmd>AvanteChatNew<CR>', 'New Chat Session' },
    { 'S', '<cmd>AvanteStop<CR>', 'Stop current req' },
  },
}
