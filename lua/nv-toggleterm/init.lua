require"toggleterm".setup{
  size = 20,
  open_mapping = [[<C-t>]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  persist_size = true,
  direction ='horizontal',
}

-- toggle
vim.api.nvim_set_keymap('n', '<F1>', ':1ToggleTerm<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F2>', ':2ToggleTerm<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F3>', ':3ToggleTerm<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<F1>', '<C-\\><C-N>:1ToggleTerm<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<F2>', '<C-\\><C-N>:2ToggleTerm<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<F3>', '<C-\\><C-N>:3ToggleTerm<CR>', {noremap = true, silent = true})

--navigate
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', {noremap = true, silent = true})

--resize
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-N>:resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-N>:resize +2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-N>:vertical resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-N>:vertical resize +2<CR>', {noremap = true, silent = true})
