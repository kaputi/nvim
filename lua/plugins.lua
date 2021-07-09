local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
              install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- neovim lua utils
  use 'norcalli/nvim_utils'

  -- LSP AUTOCOMPLETE AND SYNTAX ======================
  -- Lsp
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  -- use 'glepnir/lspsaga.nvim'
  -- use 'ray-x/lsp_signature.nvim'
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'
  use 'kaputi/e-kaput'
  use 'kabouzeid/nvim-lspinstall'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils' -- a few great commands like LspRenameFile, renames file and change ALL import in other files
  -- Auto complete and snippets
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'dsznajder/vscode-es7-javascript-react-snippets'
  use 'mattn/emmet-vim'
  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'
  -- Debugger
  use 'puremourning/vimspector'

  -- UI =====================================

  -- Theme
  use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  --  Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'
  -- Colors
  use 'norcalli/nvim-colorizer.lua'
  -- Status bar
  use 'glepnir/galaxyline.nvim'
  use 'nvim-lua/lsp-status.nvim' -- generate lsp components for status bar
  -- Tab bar
  -- use 'akinsho/nvim-bufferline.lua'
  use 'romgrk/barbar.nvim'
  -- Dashboard
  -- use 'glepnir/dashboard-nvim'
  use 'mhinz/vim-startify'
  -- Smooth scroling
  use 'psliwka/vim-smoothie'

  -- Code =====================================

  -- Auto pairs
  use 'windwp/nvim-autopairs'
  -- Comments
  use 'b3nj5m1n/kommentary'
  -- Movement
  use 'phaazon/hop.nvim'
  use 'unblevable/quick-scope'
  -- Match tags
  -- use 'AndrewRadev/tagalong.vim'-- treesitter one does this besides autoclose
  use 'windwp/nvim-ts-autotag' -- uses treesitter
  -- Surround
  use 'tpope/vim-surround'
  -- TOOLS ======================================

  -- fzf find
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  -- git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
  -- File explorer
  use 'kyazdani42/nvim-tree.lua'
  -- Keybindings
  use 'liuchengxu/vim-which-key'
  -- Terminal
  use 'akinsho/nvim-toggleterm.lua'
  -- change root
  use 'airblade/vim-rooter'
  -- Zen mode
  use 'junegunn/goyo.vim'
  --  Tag viewer
  use 'liuchengxu/vista.vim'
  -- Ranger
  use 'kevinhwang91/rnvimr'
  -- Maximizer
  use 'szw/vim-maximizer'
  -- Indent Guides
  -- use 'Yggdroot/indentLine'
  -- use 'lukas-reineke/indent-blankline.nvim'
  use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
  -- Scratch Buffer
  use 'mtth/scratch.vim'
  -- Undotree
  use 'mbbill/undotree'
  -- Org mode
  -- use 'jceb/vim-orgmode'
  -- Vimwiki
  use 'vimwiki/vimwiki'
  -- Comand line tools
  use 'tpope/vim-eunuch'
  -- neovim save with sudo is broken
  use 'lambdalisue/suda.vim'
  -- better quickfix
  use 'kevinhwang91/nvim-bqf'
  -- cursor in last postion when opening a file
  use 'farmergreg/vim-lastplace'
end)
