return {
  'ray-x/lsp_signature.nvim',
  enabled = false,
  config = function()
    require('lsp_signature').setup({
      doc_lines = 15, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
      -- set to 0 if you DO NOT want any API comments be shown
      -- This setting only take effect in insert mode, it does not affect signature help in normal
      -- mode, 10 by default

      max_height = 20, -- max height of signature floating_window, if content is more than max_height, you can scroll down
      -- to view the hiding contents
      max_width = 200, -- max_width of signature floating_window, line will be wrapped if exceed max_width

      floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
      floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
      -- will set to true when fully tested, set to false will use whichever side has more space
      -- this setting will be helpful if you do not want the PUM and floating win overlap

      floating_window_off_x = 1, -- adjust float windows x position.
      floating_window_off_y = 1, -- adjust float windows y position.

      hint_prefix = '󰆚 ', -- Panda for parameter
      hint_scheme = 'String',
      handler_opts = {
        border = 'none', -- double, rounded, single, shadow, none, or a table of borders
      },
    })
  end,
}
