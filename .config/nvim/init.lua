---- settings , options
	vim.opt.number=true
	vim.opt.relativenumber=true
	vim.opt.wrap=false
	vim.opt.shiftwidth=2
	vim.opt.tabstop=2
	vim.opt.smartindent=true
	vim.opt.scrolloff=999
	vim.opt.clipboard='unnamedplus'
	vim.opt.breakindent=true
	vim.opt.breakindentopt='shift:2,min:40,sbr'
	vim.opt.showbreak='>>'
	vim.opt.foldmethod='indent'
	vim.opt.foldlevelstart=3
	vim.opt.foldlevel=3
	vim.opt.laststatus=3
	vim.opt.mouse='a'
	vim.opt.confirm=true
	vim.opt.cmdheight=2
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "
	vim.opt.termguicolors = true
----

---- package manager: lazy.nvim
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git", "clone", "https://github.com/folke/lazy.nvim.git",
			"--filter=blob:none", "--branch=stable", lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)

	---- package list
	require("lazy").setup({
		-- 'sheerun/vim-polyglot',
		{ 'dracula/vim', name='dracula', priority=1000, config=function()
			vim.g.dracula_colorterm = 0
			vim.cmd.colorscheme 'dracula'
		end},
		{ 'neoclide/coc.nvim', branch='release', },
		'mattn/emmet-vim',
		'jiangmiao/auto-pairs',
		'tpope/vim-commentary',
		'tpope/vim-surround',
		'tpope/vim-fugitive',
		'prettier/vim-prettier',
		'farmergreg/vim-lastplace',
		'airblade/vim-gitgutter',
		'vim-airline/vim-airline',
		'vim-airline/vim-airline-themes',
		{ 'dense-analysis/ale', config=function()
			vim.g.ale_disable_lsp=1
			vim.g.ale_linters={javascript='eslint'}
		end},
		{ 'nvim-treesitter/nvim-treesitter', build=':TSUpdate', },
		-- 'github/copilot.vim',
		-- { 'rust-lang/rust.vim', ft='rust', },

		---- nerdtree & extensions
		'preservim/nerdtree',
		'Xuyuanp/nerdtree-git-plugin',
		'ryanoasis/vim-devicons',
		'tiagofumo/vim-nerdtree-syntax-highlight',
		---- markdown
		'junegunn/goyo.vim',
		{ "iamcco/markdown-preview.nvim", build='pnpm up && cd app && pnpm install',
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			-- config=function() ---- TODO fix
				-- vim.g.mkdp_refresh_slow=1
				-- vim.g.mkdp_markdown_css=''
				-- vim.g.mkdp_open_to_the_world=1
				-- vim.g.mkdp_port=8080
				-- vim.g.mkdp_browserfunc = function(url) print(a.url) end
				-- vim.g.mkdp_echo_preview_url = 1
			-- end,
		init=function() vim.g.mkdp_filetypes={"markdown"} end, ft = { "markdown" }, },
		-- { 'sidofc/mkdx', ft='markdown', },
		{ 'godlygeek/tabular', ft='markdown', },
		{ 'preservim/vim-markdown', config=function()
			vim.g.vim_markdown_frontmatter = 1
			-- vim.g.vim_markdown_new_list_item_indent = 2
		end, ft='markdown', },
		{ 'scuilion/markdown-drawer', ft='markdown', },
		{ 'clarke/vim-renumber', ft='markdown', },

		---- additional setup
		---- :CocInstall coc-tsserver coc-json coc-html coc-css coc-emmet
		---- TODO coc extensions in npm , tudo later
			-- { 'neoclide/coc.nvim', branch='release', build='pnpm i --frozen-lockfile', }
			-- { 'neoclide/coc-tsserver', build='pnpm i --frozen-lockfile', }
			-- { 'neoclide/coc-json', build='pnpm i --frozen-lockfile', }
			-- { 'neoclide/coc-html', build='pnpm i --frozen-lockfile', }
			-- { 'neoclide/coc-css', build='pnpm i --frozen-lockfile', }
			-- { 'neoclide/coc-emmet', build='pnpm i --frozen-lockfile', }
		---- revisit: vim-telescope , limelight
			-- 'vimwiki/vimwiki',
			-- 'ycm-core/YouCompleteMe',
			-- 'ErichDonGubler/vim-sublime-monokai',
		----
	})
----

