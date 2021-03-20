require 'nvim_utils'

local map = vim.api.nvim_set_keymap

vim.fn.sign_define("LspDiagnosticsSignError", {
    texthl = "LspDiagnosticsSignError",
    text = "",
    numhl = "LspDiagnosticsSignError"
})
vim.fn.sign_define("LspDiagnosticsSignWarning", {
    texthl = "LspDiagnosticsSignWarning",
    text = "",
    numhl = "LspDiagnosticsSignWarning"
})
vim.fn.sign_define("LspDiagnosticsSignInformation", {
    texthl = "LspDiagnosticsSignInformation",
    text = "",
    numhl = "LspDiagnosticsSignInformation"
})
vim.fn.sign_define("LspDiagnosticsSignHint", {
    texthl = "LspDiagnosticsSignHint",
    text = "",
    numhl = "LspDiagnosticsSignHint"
})

map('n', 'gd', '<Cmd> lua vim.lsp.buf.definitions()<CR>', {noremap = true, silent = true})
map('n', 'gD', '<Cmd> lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})
map('n', 'gr', '<Cmd> lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
map('n', 'gi', '<Cmd> lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})
map('n', 'ca', '<Cmd> lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true})
map('n', '<C-n>', '<Cmd> lnext<CR>', {noremap = true, silent = true})
map('n', '<C-p>', '<Cmd> lprev<CR>', {noremap = true, silent = true})
map('i', '<C-k>', '<Esc><Cmd>lua vim.lsp.buf.hover()<CR>a', {noremap = true, silent = true})

--[[ " autoformat
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100) ]]
-- Java
-- autocmd FileType java nnoremap ca <Cmd>lua require('jdtls').code_action()<CR>

-- vim.cmd([[
--   augroup LspLocalQuickFix
--     autocmd! LspLocalQuickFix
--     autocmd BuffWrite,BuffEnter,InsertLeave * <cmd> lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
--   augroup END
-- ]])

local autocmds = {
	diagnoticLocList = {
		{"BufWrite,BufEnter,InsertLeave",     "*", "lua vim.lsp.diagnostic.set_loclist({open_loclist = false})"};
		-- {"FileType",     "todo",   "lua FILETYPE_HOOKS.todo()"};
	};
}

nvim_create_augroups(autocmds)

local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
    end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
-- local servers = {"pyright", "tsserver"}
-- for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end
return lsp_config

