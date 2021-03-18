vim.g.kommentary_create_default_mappings = false

require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
    use_consistent_indentation  = true, -- all comment charachters in same column
    ignore_whitespace = true,  -- Dont comment empty lines
})

vim.api.nvim_set_keymap("n", "gc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default", {})

--[[ ADD UNSUPPORTED LANGUAGE

require('kommentary.config').configure_language("rust", {
    single_line_comment_string = "//",
    multi_line_comment_strings = {"/*", "*/"},
})
]]



