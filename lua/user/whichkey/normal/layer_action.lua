return {
  name = '>> Actions <<',
  key = 'a',
  keymaps = {
    { 's', '<cmd>set hls!<CR>', 'Remove Search Highlights' },
    { 'c', '<cmd>setlocal cursorcolumn!<CR>', 'Cursor Column' },
    {
      'E',
      '<cmd>lua require"user.functions".toggleLinter()<CR>',
      'Toggle Linter',
    },
    {
      'f',
      '<cmd>lua require"user.functions".toggleFormatOnSave()<CR>',
      'Toggle Formatter on Save',
    },
    { 'i', '<cmd>IBLToggle<CR>', 'Indent Lines' },
    {
      'k',
      '<cmd>lua require"user.functions".toggleLineDiagnostics()<CR>',
      'Toggle Line Diagnostics',
    },
    { 'L', '<cmd>set cursorline!<CR>', 'Cursor Line' },
    { 'n', '<cmd>set nonumber!<CR>', 'Line Numbers' },
    { 'r', '<cmd>set norelativenumber!<CR>', 'Relative Numbers' },
    { 't', '<cmd>Lspsaga outline<CR>', 'Symbol explorer' },
    { 'w', '<cmd>setlocal wrap!<CR>', 'Wrap' },
    {
      'W',
      '<cmd>lua require"user.functions".toggleTrimWhitespace()<CR>',
      'Toggle Trim Whitespace',
    },
  },
}
