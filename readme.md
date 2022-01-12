# init

## TODO

- [ ] finish aliases

## quickstart

1. git submodule add `${ GITHUB_SSH_PATH }` .config/nvim/pack/w0m/start/ `${PLUGIN_NAME}`

2. git add .gitmodules .config/nvim/pack/w0m/start/ `${PLUGIN_NAME}`

3. git commit

## nvim

https://shapeshed.com/vim-packages/

### commands

`git submodule add $(github/url).git .config/nvim/pack/w0m/start/` + $(name) -! NO trailing `/`

`git add .gitmodules .config/nvim/pack/w0m/start/` + $(name) -! no trailing `/`
  
`git commit`


## [symbolic links](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/#creating-symlinks-to-a-directory)
### formula

`ln -s ~/projects_current/dotfiles/`+var ` ~/`+var

`ln -s FROM TO`

### list of 

- nvim
	- `ln -s ~/projects_current/dotfiles/.config/nvim ~/.config/nvim`
	- `ln -s ~/projects_current/dotfiles/.config/nvim/pack ~/.local/share/nvim/site/`
- tmux
- zsh
- fish
- i3
	- `mv ~/.config/i3 ~/projects_current/dotfiles/.config/i3`
	- `ln -s /home/w0m/projects_current/dotfiles/.config/i3/ ~/.config/i3`
- mpv
  - `ln -s /home/w0m/projects_current/dotfiles/.config/mpv ~/.config/`
- aliash
	- `ln -s projects_current/dotfiles/.aliash ~/`
- rofi
	-	`ln -s /home/w0m/projects_current/dotfiles/.config/rofi ~/.config/`
- zathura
	- `ln -s ~/dotfiles/.config/zathura ~/.config/zathura`

## other links

why i chose [.local path](https://stackoverflow.com/questions/48700563/how-do-i-install-plugins-in-neovim-correctly)
$XDG_CONFIG_HOME
