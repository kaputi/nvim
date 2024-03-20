MySettings = {
  onSave = {
    format = false,
    trimWhitespace = false,
  },
  linter = true,
  lineDiagnostics = true,
  -- colorscheme = 'edge',

  -- colorscheme = 'darkplus',

  -- colorscheme = 'tokyonight',
  -- colorscheme_flavour = 'night', -- storm, night, moon, day

  -- colorscheme = 'nightfox',
  -- colorscheme_flavour = 'carbonfox', -- nightfox, dayfox, duskfox, dawnfox, nordfox, carbonfox, terafox

  -- colorscheme = 'night-owl',

  -- nevarasu
  colorscheme = 'onedark',
  colorscheme_flavour = 'darker', -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
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
