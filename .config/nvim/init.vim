set nocompatible
filetype plugin on
syntax on

" in write mode, map super to esc
" nmap <F3> i<C-R>=strftime("%m-%d")<CR><Esc>
" imap <SUPER> <C-R>=strftime("%m-%d")<CR>

" https://shapeshed.com/vim-netrw/
let g:netrw_winsize = 75
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

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


"""plug"""

call plug#begin('~/projects_current/dotfiles/.config/nvim/plugged')

" needed
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" dunno what these do
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'

" ? FIXME
" Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'dracula/vim', {'as':'dracula'}

" github copilot
Plug 'github/copilot.vim'

" couldnt find this again if i tried, dont think id even want to
" plantuml
" Plug 'aklt/plantuml-syntax'
" Plug 'weirongxu/plantuml-previewer.vim' 
" Plug 'tyru/open-browser.vim'

call plug#end()

let g:dracula_colorterm = 0
colorscheme dracula
" colorscheme sublimemonokai
" let g:sublimemonokai_term_italic = 1
" picom w/ ^
" hi Normal ctermbg=NONE guibg=NONE

let g:vimwiki_list = [{'path': '~/projects_current/rd/vimwiki/'}]

