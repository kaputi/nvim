return {
  'mfussenegger/nvim-lint',
  config = function()
    local eslint = 'eslint'

    if vim.fn.executable('eslint_d') == 1 then
      require('user.functions').notify(
        'using system eslint_d instead of eslint'
      )
      eslint = 'eslint_d'
    end

    require('lint').linters_by_ft = {
      javascript = { eslint },
      typescript = { eslint },
      javascriptreact = { eslint },
      typescriptreact = { eslint },
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
