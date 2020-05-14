nmap <leader>u :UndotreeToggle<CR>
if has("persistent_undo")
  if !isdirectory($HOME."/.config/nvim/undodir")
    silent call mkdir($HOME."/.config/nvim/undodir", "p")
  endif
  set undodir=$HOME."/.config/nvim/undodir"
  set undofile
endif