vim.cmd [[
""" MISC
	""" rd maps i dont use anymore
		" nmap <F3> i<C-R>=strftime("%m-%d")<CR><Esc>
		" imap <F3> <C-R>=strftime("%m-%d")<CR>
		" in write mode, map super to esc
		" nmap <F3> i<C-R>=strftime("%m-%d")<CR><Esc>
		" imap <SUPER> <C-R>=strftime("%m-%d")<CR>
		""" https://shapeshed.com/vim-netrw/
		" let g:netrw_winsize = 75
		" let g:netrw_liststyle = 3
		" let g:netrw_browse_split = 3
	"""

	""" primeagen VIM REMAPS
		" 5 yank to end of line
		nnoremap Y y$
		" 4 keep it centered
		nnoremap n nzzzv
		nnoremap N Nzzzv
		nnoremap J mzJ`z
		" 3 undo breakpoints
		inoremap , ,<c-g>u
		inoremap , ,<c-g>u
		inoremap ! !<c-g>u
		inoremap ? ?<c-g>u
		" 2 jumplist mutations
		nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "" ) . 'k'
		nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "" ) . 'j'
		" 1 moving text
		vnoremap J :m '>+1<CR>gv=gv
		vnoremap K :m '<-2<CR>gv=gv
		inoremap <C-j> <esc>:m .+1<CR>==
		inoremap <C-k> <esc>:m .-2<CR>==
		nnoremap <leader>j :m .+1<CR>==
		nnoremap <leader>k :m .-2<CR>==
	"""

	""" autoread || reload file on focus
		" https://stackoverflow.com/questions/2490227/how-does-vims-autoread-work/45428958#45428958
		" https://vim.fandom.com/wiki/Have_Vim_check_automatically_if_the_file_has_changed_externally
		au FocusGained,BufEnter * checktime
	"""

	""" nerdtree options
		" autocmd VimEnter * NERDTree | wincmd p
		" Start NERDTree when Vim is started without file arguments.
		autocmd StdinReadPre * let s:std_in=1
		" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
		" autocmd StdinReadPre * let s:std_in=1
		" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
		""" nerdtree options , recommended defaults
		let NERDTreeShowHidden=1
		nnoremap <leader>n :NERDTreeFocus<CR>
		nnoremap <C-n> :NERDTree<CR>
		nnoremap <C-t> :NERDTreeToggle<CR>
		nnoremap <C-f> :NERDTreeFind<CR>
		"
		" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
		autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
				\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
	"""

	""" coc settings, trial period
		" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
		" delays and poor user experience.
		set updatetime=300
		"
		" Don't pass messages to |ins-completion-menu|.
		set shortmess+=c
		"
		" Always show the signcolumn, otherwise it would shift the text each time
		" diagnostics appear/become resolved.
		set signcolumn=number
		"
		" Use tab for trigger completion with characters ahead and navigate.
		" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
		" other plugin before putting this into your config.
		inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ CheckBackspace() ? "\<TAB>" :
			\ coc#refresh()
		inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
		"
		function! CheckBackspace() abort
			let col = col('.') - 1
			return !col || getline('.')[col - 1]  =~# '\s'
		endfunction
		"
		" Use <c-space> to trigger completion.
		inoremap <silent><expr> <c-space> coc#refresh()
		"
		" GoTo code navigation.
		nmap <silent> gd <Plug>(coc-definition)
		nmap <silent> gy <Plug>(coc-type-definition)
		nmap <silent> gi <Plug>(coc-implementation)
		nmap <silent> gr <Plug>(coc-references)
		""" coc global extensions
		let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-emmet']
	"""

	""" some rust
			""" from https://blog.logrocket.com/configuring-vim-rust-development/
					" let g:rustfmt_autosave = 1
					" let g:rustfmt_emit_files = 1
					" let g:rustfmt_fail_silently = 0
					"
					" inoremap <silent><expr> <TAB>
					" \ pumvisible() ? "\<C-n>" :
					" \ <SID>check_back_space() ? "\<TAB>" :
					" \ coc#refresh()
					" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
					"
					" function! s:check_back_space() abort
					" let col = col('.') - 1
					" return !col || getline('.')[col - 1]  =~# '\s'
					" endfunction
					"
					" inoremap <silent><expr> <c-space> coc#refresh()
					"
					" nmap <silent> gd <Plug>(coc-definition)
					" nmap <silent> gy <Plug>(coc-type-definition)
					" nmap <silent> gi <Plug>(coc-implementation)
					" nmap <silent> gr <Plug>(coc-references)
			"""
			""" from https://petermalmgren.com/rc-batch-day-9/
					"autocmd BufNewFile,BufRead *.rs set filetype=rust
					"let g:ale_linters = {
					"\  'rust': ['analyzer'],
					"\}
					"
					"let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }
					"
					"" Optional, configure as-you-type completions
					"set completeopt=menu,menuone,preview,noselect,noinsert
					"let g:ale_completion_enabled = 1
					"
					"nnoremap <C-LeftMouse> :ALEGoToDefinition<CR>
			"""
	"""
"""
]]
