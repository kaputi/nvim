local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')
gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
  bg = '#282c34',
  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#608B4E',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#569CD6',
  red = '#D16969'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end



gls.left[1] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.purple,
                          i = colors.green,
                          v = colors.blue,
                          [''] = colors.blue,
                          V = colors.blue,
                          c = colors.purple,
                          no = colors.magenta,
                          s = colors.orange,
                          S = colors.orange,
                          [''] = colors.orange,
                          ic = colors.yellow,
                          R = colors.red,
                          Rv = colors.red,
                          cv = colors.red,
                          ce=colors.red,
                          r = colors.cyan,
                          rm = colors.cyan,
                          ['r?'] = colors.cyan,
                          ['!']  = colors.red,
                          t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim.fn.mode()])
      return "  " ..  vim.fn.mode() .. " "
  --    return '  NVCode '
    end,
    separator = ' ',
    separator_highlight = {colors.yellow,function()
      if not buffer_not_empty() then
        return colors.bg
      end
      return colors.bg
    end},
    highlight = {colors.grey,colors.bg,'bold'},
  },
}
gls.left[2] = {
  GitIcon = {
    provider = function() return '' end,
    condition = condition.check_git_workspace,
    highlight = {colors.orange,colors.bg},
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.bg},
  },
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {colors.bg,colors.bg},
    highlight = {colors.orange,colors.bg},
  }
}

gls.left[3] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green,colors.bg},
  },
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.blue,colors.bg},
  },
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red, colors.bg}
    }
}

gls.left[4] = {
  Space = {
    provider = function ()
     return ' '
    end,
    condition = condition.buffer_not_empty,
    highlight = {colors.grey,colors.bg},
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.bg},
  }
}
gls.left[5] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    -- highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
    highlight = {colors.grey,colors.bg}
  },
  FileName = {
    -- provider = 'FileName',
    provider = function()
      return vim.fn.expand("%:F")
    end,
    condition = condition.buffer_not_empty,
    separator = ' ',
    separator_highlight = {colors.gray,colors.bg},
    highlight = {colors.gray,colors.bg, 'bold'}
  }
}

-- MID BAR ==========================

-- local lsp_condition = function ()
--  if next(vim.lsp.buf_get_clients()) == nil  then
--    return true
--  end
--  return false
-- end
-- gls.mid[1] = {
--   LSP = {
--     provider = function()
--        return lsp_status.status()
--      end,
--     condition = lsp_condition,
--     highlight = {colors.grey,colors.bg}
--   }
-- }
-- RIGHT BAR ===========================
gls.right[1] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = ' ' ,
    highlight = {colors.red,colors.bg},
    -- separator = '  ',
    -- separator_highlight = {colors.darkblue,colors.bg},
  },
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = ' ',
    highligh = {colors.yellow,colors.bg},
  },
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = ' ',
    highlight = {colors.blue,colors.bg},
  },
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    -- icon = ' ',
    icon = '',
    highlight = {colors.orange,colors.bg},
  }
}
gls.right[2] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [' '] = true}
           if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = ' ',
        highlight = {colors.grey, colors.bg, 'bold'},
        separator = ' | ',
        separator_highlight = {colors.darkblue,colors.bg},
    }
}

gls.right[3]= {
  FileTypeName = {
    provider = 'FileTypeName',
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.bg},
    highlight = {colors.grey,colors.bg},
    condition = condition.buffer_not_empty,
  }
}
gls.right[4] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.bg},
    highlight = {colors.grey,colors.bg},
  },
}
gls.right[5] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' |',
    separator_highlight = {colors.darkblue,colors.bg},
    highlight = {colors.grey,colors.bg},
  }
}
-- gls.right[6] = {
--   ScrollBar = {
--     provider = 'ScrollBar',
--     highlight = {colors.yellow,colors.purple},
--   }
-- }

-- short ine =================================
gls.short_line_left[1] = {
  LeftEnd = {
    provider = function() return ' ' end,
    separator = ' ',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.purple,colors.bg}
  }
}
