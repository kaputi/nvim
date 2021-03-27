local map = vim.api.nvim_set_keymap
--
-- Better window navigation
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

-- Resize
-- " Use alt + hjkl to resize windows
map('n', '<A-j>', ':resize -2<CR>', {noremap = true, silent = true})
map('n', '<A-k>', ':resize +2<CR>', {noremap = true, silent = true})
map('n', '<A-h>', ':vertical resize -2<CR>', {noremap = true, silent = true})
map('n', '<A-l>', ':vertical resize +2<CR>', {noremap = true, silent = true})

-- Copy and paste
map('n', '<C-c>', '"+y', {noremap = true, silent = true})
map('n', '<A-c>', 'V"+y', {noremap = true, silent = true})
map('v', '<C-c>', '"+y', {noremap = true, silent = true})

-- Select all
map('n', '<C-a>', 'ggVG', {noremap = true, silent = true})

-- Move faster
map('n', 'J', '5j', {noremap = true, silent = true})
map('n', 'K', '5k', {noremap = true, silent = true})
map('v', 'J', '5j', {noremap = true, silent = true})
map('v', 'K', '5k', {noremap = true, silent = true})

-- Move to Wraps
map('n', 'j', 'gj', {noremap = true, silent = true})
map('n', 'k', 'gk', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
map('x', '<C-k>', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
map('x', '<C-j>', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Beggining and End
map('n', 'B', '^', {noremap = true, silent = true})
map('n', 'E', 'g_', {noremap = true, silent = true})
map('v', 'E', '^', {noremap = true, silent = true})
map('v', 'E', 'g_', {noremap = true, silent = true})

-- Better indenting
map('v', '>', '>gv', {noremap = true, silent = true})
map('v', '<', '<gv', {noremap = true, silent = true})

-- Buffer navigation
-- map('n', 'bn', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
map('n', 'bn', ':BufferNext<CR>', {noremap = true, silent = true})
-- map('n', 'bp', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
map('n', 'bp', ':BufferPrevious<CR>', {noremap = true, silent = true})
-- map('n', 'bd', ':bd<CR>', {noremap = true, silent = true})
-- map('n', 'bd', ':bp | bd #<CR>', {noremap = true, silent = true}) -- thisone doesn't close splits
map('n', 'bd', ':BufferClose<CR>', {noremap = true, silent = true}) -- thisone doesn't close splits
-- Tab switch buffer
map('n', '<TAB>', ':BufferNext<CR>', {noremap = true, silent = true})
map('n', '<S-TAB>', ':BufferPrevious<CR>', {noremap = true, silent = true})

-- I FUCKING HATE THE COMAN-LINE WINDOW
map('n', 'q:', '<NOP>', {noremap = true, silent = true})
map('n', 'q/', '<NOP>', {noremap = true, silent = true})
map('n', 'q?', '<NOP>', {noremap = true, silent = true})

-- quickfix
map('n', 'qq', ':copen<CR>', {noremap = true, silent = true})
map('n', 'qw', ':cclose<CR>', {noremap = true, silent = true})
map('n', 'qn', ':cnext<CR>', {noremap = true, silent = true})
map('n', 'qp', ':cprev<CR>', {noremap = true, silent = true})
map('n', 'qll', ':lopen<CR>', {noremap = true, silent = true})
map('n', 'qln', ':lnext<CR>', {noremap = true, silent = true})
map('n', 'qlp', ':pprev<CR>', {noremap = true, silent = true})

-- I dont release Shift in time
vim.cmd(':command! -bar -bang WQ wq<bang>')
vim.cmd(':command! -bar -bang WQ wq<bang>')
vim.cmd(':command! -bar -bang Wq wq<bang>')
vim.cmd(':command! -bar -bang Wqa wqa<bang>')
vim.cmd(':command! -bar -bang W w<bang>')
vim.cmd(':command! -bar -bang Q q<bang>')
