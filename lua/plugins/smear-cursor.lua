return {
  'sphamba/smear-cursor.nvim',

  opts = {
    -- Smear cursor when switching buffers or windows.
    smear_between_buffers = true,

    -- Smear cursor when moving within line or to neighbor lines.
    -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
    smear_between_neighbor_lines = true,

    scroll_buffer_space = true,

    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears will blend better on all backgrounds.
    legacy_computing_symbols_support = false,

    -- Smear cursor in insert mode.
    -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
    smear_insert_mode = false,

    min_horizontal_distance_smear = 5,
    min_vertical_distance_smear = 5,

    time_interval = 7,

    stiffness = 0.95,

    cursor_color = '#48b0bd',
    -- cursor_color = '#00ff00',
    -- cursor_color = '#ff0000',
  },
}
