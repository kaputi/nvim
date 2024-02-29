MySettings = {
  onSave = {
    format = false,
    trimWhitespace = false,
  },
  linter = true,
  lineDiagnostics = true,
}

require('user.remaps')
require('user.vimoptions')
require('user.commands')
require('user.autocmds')
require('user.lazyloader')

P = function(v)
  print(vim.inspect(v))
  return v
end
