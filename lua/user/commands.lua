local commands = {
  '-bar -bang WQ wq<bang>',
  '-bar -bang Wq wq<bang>',
  '-bar -bang Wqa wqa<bang>',
  '-bar -bang WQa wqa<bang>',
  '-bar -bang WQA wqa<bang>',
  '-bar -bang W w<bang>',
  '-bar -bang Q q<bang>',
}

for _, command in pairs(commands) do
  vim.cmd(':command! ' .. command)
end
