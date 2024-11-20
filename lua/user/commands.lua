-- i don't release shift fast enough after the : and usualy have the first letter capitalized
local commands = {
  '-bar -bang WQ wq<bang>',
  '-bar -bang Wq wq<bang>',
  '-bar -bang Wa wa<bang>',
  '-bar -bang WA wa<bang>',
  '-bar -bang Wqa wqa<bang>',
  '-bar -bang WQa wqa<bang>',
  '-bar -bang WQA wqa<bang>',
  '-bar -bang W w<bang>',
  '-bar -bang Q q<bang>',
  '-bar -bang E e<bang>',
}

for _, command in pairs(commands) do
  vim.cmd(':command! ' .. command)
end
