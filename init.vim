"  __    __  __     __  ______  __       __ 
" /  \  /  |/  |   /  |/      |/  \     /  |
" $$  \ $$ |$$ |   $$ |$$$$$$/ $$  \   /$$ |
" $$$  \$$ |$$ |   $$ |  $$ |  $$$  \ /$$$ |
" $$$$  $$ |$$  \ /$$/   $$ |  $$$$  /$$$$ |
" $$ $$ $$ | $$  /$$/    $$ |  $$ $$ $$/$$ |
" $$ |$$$$ |  $$ $$/    _$$ |_ $$ |$$$/ $$ |
" $$ | $$$ |   $$$/    / $$   |$$ | $/  $$ |
" $$/   $$/     $/     $$$$$$/ $$/      $$/ 

                            
" Always source these
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/plug-config/easymotion.vim
source $HOME/.config/nvim/plug-config/multicursor.vim

" Source VScode only
if exists('g:vscode')
  source $HOME/.config/nvim/vscode/vscodeConfig.vim

" Source for Neovim only
else
  source $HOME/.config/nvim/themes/settings.vim
  source $HOME/.config/nvim/plug-config/coc.vim
  source $HOME/.config/nvim/plug-config/closetags.vim
  source $HOME/.config/nvim/plug-config/lightline.vim
  source $HOME/.config/nvim/plug-config/nerd-commenter.vim
  source $HOME/.config/nvim/plug-config/undotree.vim
endif
