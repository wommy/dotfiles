local nnoremap = require('keymap').nnoremap

-- autocmd VimEnter * NERDTree | wincmd p
-- Start NERDTree when Vim is started without file arguments.
-- vim.cmd('StdinReadPre *', 'vim.s.std_in=1')
-- Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
-- autocmd StdinReadPre * let s:std_in=1
-- autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
---- nerdtree options , recommended defaults
-- vim.opt.NERDTreeShowHidden=1
nnoremap('<leader>n', ':NERDTreeFocus<CR>')
nnoremap('<C-n>', ':NERDTree<CR>')
nnoremap('<C-t>', ':NERDTreeToggle<CR>')
nnoremap('<C-f>', ':NERDTreeFind<CR>')
--
-- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
--autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
		--\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
