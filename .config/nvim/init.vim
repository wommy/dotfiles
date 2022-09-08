""" settings , options
	filetype plugin indent on
	syntax on
	set number relativenumber
	set nowrap
	set shiftwidth=2 tabstop=2 autoindent smartindent
	set scrolloff=999
	set clipboard+=unnamedplus
	set breakindent breakindentopt=shift:2,min:40,sbr showbreak=>> 
	set foldmethod=indent foldlevelstart=3 foldlevel=3
	set laststatus=3
	set mouse=a
	set confirm
	set autoread wildmenu
	set cmdheight=2
"""
"
let g:ale_disable_lsp = 1
"""plug
	call plug#begin('~/dotfiles/.config/nvim/plugged')
	" Plug 'sheerun/vim-polyglot'
	Plug 'dracula/vim', {'as':'dracula'}
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'mattn/emmet-vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'prettier/vim-prettier'
	Plug 'farmergreg/vim-lastplace'
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'dense-analysis/ale'
	Plug 'nvim-treesitter/nvim-treesitter'
	" Plug 'github/copilot.vim'
	" Plug 'rust-lang/rust.vim', { 'for': 'rust' }
	"
	" nerdtree & extensions
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	" markdown
	Plug 'junegunn/goyo.vim'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown' }
	" Plug 'sidofc/mkdx', { 'for': 'markdown' }
	Plug 'godlygeek/tabular', { 'for': 'markdown' }
	Plug 'preservim/vim-markdown', { 'for': 'markdown' }
	Plug 'scuilion/markdown-drawer', { 'for': 'markdown' }
	Plug 'clarke/vim-renumber', { 'for': 'markdown' }
	" additional setup

	" :CocInstall coc-tsserver coc-json coc-html coc-css coc-emmet
	""" TODO coc extensions in npm , tudo later
		" Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'pnpm i --frozen-lockfile'}
		" Plug 'neoclide/coc-tsserver', {'do': 'pnpm i --frozen-lockfile'}
		" Plug 'neoclide/coc-json', {'do': 'pnpm i --frozen-lockfile'}
		" Plug 'neoclide/coc-html', {'do': 'pnpm i --frozen-lockfile'}
		" Plug 'neoclide/coc-css', {'do': 'pnpm i --frozen-lockfile'}
		" Plug 'neoclide/coc-emmet', {'do': 'pnpm i --frozen-lockfile'}
	"""
		""" revisit: vim-telescope , limelight
		" Plug 'vimwiki/vimwiki'
		" Plug 'ycm-core/YouCompleteMe'
		" Plug 'ErichDonGubler/vim-sublime-monokai'
	"""
	call plug#end()
"""
"
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

""" MISC

	" ALE
	let g:ale_linters = {
	\ 'javascript': ['eslint'],
	\}

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

""" dracula
	let g:dracula_colorterm = 0
	colorscheme dracula
"""

""" coc global extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-emmet']

""" markdown preview
	" let g:mkdp_refresh_slow=1
	" let g:mkdp_markdown_css='~/dotfiles/.config/nvim/plugged/vim-markdown/css/github.css'
	" let g:mkdp_markdown_css='~/.local/share/pnpm/global/5/node_modules/github-markdown-css/github-markdown.css'
	let g:mkdp_open_to_the_world = 1
	" let g:mkdp_open_ip = '192.168.10.62' " change to you vps or vm ip
	let g:mkdp_port = 8080
	" function! g:EchoUrl(url)
	" 		:echo a:url
	" endfunction
	" let g:mkdp_browserfunc = 'g:EchoUrl'
	let g:mkdp_echo_preview_url = 1
"""

""" preservim/vim-markdown
	let g:vim_markdown_frontmatter = 1
	" let g:vim_markdown_new_list_item_indent = 2
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
