return {
  'jake-stewart/diff.nvim',
  cmd = 'Diff',
  opts = {
    -- show a unified diff (single pane)
    unified = false,

    -- either "tab", "above", "below", "left", or "right"
    position = 'below',

    -- show the cursorline within the diff windows
    cursorline = false,
  },
}
