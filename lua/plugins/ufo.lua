return {
  -- enabled = false,
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  -- enabled = false,
  -- event = 'BufReadPre',
  config = function()
    local ufo = require('ufo')

    ufo.setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end,
      fold_virt_text_handler = function(
        virtText,
        lnum,
        endLnum,
        width,
        truncate
      )
        local newVirtText = {}
        local suffix = ('  ........................... %d lines'):format(
          endLnum - lnum
        )
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0

        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end

        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
      end,
    })

    -- UFO keymaps
    vim.keymap.set('n', 'zR', ufo.openAllFolds)
    -- Remap zo to open fold recursively
    vim.keymap.set('n', 'zo', 'zO', { desc = 'Open fold recursively' })
    vim.keymap.set('n', 'zM', ufo.closeAllFolds)
    vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds)
    vim.keymap.set('n', 'zm', ufo.closeFoldsWith)
    vim.keymap.set('n', 'zk', function()
      ufo.peekFoldedLinesUnderCursor()
      -- local winid = ufo.peekFoldedLinesUnderCursor()
      -- if not winid then
      --   vim.lsp.buf.hover()
      -- end
    end)

    vim.keymap.set('n', '<leader>z', function()
      local level = vim.fn.foldlevel('.') -- Gets fold level at cursor line
      level = level - 1
      if level < 0 then
        level = 0
      end
      ufo.closeFoldsWith(level)
    end, { desc = 'Fold at previous level' })

    vim.keymap.set('n', '<leader>Z', function()
      local level = vim.fn.foldlevel('.') -- Gets fold level at cursor line
      ufo.closeFoldsWith(level)
    end, { desc = 'Fold at current level' })

    local fcs = vim.opt.fillchars:get()

    -- -- Stolen from Akinsho
    local function get_fold(lnum)
      if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
        return ' '
      end
      return vim.fn.foldclosed(lnum) == -1 and fcs.foldopen or fcs.foldclose
    end

    _G.get_statuscol = function()
      return '%s%l ' .. get_fold(vim.v.lnum) .. ' '
    end

    vim.o.statuscolumn = '%!v:lua.get_statuscol()'

    vim.cmd([[
        hi default UfoFoldedFg guifg=Normal.foreground
        hi default UfoFoldedBg guibg=Folded.background
        hi default link UfoPreviewSbar PmenuSbar
        hi default link UfoPreviewThumb PmenuThumb
        hi default link UfoPreviewWinBar UfoFoldedBg
        hi default link UfoPreviewCursorLine Visual
        hi default link UfoFoldedEllipsis Comment
        hi default link UfoCursorFoldedLine CursorLine
      ]])
  end,
}
