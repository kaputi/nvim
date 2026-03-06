local M = {}

local flavours = {
  'night',
  'storm',
  'moon',
  'day',
}

M.cycle_tokyonight = function()
  local current = vim.g.colors_name or ''
  local current_flavour = current:match('tokyonight%-(%w+)')

  local index = 1
  if current_flavour then
    for i, v in ipairs(flavours) do
      if v == current_flavour then
        index = i + 1
        break
      end
    end
  end

  if index > #flavours then
    index = 1
  end

  vim.cmd('colorscheme tokyonight-' .. flavours[index])
  vim.notify('Tokyonight style set to ' .. flavours[index])
end

return M
