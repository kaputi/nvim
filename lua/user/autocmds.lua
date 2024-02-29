vim.api.nvim_create_augroup('_user', {})

-- highlight yanked text
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  group = '_user',
  pattern = { '*' },
  callback = function()
    require('vim.highlight').on_yank()
  end,
})

-- on save
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = '_user',
  pattern = { '*' },
  callback = function()
    require('user.functions').preSave()
  end,
})

-- json filetype
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = '_user',
  pattern = { '.eslintrc', '.babelrc', '.prettierrc' },
  command = 'set ft=json',
})

-- format options
vim.api.nvim_create_autocmd({ 'FileType', 'BufRead', 'BufEnter' }, {
  group = '_user',
  pattern = '*',
  command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o',
})

-- change dir to oppened file
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  group = '_user',
  -- command = 'cd %:p:h',
  callback = function()
    vim.cmd('cd %:p:h')
    if vim.o.ft ~= 'alpha' then
      -- require('user.functions').notify('cd to '.. vim.fn.getcwd())
      print(vim.fn.getcwd())
    end
  end,
})

-- glsl filetype
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = '_user',
  pattern = {
    '*.frag',
    '*.vert',
    '*.tesc',
    '*.tese',
    '*.comp',
    '*.geom',
    '*.glsl',
  },
  -- callback = "set ft=glsl"
  callback = function()
    vim.bo.filetype = 'glsl'
  end,
})
