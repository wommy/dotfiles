set nocompatible
filetype plugin on
syntax on
" in write mode, map super to esc
" nmap <F3> i<C-R>=strftime("%m-%d")<CR><Esc>
" imap <SUPER> <C-R>=strftime("%m-%d")<CR>
" https://shapeshed.com/vim-netrw/
" let g:netrw_winsize = 75
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 3
set number
set relativenumber
set nowrap
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set so=999
set clipboard+=unnamedplus
set breakindent
set breakindentopt=shift:2,min:40,sbr
set showbreak=>>
set foldmethod=indent
set foldlevelstart=2
set foldlevel=2
set laststatus=3
""" mouse
set mouse=a
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
set autoread
au FocusGained,BufEnter * checktime

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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier'

" dunno what these do
Plug 'tpope/vim-fugitive'
" Plug 'vimwiki/vimwiki'

" ? FIXME
" Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'dracula/vim', {'as':'dracula'}

" github copilot
Plug 'github/copilot.vim'

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

" git gutter
Plug 'airblade/vim-gitgutter'

call plug#end()

let g:dracula_colorterm = 0
colorscheme dracula
" colorscheme sublimemonokai
" let g:sublimemonokai_term_italic = 1
" picom w/ ^
" hi Normal ctermbg=NONE guibg=NONE

" let g:vimwiki_list = [{'path': '~/projects_current/rd/vimwiki/'}]

