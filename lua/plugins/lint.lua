return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      javascript = { 'eslint' },
      typescript = { 'eslint' },
      javascriptreact = { 'eslint' },
      typescriptreact = { 'eslint' },
      -- glsl = { 'glslc' },
      go = { 'golangcilint' },
    }

    vim.api.nvim_create_autocmd(
      { 'InsertLeave', 'BufWritePost', 'TextChanged' },
      {
        callback = function()
          require('user.functions').lint()
        end,
      }
    )
  end,
}
