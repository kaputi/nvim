require 'nvim_utils'
local execute = vim.api.nvim_command
local HOME = os.getenv('HOME')
-- UI
vim.o.termguicolors = true
vim.cmd [[silent! colorscheme bumbler]]
-- vim.cmd [[
  -- let g:ayucolor="light"
  -- silent! colorscheme ayu
  -- ]]
vim.o.cmdheight = 2
vim.o.t_Co = '256'
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.scrolloff = 5
vim.o.sidescrolloff = 15
vim.o.laststatus = 2
vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.o.fillchars = 'vert:│'
vim.o.showmode = false
--vim.wo.foldcolumn = '1'
-- vim.wo.signcolumn='auto:1-3'
vim.wo.signcolumn='yes'
-- vim.wo.signcolumn='yes:2'
vim.o.pumblend=25

--wrapping and tabs
vim.wo.wrap = false
vim.o.textwidth = 0
vim.o.wrapmargin = 0
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak="->->->"
vim.wo.colorcolumn = '81'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true


-- Behaviour
vim.o.hidden = true
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.mouse = 'a'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.clipboard = 'unnamed'
vim.o.updatetime = 300
vim.o.timeoutlen = 300
--persistent undo
-- execute('!mkdir -p ' ..HOME.. '/.config/nvim/undodir')
vim.o.undodir = HOME .. '/.config/nvim/undodir'
vim.o.undofile = true
-- vim.cmd([[
-- if has("persistent_undo")
--   if !isdirectory($HOME."/.config/nvim/undodir")
--     silent call mkdir($HOME."/.config/nvim/undodir", "p")
--   endif
--   set undodir=~/.config/nvim/undodir
--   set undofile
-- endif
-- ]])


-- execute('!mkdir -p ' ..HOME.. '/.config/nvim/swap')
vim.o.dir = HOME .. '/.config/nvim/undodir'
-- -- swap and backups
-- vim.cmd([[
-- " create swap dir if not exist
-- if !isdirectory($HOME."/.config/nvim/swap")
-- silent call mkdir($HOME."/.config/nvim/swap", "p")
-- endif
-- ]])
vim.o.backup = false
vim.o.writebackup = false

--Autocommands
vim.cmd([[
fun! TrimWhitespace()
       let l:save = winsaveview()
       keeppatterns %s/\s\+$//e
       call winrestview(l:save)
endfun
]])

local autocmds = {
  YankHighlight = {
    {'TextYankPost', '*', 'silent! lua require"vim.highlight".on_yank()'}
  },
  FormatOptions = {
    {'FileType,BufRead,BufEnter', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' }
  },
  JsonFileTypes = {
    {'BufRead,BufNewFile', '.eslintrc,.babelrc,.prettierrc', 'set filetype=json'}
  },
  TrimWhitespace = {
    {'BufWritePre', '*', 'call TrimWhitespace()'}
  },
}

nvim_create_augroups(autocmds)

-- Lsp And Autocomplete
vim.o.completeopt = "menuone,noselect"


