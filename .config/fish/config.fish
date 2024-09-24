if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x fish_greeting

## ABBRs newer, native
abbr -a rsync rsync --info=stats1,progress2 --modify-window=1 -vzhPiSrn
abbr -a diff git diff --color-words

### programs derrived
### cargo install eza ; cargo install --locked bat ; cargo install zoxide --locked ; nala install thefuck -y ; git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf ; ~/.fzf/install ;
###
## cargo install eza ;
abbr -a ls eza --group-directories-first -a --git --git-ignore --tree -L 1
## cargo install --locked bat ;
abbr -a cat bat --paging=never
## git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf ; ~/.fzf/install ;
fzf --fish | source
abbr -a fzfp fzf --preview \'bat --style numbers --colors always {}\'
## cargo install zoxide --locked ;
zoxide init fish | source
## nala install thefuck -y ;
# thefuck --alias tf | source

## local share var
set -x LOCAL_SHARE $HOME/.local/share 

## pnpm
set -x PNPM_HOME $LOCAL_SHARE/pnpm
set -x PATH $PATH $PNPM_HOME
## pnpm end
## rust
set -x CARGO $HOME/.cargo
set -x PATH $PATH $CARGO/bin
## go
set -x GOROOT /usr/local/go
set -x GOBIN $GOROOT/bin
set -x PATH $PATH $GOBIN
set -x GOPATH $LOCAL_SHARE/go
# zig
set -x PATH $PATH $LOCAL_SHARE/zig-0.12.0/
## bun
set -x PATH $PATH $HOME/.bun/bin 
