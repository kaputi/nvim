-- Synchronously install Mason packages during `docker build`.
-- Mason's :MasonInstall is async; in headless mode nvim would exit before
-- installs complete. This script registers all packages, then polls until
-- they're all installed or a timeout elapses.
--
-- Run as: nvim --headless -l docker/bootstrap_mason.lua

local registry = require('mason-registry')
registry.refresh()

local needed = {
  'lua-language-server',
  'typescript-language-server',
  'gopls',
}

local pending = 0
for _, name in ipairs(needed) do
  local pkg = registry.get_package(name)
  if not pkg:is_installed() then
    pending = pending + 1
    pkg:install():on('closed', function()
      pending = pending - 1
      print('[bootstrap_mason] installed: ' .. name)
    end)
  else
    print('[bootstrap_mason] already installed: ' .. name)
  end
end

local timeout_ms = 600000  -- 10 minutes
local ok = vim.wait(timeout_ms, function() return pending == 0 end, 250)
if not ok then
  io.stderr:write(('[bootstrap_mason] timeout: %d packages still pending\n'):format(pending))
  os.exit(1)
end
print('[bootstrap_mason] all packages installed')
