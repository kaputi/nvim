local M = {}

M.setup = function(client, bufnr)
  local status_ok, wk = pcall(require, 'which-key')
  if not status_ok then
    return
  end

  vim.keymap.set(
    'n',
    '<leader>k',
    '<cmd>Lspsaga hover_doc<CR>',
    { buffer = bufnr, desc = 'Signature Help' }
  )

  vim.keymap.set(
    'n',
    '<leader>K',
    '<cmd>Lspsaga peek_type_definition<CR>',
    { buffer = bufnr, desc = 'Peak type definition' }
  )

  -- Define LSP group name for <leader>l prefix only
  wk.register({
    l = { name = '>> LSP <<' },
  }, {
    mode = 'n',
    buffer = bufnr,
    prefix = '<leader>',
    silent = true,
    noremap = true,
    nowait = true,
  })

  -- Non-leader LSP mappings (gd, gD, etc.)
  vim.keymap.set(
    'n',
    'gd',
    '<cmd>lua vim.lsp.buf.definition()<CR>',
    { buffer = bufnr, desc = 'Goto Definition' }
  )
  vim.keymap.set(
    'n',
    'gD',
    '<cmd>lua vim.lsp.buf.declaration()<CR>',
    { buffer = bufnr, desc = 'Goto declaration' }
  )
  vim.keymap.set(
    'n',
    'gr',
    '<cmd>lua vim.lsp.buf.references()<CR>',
    { buffer = bufnr, desc = 'Goto references' }
  )
  vim.keymap.set(
    'n',
    'gI',
    '<cmd>lua vim.lsp.buf.implementation()<CR>',
    { buffer = bufnr, desc = 'Goto Implementation' }
  )
  vim.keymap.set(
    'n',
    'gp',
    '<cmd>Lspsaga peek_definition<CR>',
    { buffer = bufnr, desc = 'Peak Definition' }
  )
  vim.keymap.set(
    'n',
    'gs',
    '<cmd>Lspsaga hover_doc<CR>',
    { buffer = bufnr, desc = 'Signature Help' }
  )

  -- Leader LSP mappings
  vim.keymap.set(
    'n',
    '<leader>lk',
    '<cmd>Lspsaga hover_doc<CR>',
    { buffer = bufnr, desc = 'Signature Help' }
  )
  vim.keymap.set(
    'n',
    '<leader>la',
    '<cmd>Lspsaga code_action<CR>',
    { buffer = bufnr, desc = 'lsp code action' }
  )
  vim.keymap.set(
    'n',
    '<leader>ld',
    '<cmd>lua vim.lsp.buf.definition()<CR>',
    { buffer = bufnr, desc = 'Goto Definition' }
  )
  vim.keymap.set(
    'n',
    '<leader>lD',
    '<cmd>lua vim.lsp.buf.declaration()<CR>',
    { buffer = bufnr, desc = 'Goto declaration' }
  )
  vim.keymap.set(
    'n',
    '<leader>lF',
    '<cmd>Lspsaga finder<CR>',
    { buffer = bufnr, desc = 'Finder' }
  )
  vim.keymap.set(
    'n',
    '<leader>lh',
    '<cmd>lua require"user.functions".toggleInlayHints()<CR>',
    { buffer = bufnr, desc = 'Toggle Inlay Hints' }
  )
  vim.keymap.set(
    'n',
    '<leader>ll',
    '<cmd>lua require("user.functions").toggleLineDiagnostics()<CR>',
    { buffer = bufnr, desc = 'toggle line diagnostic' }
  )
  vim.keymap.set(
    'n',
    '<leader>lR',
    '<cmd>lua vim.lsp.buf.references()<CR>',
    { buffer = bufnr, desc = 'Goto references' }
  )
  vim.keymap.set(
    'n',
    '<leader>lr',
    '<cmd>lua vim.lsp.buf.rename()<CR>',
    { buffer = bufnr, desc = 'Rename symbol projectwise' }
  )
  vim.keymap.set(
    'n',
    '<leader>lI',
    '<cmd>lua vim.lsp.buf.implementation()<CR>',
    { buffer = bufnr, desc = 'Goto Implementation' }
  )
  vim.keymap.set(
    'n',
    '<leader>li',
    '<cmd>lua vim.lsp.buf.incoming_calls()<CR>',
    { buffer = bufnr, desc = 'Incoming Calls' }
  )
  vim.keymap.set(
    'n',
    '<leader>lo',
    '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>',
    { buffer = bufnr, desc = 'Outgoing Calls' }
  )
  vim.keymap.set(
    'n',
    '<leader>lp',
    '<cmd>Lspsaga peek_definition<CR>',
    { buffer = bufnr, desc = 'Peak Definition' }
  )
  vim.keymap.set(
    'n',
    '<leader>ls',
    '<cmd>lua vim.lsp.buf.signature_help()<CR>',
    { buffer = bufnr, desc = 'show signature help' }
  )
  vim.keymap.set(
    'n',
    '<leader>lt',
    '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
    { buffer = bufnr, desc = 'Trouble' }
  )
  vim.keymap.set(
    'n',
    '<leader>lT',
    '<cmd>Lspsaga peek_type_definition<CR>',
    { buffer = bufnr, desc = 'Peak type definition' }
  )

  -- Haskell-specific mappings (already correct)
  if client.name == 'haskell-language-server' then
    vim.keymap.set('n', '<leader>lc', '') -- Fixed incomplete mapping
    vim.keymap.set(
      'n',
      '<leader>lch',
      'md>lua require("haskell-tools").hoogle.search({hoogle_command = true})r>',
      { buffer = true, desc = 'Hoogle Search' }
    )
    vim.keymap.set(
      'n',
      '<leader>lct',
      'md>lua require("haskell-tools").telescope.definitions()r>',
      { buffer = true, desc = 'Hoogle Type Definition' }
    )
  end
end

return M
