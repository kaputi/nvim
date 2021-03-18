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

  -- Comments
  use 'b3nj5m1n/kommentary'

  -- Lsp
 use 'neovim/nvim-lspconfig'
 use 'hrsh7th/nvim-compe'

  -- Keybindings
  --use 'liuchengxu/vim-which-key'

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'
  
  -- Theme
  use 'ayu-theme/ayu-vim'

  --  Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Status bar
  use 'glepnir/galaxyline.nvim'
  -- Tab bar
  use 'akinsho/nvim-bufferline.lua'

  -- Auto pairs
  use 'windwp/nvim-autopairs'

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

end)
