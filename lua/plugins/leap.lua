return {
  'ggandor/leap.nvim',
  config = function()
    local leap = require('leap')

    leap.opts.case_sensitive = false
    leap.opts.equivalence_classes = { ' \t\r\n' }
    -- leap.opts.max_phase_one_targets = nil
    -- leap.opts.highlight_unlabeled_phase_one_targets = false
    -- leap.opts.max_highlighted_traversal_targets = 10
    -- leap.opts.substitute_chars = {}
    -- leap.opts.safe_labels = 'sfnut/SFNLHMUGTZ?'
    -- leap.opts.labels = 'sfnjklhodweimbuyvrgtaqpcxz/SFNJKLHODWEIMBUYVRGTAQPCXZ?'
    -- leap.opts.special_keys = {
    --   next_target = '<enter>',
    --   prev_target = '<tab>',
    --   next_group = '<space>',
    --   prev_group = '<tab>',
    -- }

    -- leap.create_default_mappings()
    leap.opts.special_keys.prev_target = '<bs>'
    leap.opts.special_keys.prev_group = '<bs>'

    require('leap.user').set_repeat_keys('<cr>', '<bs>')
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap-forward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', '<Plug>(leap-backward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')

    vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { bg = 'NONE', fg = '#ff0000' })
    vim.api.nvim_set_hl(
      0,
      'LeapLabelSecondary',
      { bg = 'NONE', fg = '#ffff00' }
    )
    vim.api.nvim_set_hl(0, 'LeapLabelSelected', { bg = 'NONE', fg = '#00ffff' })
  end,
}
