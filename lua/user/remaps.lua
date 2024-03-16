local remaps = {
  insert_mode = {
    --  jk for exit insert
    ['jk'] = '<ESC>',

    -- move current line / block with alt=j/k
    ['<A-j>'] = '<ESC>:m .+1<CR>==gi',
    ['<A-k>'] = '<ESC>:m .-2<CR>==gi',

    -- navigate tab completion with <c-j> and <c-k>
    -- runs conditionally
    ['<C-j>'] = {
      'pumvisible() ? "\\<C-n>" : "\\<C-j>"',
      { expr = true, noremap = true },
    },
    ['<C-k>'] = {
      -- TOOD: this should be on lsp config
      'pumvisible() ? "\\<C-p>" : "<cmd>lua vim.lsp.buf.signature_help()<CR>"',
      -- 'pumvisible() ? "\\<C-p>" : "<cmd>Lspsaga hover_doc<CR>"',
      { expr = true, noremap = true },
    },

    -- ctrl s saves
    ['<C-s>'] = '<cmd>:w<CR>',
  },

  normal_mode = {
    -- I FUKING HATE CMMAND LINE WINDOW
    ['q:'] = '<NOP>',
    ['q/'] = '<NOP>',
    ['q?'] = '<NOP>',

    -- Better window navigation
    ['<c-h>'] = '<c-w>h',
    ['<c-j>'] = '<c-w>j',
    ['<c-k>'] = '<c-w>k',
    ['<c-l>'] = '<c-w>l',

    -- Use Alt + hjkl for resize
    ['<A-j>'] = ':resize +2<CR>',
    ['<A-k>'] = ':resize -2<CR>',
    ['<A-h>'] = ':vertical resize -2<CR>',
    ['<A-l>'] = ':vertical resize +2<CR>',

    -- Copy and paste
    ['<C-c>'] = '"+y',
    ['<A-c>'] = 'V"+y',

    -- Select all
    ['<C-a>'] = 'ggVG',

    -- Move faster
    ['J'] = '5j',
    ['K'] = '5k',

    -- Move to wraps
    ['j'] = 'gj',
    ['k'] = 'gk',

    -- Buffer navigation
    -- NOTE: this makes b slow for going bacckwards added to whichkey (SPC+n)
    -- ['bn'] = ':BufferNext<CR>',
    -- ['bp'] = ':BufferPrevious<CR>',
    -- ['bd'] = ':BufferClose<CR>',
    -- H and L to switch tabs
    -- ['L'] = ':BufferNext<CR>',
    -- ['H'] = ':BufferPrevious<CR>',
    -- Tab and s-tab to switch tabs
    -- ['<Tab>'] = ':BufferNext<CR>',
    -- ['<S-Tab>'] = ':BufferPrevious<CR>',
    ['<Tab>'] = ':bn | f<CR>',
    ['<S-Tab>'] = ':bp | f<CR>',
    -- ['<Tab>'] = ':BufferLineCycleNext<CR>',
    -- ['<S-Tab>'] = ':BufferLineCyclePrev<CR>',

    -- Yank to end of line
    ['Y'] = 'y$',

    -- trouble
    ['<F4>'] = ':TroubleToggle document_diagnostics<CR>',

    -- ctrl s saves
    ['<C-s>'] = ':w<CR>',

    -- sideScroll scroll
    -- ['<ScrollWheelDown>'] = '<C-E>',
    -- ['<ScrollWheelUp>'] = '<C-Y>'
  },
  term_mode = {},
  visual_mode = {
    -- Copy and paste
    ['<C-c>'] = '"+y',

    -- Move faster
    ['J'] = '5j',
    ['K'] = '5k',

    -- Move selction with Alt + j/k
    ['<A-k>'] = ":move '<-2<CR>gv-gv",
    ['<A-j>'] = ":move '>+1<CR>gv-gv",

    -- Better indenting
    ['>'] = '>gv',
    ['<'] = '<gv',

    -- search selected
    ['/'] = 'y/<C-r>"<CR>',
    ['?'] = 'y?<C-r>"<CR>',

    -- ctrl s saves
    ['<C-s>'] = ':w<CR>',
  },
  visual_block_mode = {},
  command_mode = {},
}

local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
  insert_mode = generic_opts_any,
  normal_mode = generic_opts_any,
  visual_mode = generic_opts_any,
  visual_block_mode = generic_opts_any,
  command_mode = generic_opts_any,
  term_mode = { silent = true },
}

local mode_adapters = {
  insert_mode = 'i',
  normal_mode = 'n',
  term_mode = 't',
  visual_mode = 'v',
  visual_block_mode = 'x',
  command_mode = 'c',
}

local function set_keymap(mode, key, val)
  local opt = generic_opts[mode] and generic_opts[mode] or generic_opts_any
  if type(val) == 'table' then
    opt = val[2]
    val = val[1]
  end
  vim.api.nvim_set_keymap(mode, key, val, opt)
end

for mode, maps in pairs(remaps) do
  local modeAdapter = mode_adapters[mode]
  for k, v in pairs(maps) do
    set_keymap(modeAdapter, k, v)
  end
end

vim.g.mapleader = ' '
