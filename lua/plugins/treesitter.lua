return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  build = ':TSUpdate',
  init = function()
    -- Install core parsers on startup (idempotent; skips if already installed)
    local ts = require('nvim-treesitter')
    ts.install({
      'lua',
      'vim',
      'javascript',
      'typescript',
      'tsx',
      'jsdoc',
      'markdown',
      'markdown_inline',
      'kconf',
    }, { summary = false }):wait(30000) -- 30s timeout
  end,
  config = function()
    -- use kconfig for conf files
    vim.treesitter.language.register('kconfig', 'conf')

    -- Auto-install missing parsers and start treesitter highlighting
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(event)
        local buf = event.buf
        local lang = vim.treesitter.language.get_lang(event.match)
          or event.match

        -- Start treesitter if parser exists, otherwise install then start
        if pcall(vim.treesitter.get_parser, buf, lang) then
          pcall(vim.treesitter.start, buf, lang)
        else
          local ok, task = pcall(require('nvim-treesitter').install, { lang })
          if ok then
            task:await(function()
              pcall(vim.treesitter.start, buf, lang)
            end)
          end
        end
      end,
    })

    -- Disable treesitter for large files
    vim.api.nvim_create_autocmd('BufReadPre', {
      callback = function(event)
        local buf = event.buf
        local max_file_size = 150 * 1024
        local max_file_lines = 4000
        local ok, stats =
          pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_file_size then
          vim.b[buf].large_file = true
        end
        vim.api.nvim_create_autocmd('BufReadPost', {
          buffer = buf,
          once = true,
          callback = function()
            if
              vim.b[buf].large_file
              or vim.api.nvim_buf_line_count(buf) > max_file_lines
            then
              vim.treesitter.stop(buf)
            end
          end,
        })
      end,
    })

    -- Textobjects
    local textobjects_ok, textobjects =
      pcall(require, 'nvim-treesitter-textobjects')
    if textobjects_ok then
      textobjects.setup({ select = { lookahead = true } })
      local select = require('nvim-treesitter-textobjects.select')
      local keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['ib'] = '@block.inner',
        ['ab'] = '@block.outer',
        ['ii'] = '@conditional.inner',
        ['ai'] = '@conditional.outer',
      }
      for key, query in pairs(keymaps) do
        vim.keymap.set({ 'x', 'o' }, key, function()
          select.select_textobject(query)
        end)
      end
    end
  end,
}
