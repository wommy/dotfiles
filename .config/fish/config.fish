if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x fish_greeting

## ABBRs newer, native
abbr -a rsync rsync --info=stats1,progress2 --modify-window=1 -vzhPiSr -n
abbr -a diff git diff --color-words

### programs derrived
### nala install build-essential ; curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh; cargo install eza ; cargo install --locked bat ; cargo install zoxide --locked ; git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf ; ~/.fzf/install ;
abbr -a lss eza --group-directories-first -a --git --git-ignore --tree -L 1
abbr -a catt bat --paging=never
fzf --fish | source
abbr -a fzfp fzf --preview \'bat --style numbers --colors always {}\'
zoxide init fish | source

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
# set -x GOROOT /usr/local/go
set -x GOROOT $LOCAL_SHARE/go
set -x GOBIN $GOROOT/bin
set -x PATH $PATH $GOBIN
set -x GOPATH $LOCAL_SHARE/go
# zig
set -x PATH $PATH $LOCAL_SHARE/zig-0.12.0/
## bun
set -x PATH $PATH $HOME/.bun/bin 
