-- UI
vim.o.termguicolors = true
vim.api.nvim_set_var('ayucolor', 'mirage')
vim.cmd [[silent! colorscheme ayu]]
vim.cmd('hi VertSplit guibg=NONE guifg=#787878')
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
vim.wo.foldcolumn = '1'
vim.wo.signcolumn='auto:1-3'

--wrapping and tabs
vim.wo.wrap = false
vim.bo.textwidth = 80
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

-- Lsp And Autocomplete
vim.o.completeopt = "menuone,noselect"


