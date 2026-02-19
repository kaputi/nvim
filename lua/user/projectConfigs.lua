local M = {}

M.load_all_project_config = function()
  local configs = {}
  local nvim_dir = vim.fn.getcwd() .. '/.nvim'

  if vim.fn.isdirectory(nvim_dir) == 0 then
    return configs
  end

  local files = vim.fn.glob(nvim_dir .. '/*.lua', false, true)
  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ':t:r')
    configs[name] = M.load_project_config(name)
  end

  return configs
end

M.load_project_config = function(name)
  local config_path = vim.fn.getcwd() .. '/.nvim/' .. name .. '.lua'
  if vim.fn.filereadable(config_path) == 1 then
    local ok, result = pcall(dofile, config_path)
    if ok and type(result) == 'table' then
      return result
    end
  end
  return {}
end

return M
