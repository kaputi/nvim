local M = {}

M.registerLayer = function(wk, layer, mode)
  wk.add({
    { '<leader>' .. layer.key, group = layer.name, mode = mode },
  })

  for _, mapping in ipairs(layer.keymaps) do
    vim.keymap.set(
      mode,
      '<leader>' .. layer.key .. mapping[1],
      mapping[2],
      { desc = mapping[3] }
    )
  end

  if layer.sublayers then
    for _, sublayer in ipairs(layer.sublayers) do
      M.registerLayer(wk, sublayer, mode)
    end
  end
end

return M
