# init

## quickstart

  - 1st
    - `git submodule add `
    - PASTE IN GITHUB URL
      - https://github.com/tpope/vim-surround
	- `https://github.com/`
	- AUTHOR_NAME
	- `/`
	- PLUGIN_NAME
    - `.git .config/nvim/pack/w0m/start/`
    - TYPE PLUGIN_NAME
  - 2nd
    - `git add .gitmodules .config/nvim/pack/w0m/start/`
    - TYPE PLUGIN_NAME
  - 3rd
    - `git commit -m 'added `
    - PLUGIN_NAME
    - ` to nvim`

## nvim

https://shapeshed.com/vim-packages/

### commands

`git submodule add $(github/url).git .config/nvim/pack/w0m/start/` + $(name) -! NO trailing `/`

`git add .gitmodules .config/nvim/pack/w0m/start/` + $(name) -! no trailing `/`
  
`git commit`


## [symbolic links](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/#creating-symlinks-to-a-directory)

`ln -s ~/projects_current/dotfiles/.config/nvim ~/.config/nvim`

`ln -s ~/projects_current/dotfiles/.config/nvim/pack ~/.local/share/nvim/site/`

## other links

why i chose [.local path](https://stackoverflow.com/questions/48700563/how-do-i-install-plugins-in-neovim-correctly)

