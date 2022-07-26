-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	-- theme / dracula
	use 'sheerun/vim-polyglot'
	use 'mattn/emmet-vim'
	use 'jiangmiao/auto-pairs'
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'
	-- use 'rust-lang/rust.vim'
	-- use 'dense-analysis/ale'
	use {'dracula/vim', as= 'dracula' }
	-- nerdtree & extensions
	use 'preservim/nerdtree'
	use 'Xuyuanp/nerdtree-git-plugin'
	use 'ryanoasis/vim-devicons'
	use 'tiagofumo/vim-nerdtree-syntax-highlight'
	-- markdown
	use 'junegunn/goyo.vim'
	use {'iamcco/markdown-preview.nvim', run= 'cd app && pnpm i', cmd= 'markdown' }
	use {'sidofc/mkdx', cmd= 'markdown' }
	use {'godlygeek/tabular', cmd= 'markdown' }
	use {'preservim/vim-markdown', cmd= 'markdown' }
	use {'scuilion/markdown-drawer', cmd= 'markdown' }
	use {'clarke/vim-renumber', cmd= 'markdown' }
	use 'farmergreg/vim-lastplace'
	-- additional setup

	use 'prettier/vim-prettier'
	use 'github/copilot.vim'
	use {'neoclide/coc.nvim', branch= 'release'}

end)
