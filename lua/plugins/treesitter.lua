return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'lua',
        'vim',
        'javascript',
        'markdown',
        'markdown_inline',
      },
      auto_install = true,
      highlight = {
        enable = true,
        -- disable = function(lang, buf)
        --   local max_file_size = 150 * 1024 -- 150 kb
        --   local max_file_lines = 4000
        --   if vim.api.nvim_buf_line_count(buf) > max_file_lines then
        --     return true
        --   end
        --   local ok, stats =
        --     pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        --   if ok and stats.size > max_file_size then
        --     return true
        --   end
        -- end,
        additional_vim_regex_highlighting = { 'markdown' },
      },
      indent = {
        enable = true,
      },
      --   autotag = {
      --     enable = true,
      --   },
      --   context_commentstring = {
      --     enable = true,
      --   },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },
    })
  end,
}
