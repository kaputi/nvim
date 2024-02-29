local options = {
  autoindent = true,
  backup = false,
  breakindent = true,
  clipboard = 'unnamed',
  cmdheight = 2,
  -- colorcolumn = '81',
  colorcolumn = '101',
  completeopt = { 'menuone', 'noselect' },
  conceallevel = 0, -- so that `` is visible in markdown files
  encoding = 'utf-8',
  fileencoding = 'utf-8',
  -- opt.fillchars       = "fold: "
  foldlevel = 99, -- Using ufo provider need a large value, feel free to decrease the value
  foldlevelstart = 99,
  foldenable = true,
  fillchars = 'vert:│,foldopen:,foldclose:',
  foldnestmax = 3,
  hidden = true,
  hlsearch = true,
  ignorecase = true,
  laststatus = 3,
  linebreak = true,
  mouse = 'a',
  pumheight = 10,
  pumblend = 25,
  showmode = false,
  showtabline = 0,
  smartcase = true,
  smarttab = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  -- directory = CACHE_PATH .. '/swap',
  termguicolors = true,
  textwidth = 0,
  timeoutlen = 500,
  -- undodir = CACHE_PATH .. '/undo',
  undofile = true,
  updatetime = 300,
  wrapmargin = 0,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  -- showbreak = '->->',
  tabstop = 2,
  cursorline = true,
  cursorcolumn = true,
  number = true,
  relativenumber = false,
  numberwidth = 4,
  signcolumn = 'yes',
  wrap = false,
  spell = false,
  spelllang = 'en',
  scrolloff = 8,
  sidescrolloff = 15,
  winhighlight = 'Normal:Normal,NormalNC:ColorColumn',
  mousemoveevent = true,
}

local globalOptions = {}
local localoptions = {}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globalOptions) do
  vim.opt_global[k] = v
end

for k, v in pairs(localoptions) do
  vim.opt_local[k] = v
end
