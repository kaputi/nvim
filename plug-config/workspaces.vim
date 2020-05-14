" toggle workspace
nnoremap <leader><leader>s :ToggleWorkspace<CR>

" If Vim is run with a file argument and it's already in the session's workspace,
" Vim will load the session and go to the tab window that contains it.
" Otherwise, it will be loaded as a new tab in the session.
" If you would rather create a new buffer in the existing tab instead of creating a new tab:
let g:workspace_create_new_tabs = 0  " enabled = 1 (default), disabled = 0

"The following default can be configured if you wish to change the session name:
"let g:workspace_session_name = 'Session.vim'

" create sessions dir if not exist
if !isdirectory($HOME."/.config/nvim/sessions")
  silent call mkdir($HOME."/.config/nvim/sessions", "p")
endif

"Use g:workspace_session_directory to save all your session files in a single directory outside of your workspace. Example:
let g:workspace_session_directory = $HOME . '/.config/nvim/sessions/'

" If you'd like sessions to not load if you're explicitly loading a file in a workspace 
" directory (as opposed to an argument-less vim), the following in your vimrc will provide that behaviour:
" let g:workspace_session_disable_on_args = 1

" When in a workspace, file undo history is persisted between sessions, without needing to keep Vim on.
" Cursor positions will also persist across session reloads.

" let g:workspace_persist_undo_history = 1  " enabled = 1 (default), disabled = 0
 let g:workspace_undodir=$HOME . '/.config/nvim/undodir/'

" Files edited in a workspace session will autosave on InsertLeave, idle (CursorHold), pane switches (FocusLost and FocusGained), or buffer switches (BufLeave).
" FocusLost and FocusGained triggers will typically trigger only with GUI versions of Vim. However, there are plugins that enables these for 
" the console version within Tmux (i.e. sjl/vitality.vim).
" This autosave feature enforces a last writer wins policy (eventual consistency).
" You can manually enable the autosave feature outside of a workspace session with the ToggleAutosave command.
" If you would like autosave to be always on, even outside of a session, add the following to your vimrc:
" let g:workspace_autosave_always = 1
" If you would like to disable autosave for some reason (i.e. too much IO on disk), it can be disabled as shown here:
let g:workspace_autosave = 0

" By default, all trailing spaces are trimmed before a buffer is autosaved. If you don't prefer this behaviour, add this line:
" let g:workspace_autosave_untrailspaces = 0

" Ignore List
" Git commit filetypes won't autosave (or trim trailing spaces) by default. You can customize the ignore list with this line:
let g:workspace_autosave_ignore = ['gitcommit']
