local HOME = os.getenv('HOME')

vim.g.scratch_height = 20
vim.g.scratch_top = 0
vim.g.scratch_horizontal = 1
-- vim.g.scratch_persistence_file '.scratch.vim' "Project based scratch
vim.g.scratch_persistence_file = HOME..'/.config/nvim/scratch.vim'
