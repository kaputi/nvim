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
      -- go = { 'revive', 'golangcilint' },
    }

    vim.api.nvim_create_autocmd(
      { 'InsertLeave', 'BufWritePost', 'TextChanged' },
      {
        callback = function()
          require('user.functions').lint()
        end,
      }
    )

    -- vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
    --   callback = function()
    --     -- For Go files, only run revive on text change
    --     if vim.bo.filetype == 'go' then
    --       require('lint').try_lint('revive')
    --     else
    --       require('lint').try_lint()
    --     end
    --   end,
    -- })

    -- -- Run golangcilint only on save for Go files
    -- vim.api.nvim_create_autocmd('BufWritePost', {
    --   pattern = '*.go',
    --   callback = function()
    --     require('user.functions').lint('golangcilint')
    --   end,
    -- })

    -- -- Regular linting on save for non-Go files
    -- vim.api.nvim_create_autocmd('BufWritePost', {
    --   pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
    --   callback = function()
    --     require('user.functions').lint()
    --   end,
    -- })
  end,
}
