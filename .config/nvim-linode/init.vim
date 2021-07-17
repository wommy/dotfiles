set nocompatible
filetype plugin on
syntax on

let g:netrw_winsize = 25
let g:netrw_liststyle = 3

set shiftwidth=2
set tabstop=2

set number
set relativenumber
set nowrap

set autoindent
set smartindent

" set clipboard+=unnamedplus

" set breakindent
" set breakindentopt=shift:2,min:40,sbr
" set showbreak=>>

call plug#begin('~/.config/nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
" Plug 'morhetz/gruvbox'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'

call plug#end()

" colorscheme sublimemonokai
" colorscheme gruvbox
" set background=dark
colorscheme dracula

