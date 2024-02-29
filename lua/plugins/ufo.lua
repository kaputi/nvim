return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  enabled = true,
  config = function()
    local ufo = require('ufo')
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    -- vim.keymap.set('n', 'zk', function()
    --   local winid = require('ufo').peekFoldedLinesUnderCursor()
    --   if not winid then
    --     -- choose one of coc.nvim and nvim lsp
    --     -- vim.fn.CocActionAsync('definitionHover') -- coc.nvim
    --     vim.lsp.buf.hover()
    --   end
    -- end)

    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (' .................. %d '):format(endLnum - lnum)
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
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, 'MoreMsg' })
      return newVirtText
    end
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities.textDocument.foldingRange = {
    --   dynamicRegistration = false,
    --   lineFoldingOnly = true,
    -- }
    -- local language_servers = require('lspconfig').util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
    -- for _, ls in ipairs(language_servers) do
    --   require('lspconfig')[ls].setup({
    --     capabilities = capabilities,
    --     -- you can add other fields for setting up lsp server in this table
    --   })
    -- end
    ufo.setup({
      fold_virt_text_handler = handler,
    })

    local fcs = vim.opt.fillchars:get()

    -- Stolen from Akinsho
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
