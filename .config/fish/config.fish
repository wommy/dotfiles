if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x fish_greeting

## ABBRs newer
abbr -a rsync rsync --info=stats1,progress2 --modify-window=1 -vzhPiSrn
abbr -a ls eza -a --git --group-directories-first --git-ignore
abbr -a ll eza -a --git --group-directories-first --git-ignore --tree -L 3
abbr -a cat bat

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
set -x GOBIN usr/local/go/bin
set -x PATH $PATH $GOBIN
# zig
set -x PATH $PATH $LOCAL_SHARE/zig-0.12.0/
## bun
set -x PATH $PATH $HOME/.bun/bin 
