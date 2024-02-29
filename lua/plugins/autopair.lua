return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    require('nvim-autopairs').setup({
      disable_filetype = { 'TelescopePrompt' },
      ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], '%s+', ''),
      enable_moveright = true,
      enable_afterquote = true, -- add bracket pairs after quote
      enable_check_bracket_line = true, --- check bracket in same line
      check_ts = false,
    })
    local cmp_ok, cmp = pcall(require, 'cmp')
    if cmp_ok then
      -- If you want insert `(` after select function or method item
      --
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')

      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
  end,
}
