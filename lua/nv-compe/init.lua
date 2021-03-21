require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  -- source = {
  --   path = true;
  --   buffer = true;
  --   calc = true;
  --   vsnip = true;
  --   nvim_lsp = true;
  --   nvim_lua = true;
  --   spell = true;
  --   tags = true;
  --   snippets_nvim = true;
  --   treesitter = true;
  -- };

  source = {
        path = {kind = "  "},
        buffer = {kind = "  "},
        calc = {kind = "  "},
        vsnip = {kind = "  "},
        nvim_lsp = {kind = "  "},
        nvim_lua = {kind = "  "},
        spell = {kind = "  "},
        tags = false,
        snippets_nvim = {kind = "  "},
        treesitter = {kind = "  "},
        emoji = {kind = " ﲃ "}
        -- for emoji press : (idk if that in compe tho)
    }
}

-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- ﬘
-- 
-- 
-- 
-- m
-- 
-- 
-- 
-- 


--Sippet support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
 elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end


-- esc wont exit insert mode but  will close completion menu
-- _G.esc_close = function()
--   if vim.fn.pumvisible() == 1 then
--       return vim.fn['compe#close']()
--   else
--     return t "<Esc>"
--   end
-- end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<Esc>", "v:lua.esc_close()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Esc>", "v:lua.esc_close()", {expr = true})
vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close("<C-e>")', {silent = true, noremap = true, expr = true})
-- vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")') -- C-k is set to show signature on insert
-- inoremap <silent><expr> <C-e>     compe#close('<C-e>')
