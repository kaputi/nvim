return {
  'sindrets/diffview.nvim',
  opts = {
    view = {
      merge_tool = {
        layout = 'diff3_mixed',
      },
    },
    hooks = {
      diff_buf_win_enter = function(bufnr)
        local ok, wk = pcall(require, 'which-key')
        if ok then
          wk.register({
            c = { name = 'Conflicts' },
          }, { prefix = '<leader>', buffer = bufnr })
        end
      end,
    },
  },
}
