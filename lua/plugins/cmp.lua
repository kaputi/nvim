return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    -- 'hrsh7th/vim-vsnip-integ',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  },
  config = function()
    local function t(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_backspace = function()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
    end

    local cmp = require('cmp')
    cmp.setup({

      snippet = {
        expand = function(args)
          vim.fn['vsnip#anonymous'](args.body)
        end,
      },
      window = {
        documentation = {
          border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        },
      },
      formatting = {
        format = function(entry, vim_item)
          local icons = require('user.gui').kind
          vim_item.kind = icons[vim_item.kind]
          vim_item.menu = ({
            nvim_lsp = '[lsp]',
            path = '[path]',
            vsnip = '[snippet]',
            buffer = '[buffer]',
            codeium = '[codeium]',
          })[entry.source.name]
          vim_item.dup = ({ buffer = 1, path = 1, nvim_lsp = 0 })[entry.source.name]
            or 0
          return vim_item
        end,
      },
      sources = {
        { name = 'vsnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'codeium' },
      },
      mapping = {
        ['<c-d>'] = cmp.mapping.scroll_docs(-4),
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        -- vsnip
        ['<c-n>'] = cmp.mapping(function(fallback)
          if vim.fn.call('vsnip#jumpable', { 1 }) == 1 then
            vim.fn.feedkeys(t('<plug>(vsnip-expand-or-jump)'), '')
          else
            fallback()
          end
        end),
        ['<s-n>'] = cmp.mapping(function(fallback)
          if vim.fn.call('vsnip#jumpable', { -1 }) == 1 then
            vim.fn.feedkeys(t('<plug>(vsnip-jump-prev)'), '')
          else
            fallback()
          end
        end),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() == true then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          elseif check_backspace() then
            vim.fn.feedkeys(t('<tab>'), 'n')
          else
            fallback() -- The fallback function is treated as original mapped key. In this case, it might be `<Tab>`.
          end
        end, {
          'i',
          's',
        }),
        ['<s-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() == true then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          else
            fallback() -- The fallback function is treated as original mapped key. In this case, it might be `<Tab>`.
          end
        end, {
          'i',
          's',
        }),

        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        -- ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
          elseif require('copilot.suggestion').is_visible() then
            require('copilot.suggestion').accept()
          else
            fallback()
          end
        end),
      },
      experimental = {
        ghost_text = true,
      },
    })
  end,
}
