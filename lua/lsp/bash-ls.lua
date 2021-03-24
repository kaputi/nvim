-- npm i -g bash-language-server
-- require'lspconfig'.bashls.setup {
require'lspconfig'.bash.setup { -- FROM LSPINSTALL
  on_attach = require'lsp'.common_on_attach
}
