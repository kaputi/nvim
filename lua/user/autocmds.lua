vim.api.nvim_create_augroup('_user', {})

-- highlight yanked text
-- vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
--   group = '_user',
--   pattern = { '*' },
--   callback = function()
--     -- require('vim.highlight').on_yank({ higroup = 'IncSearch', timeout = 300 })
--     require('vim.highlight').on_yank({ higroup = 'CurSearch', timeout = 300 })
--     -- require('vim.highlight').on_yank({ higroup = 'Cursor', timeout = 300 })
--     -- require('vim.highlight').on_yank({ higroup = 'CursorColumn', timeout = 300 })
--   end,
-- })

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

-- go filetype
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = '_user',
  pattern = { 'go.mod' },
  command = 'set ft=go',
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

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = '_user',
  pattern = {
    '*.wgsl',
  },
  -- callback = "set ft=glsl"
  callback = function()
    vim.bo.filetype = 'wgsl'
  end,
})

vim.api.nvim_create_autocmd({ 'CmdLineLeave' }, {
  group = '_user',
  callback = function()
    if vim.fn.getcmdtype() == '/' then
      require('user.functions').disableSearchHlTimer()
    end
  end,
})

-- Auto-enter insert mode in terminal buffers
vim.api.nvim_create_autocmd(
  { 'BufEnter', 'BufWinEnter', 'WinEnter', 'TermOpen' },
  {
    group = '_user',
    pattern = 'term://*',
    callback = function()
      vim.cmd('startinsert')
    end,
  }
)

-- source project-local .nvim.lua on startup and cwd change
local function source_project_config()
  local nvim_lua = vim.fn.getcwd() .. '/.nvim.lua'
  if vim.fn.filereadable(nvim_lua) == 1 then
    local notify = require('user.functions').notify
    notify('Project config loaded')
    dofile(nvim_lua)
  end
end

source_project_config()
vim.api.nvim_create_autocmd('DirChanged', {
  group = '_user',
  callback = source_project_config,
})

-- disable stuff for large/bundled files
vim.api.nvim_create_autocmd('BufReadPre', {
  group = '_user',
  callback = function(args)
    local ok, stats = pcall(vim.loop.fs_stat, args.file)
    local large_file = ok and stats and stats.size > 150 * 1024 -- 150kb

    if not large_file then
      local file = io.open(args.file, 'r')
      if file then
        local line = file:read('*l')
        file:close()
        large_file = line and #line > 10000
      end
    end

    if large_file then
      vim.b.large_file = true
      vim.opt_local.syntax = 'off'
      vim.cmd('TSBufDisable highlight')
    end
  end,
})
