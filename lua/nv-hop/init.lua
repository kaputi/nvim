require'hop'.setup { keys = 'etovxqpdygfblzhckisuran', term_seq_bias = 0.5 }


-- vim.api.nvim_set_keymap('n', 's', ':HopChar1<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'S', ':HopChar1<CR>', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', 'S', ':HopChar2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gl', ':HopLine<CR>', {noremap = true, silent = true})
