-- OSC52 clipboard provider for tv2 inside Docker.
-- Loaded only when IN_DOCKER=1, via init.lua (image-side modification).
-- Sends yanks to the host terminal's clipboard using the OSC52 escape sequence.
-- Works in kitty, wezterm, alacritty, iTerm2, and over SSH when the terminal
-- supports OSC52 passthrough.

local function copy(lines, _)
  local text = table.concat(lines, '\n')
  local b64 = vim.base64.encode(text)
  io.stdout:write('\027]52;c;' .. b64 .. '\027\\')
  io.stdout:flush()
end

local function paste()
  return {
    vim.fn.split(vim.fn.getreg('"'), '\n'),
    vim.fn.getregtype('"'),
  }
end

vim.g.clipboard = {
  name = 'osc52-docker',
  copy = { ['+'] = copy, ['*'] = copy },
  paste = { ['+'] = paste, ['*'] = paste },
}
