set nocompatible
filetype plugin on
syntax on

let g:netrw_winsize = 25
let g:netrw_liststyle = 3

colorscheme sublimemonokai
" let g:sublimemonokai_term_italic = 1

set shiftwidth=2
set tabstop=2

set number
set relativenumber
set nowrap

set autoindent
set smartindent

set breakindent
set breakindentopt=shift:2,min:40,sbr
set showbreak=>>

nmap <F3> i<C-R>=strftime("%m-%d")<CR><Esc>
imap <F3> <C-R>=strftime("%m-%d")<CR>

call plug#begin('~/projects_current/dotfiles/.config/nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'ycm-core/YouCompleteMe'
Plug 'prettier/vim-prettier'
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'vimwiki/vimwiki'

Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim' 
Plug 'tyru/open-browser.vim'

call plug#end()

let g:vimwiki_list = [{'path': '~/projects_current/rd/vimwiki/'}]
