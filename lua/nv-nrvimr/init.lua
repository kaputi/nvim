-- Make Ranger replace netrw and be the file explorer
-- vim.g.rnvimr_ex_enable = 1
-- vim.g.rnvimr_draw_border = 1
-- Make Ranger to be hidden after picking a file
-- vim.g.rnvimr_pick_enable = 1
-- Make Neovim to wipe the buffers corresponding to the files deleted by Ranger
-- vim.g.rnvimr_bw_enable = 1
-- vim.cmd('nmap <leader>r :RnvimrToggle<CR>')
--[[ let g:rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"'
            " \ --cmd="set draw_borders separators"'
" let g:rnvimr_layout = { 'relative': 'editor',
"             \ 'width': float2nr(round(0.6 * &columns)),
"             \ 'height': float2nr(round(0.6 * &lines)),
"             \ 'col': float2nr(round(0.2 * &columns)),
"             \ 'row': float2nr(round(0.2 * &lines)),
"             \ 'style': 'minimal' }
let g:rnvimr_presets = [
            \ {'width': 0.800, 'height': 0.800}] ]] -- Make Ranger replace Netrw and be the file explorer
vim.g.rnvimr_enable_ex = 1

-- Make Ranger to be hidden after picking a file
vim.g.rnvimr_enable_picker = 1

-- Disable a border for floating window
vim.g.rnvimr_draw_border = 1

-- Hide the files included in gitignore
-- vim.g.rnvimr_hide_gitignore = 1

-- Change the border's color
vim.g.rnvimr_border_attr = {fg = 14, bg = -1}

-- Make Neovim wipe the buffers corresponding to the files deleted by Ranger
vim.g.rnvimr_enable_bw = 1

-- Add a shadow window, value is equal to 100 will disable shadow
vim.g.rnvimr_shadow_winblend = 70

-- Draw border with both
-- vim.g.rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'
