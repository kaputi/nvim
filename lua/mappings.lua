-- Space is leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- Telescope find file
vim.api.nvim_set_keymap('n', '<Leader><Space>', ':Telescope find_files<CR>', {noremap = true, silent = true}) 

-- File Explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true}) 

-- Remove search hl
vim.api.nvim_set_keymap('n', '<Leader>as', ':set hlsearch!<CR>', {noremap = true, silent = true}) 

-- Splits
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit<CR>', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('n', '<Leader>h', ':split<CR>', {noremap = true, silent = true}) 

-- Quit
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', {noremap = true, silent = true}) 

-- Yank list (registers)
vim.api.nvim_set_keymap('n', '<Leader>y', ':Telescope registers<CR>', {noremap = true, silent = true}) 

-- Modes keymapping
-- Better window navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true}) 

-- Resize
-- " Use alt + hjkl to resize windows
vim.api.nvim_set_keymap('n', '<A-j>', ':resize -2<CR>', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('n', '<A-k>', ':resize +2<CR>', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('n', '<A-h>', ':vertical resize -2<CR>', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('n', '<A-l>', ':vertical resize +2<CR>', {noremap = true, silent = true}) 
-- nnoremap <silent> <M-j>    :resize -2<CR>
-- nnoremap <silent> <M-k>    :resize +2<CR>
-- nnoremap <silent> <M-h>    :vertical resize -2<CR>
-- nnoremap <silent> <M-l>    :vertical resize +2<CR>

-- Copy and paste
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('n', '<A-c>', 'V"+y', {noremap = true, silent = true}) 

-- Select all 
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', {noremap = true, silent = true}) 

-- Move faster
vim.api.nvim_set_keymap('n', 'J', '5j', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('n', 'K', '5k', {noremap = true, silent = true}) 

--Beggining and End
vim.api.nvim_set_keymap('n', 'B', '^', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('n', 'E', 'g_', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('v', 'E', '^', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('v', 'E', 'g_', {noremap = true, silent = true}) 

-- Better indenting
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true}) 

-- Buffer navigation
vim.api.nvim_set_keymap('n', 'bn', ':bn<CR>', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('n', 'bp', ':bp<CR>', {noremap = true, silent = true}) 
vim.api.nvim_set_keymap('n', 'bd', ':bd<CR>', {noremap = true, silent = true}) 


-- I dont release Shift in time
vim.cmd(':command! WQ wq')
vim.cmd(':command! WQ wq')
vim.cmd(':command! Wq wq')
vim.cmd(':command! Wqa wqa')
vim.cmd(':command! W w')
vim.cmd(':command! Q q')
