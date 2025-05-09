return {
  'chentoast/marks.nvim',
  event = 'VeryLazy',
  config = function()
    require('marks').setup({
      -- default_mappings = false,
      -- mappings = {
      --   -- set_next = 'm,',
      --   -- next = 'm]',
      --   preview = 'm:',
      --   set_bookmark0 = 'm0',
      --   prev = false, -- pass false to disable only this default mapping
      -- },
      bookmark_0 = { sign = '⚑', annotate = true },
      bookmark_1 = { sign = '⚑', annotate = true },
      bookmark_2 = { sign = '⚑', annotate = true },
    })

  end,
}
