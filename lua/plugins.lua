local execute = vim.api.nvim_command
local fn = vim.fn


local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end


return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- LSP AUTOCOMPLETE AND SYNTAX ======================

  -- Lsp
  use 'neovim/nvim-lspconfig'
  -- Auto complete
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'

  -- UI =====================================

  -- Theme
  use 'ayu-theme/ayu-vim' -- high contrast themes use with let g:ayucolor="light" | "dark" | "mirage"
  --  Icons
  use 'kyazdani42/nvim-web-devicons'
  -- Colors
  use 'norcalli/nvim-colorizer.lua'
  -- Status bar
  use 'glepnir/galaxyline.nvim'
  -- Tab bar
  use 'akinsho/nvim-bufferline.lua'

  -- Code =====================================

  -- Auto pairs
  use 'windwp/nvim-autopairs'
  -- Comments
  use 'b3nj5m1n/kommentary'
  -- Movement
  use 'phaazon/hop.nvim'

  -- TOOLS ======================================

  --fzf find
  use {
  'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  --git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  -- File explorer
  use 'kyazdani42/nvim-tree.lua'
  -- Keybindings
  --use 'liuchengxu/vim-which-key'
  -- Terminal
  use 'akinsho/nvim-toggleterm.lua'
end)
