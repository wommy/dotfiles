" set encoding=UTF-8
set nocompatible
filetype plugin indent on
syntax on
" in write mode, map super to esc
" nmap <F3> i<C-R>=strftime("%m-%d")<CR><Esc>
" imap <SUPER> <C-R>=strftime("%m-%d")<CR>
" https://shapeshed.com/vim-netrw/
" let g:netrw_winsize = 75
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 3
set number relativenumber
set nowrap
set shiftwidth=2 tabstop=2 autoindent smartindent
set so=999
set clipboard+=unnamedplus
set breakindent breakindentopt=shift:2,min:40,sbr showbreak=>> 
set foldmethod=indent foldlevelstart=2 foldlevel=2

set laststatus=3
set mouse=a
set confirm
set autoread wildmenu

" rd maps i dont use anymore
" nmap <F3> i<C-R>=strftime("%m-%d")<CR><Esc>
" imap <F3> <C-R>=strftime("%m-%d")<CR>

"
" primeagen VIM REMAPS
"
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

" autoread || reload file on focus
" https://stackoverflow.com/questions/2490227/how-does-vims-autoread-work/45428958#45428958
" https://vim.fandom.com/wiki/Have_Vim_check_automatically_if_the_file_has_changed_externally
au FocusGained,BufEnter * checktime

""" gonna replace this with CoC plugin
"""""" vim vue
"let g:vim_vue_plugin_config = { 
"  \'syntax': {
"  \   'template': ['html'],
"  \   'script': ['javascript','typescript'],
"  \   'style': ['css'],
"  \},
"  \'full_syntax': [],
"  \'initial_indent': [],
"  \'attribute': 0,
"  \'keyword': 0,
"  \'foldexpr': 0,
"  \'debug': 0,
"  \}
"" Example
"autocmd FileType vue inoremap <buffer><expr> : InsertColon()
""
"function! InsertColon()
"  let tag = GetVueTag()
"  return tag == 'template' ? ':' : ': '
"endfunction
""
"" Example: set local options based on syntax
"function! OnChangeVueSyntax(syntax)
"  echom 'Syntax is '.a:syntax
"  if a:syntax == 'html'
"    setlocal commentstring=<!--%s-->
"    setlocal comments=s:<!--,m:\ \ \ \ ,e:-->
"  elseif a:syntax =~ 'css'
"    setlocal comments=s1:/*,mb:*,ex:*/ commentstring&
"  else
"    setlocal commentstring=//%s
"    setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
"  endif
"endfunction

" nerdtree options
" autocmd VimEnter * NERDTree | wincmd p
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
""" nerdtree options
let NERDTreeShowHidden=1
""" more nerdtree , some recommended defaults
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"""plug"""

call plug#begin('~/dotfiles/.config/nvim/plugged')

" needed
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'

""" dunno what these do ? FIXME
" Plug 'vimwiki/vimwiki'
" Plug 'ycm-core/YouCompleteMe'

""" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'do': 'pnpm i --frozen-lockfile'}
""" coc extensions
" Plug 'neoclide/coc-tsserver', {'do': 'pnpm i --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'pnpm i --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'pnpm i --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'pnpm i --frozen-lockfile'}
Plug 'neoclide/coc-emmet', {'do': 'pnpm i --frozen-lockfile'}
""" disabled
" Plug 'neoclide/coc-prettier', {'do': 'pnpm i --frozen-lockfile'}
" Plug 'josa42/coc-sh', {'do': 'pnpm i --frozen-lockfile'}
" Plug 'neoclide/coc-yaml', {'do': 'pnpm i --frozen-lockfile'}
" Plug 'kkiyama117/coc-toml', {'do': 'pnpm i --frozen-lockfile'}
" Plug 'neoclide/coc-highlight', {'do': 'pnpm i --frozen-lockfile'}
" Plug 'neoclide/coc-eslint', {'do': 'pnpm i --frozen-lockfile'}
" Plug 'gera2ld/coc-markmap', {'do': 'pnpm i --frozen-lockfile'}
" Plug 'weirongxu/coc-markdown-preview-enhanced', {'do': 'pnpm i --frozen-lockfile'}
" Plug 'yaegassy/coc-volar', {'do': 'pnpm i --frozen-lockfile'}

" Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'dracula/vim', {'as':'dracula'}

" vue
" Plug 'leafOfTree/vim-vue-plugin'

" nerdtree, im caving
Plug 'preservim/nerdtree'
" and extensions
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" couldnt find this again if i tried, dont think id even want to
" plantuml
" Plug 'aklt/plantuml-syntax'
" Plug 'weirongxu/plantuml-previewer.vim' 
" Plug 'tyru/open-browser.vim'

""" tried vim-telescope , lost it in a git merge
""" ditto with goyo , limelight

""" markdown
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && pnpm i', 'for': 'markdown' }
Plug 'sidofc/mkdx', { 'for': 'markdown' }
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'preservim/vim-markdown', { 'for': 'markdown' }
Plug 'scuilion/markdown-drawer', { 'for': 'markdown' }
Plug 'clarke/vim-renumber', { 'for': 'markdown' }
Plug 'farmergreg/vim-lastplace'

call plug#end()

let g:dracula_colorterm = 0
colorscheme dracula
" colorscheme sublimemonokai
" let g:sublimemonokai_term_italic = 1
" picom w/ ^
" hi Normal ctermbg=NONE guibg=NONE
" let g:vimwiki_list = [{'path': '~/projects_current/rd/vimwiki/'}]
""" markdown preview
let g:mkdp_refresh_slow=1
" let g:mkdp_markdown_css='~/dotfiles/.config/nvim/plugged/vim-markdown/css/github.css'
let g:mkdp_markdown_css='~/.local/share/pnpm/global/5/node_modules/github-markdown-css/github-markdown.css'
let g:mkdp_open_to_the_world = 1

