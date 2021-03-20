local HOME = os.getenv( "HOME" )

vim.g.vimspector_install_gadgets = {'debugger-for-chrome','vscode-node-debug2'}
vim.g.vimspector_base_dir= HOME .. '/.config/nvim/vimspector-config'
