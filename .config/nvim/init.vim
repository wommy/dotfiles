set shiftwidth=2
set tabstop=2

set nocompatible
filetype plugin on
syntax on

colorscheme sublimemonokai

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

