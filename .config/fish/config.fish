if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x fish_greeting

# pnpm
set -x PNPM_HOME $HOME/.local/share/pnpm
set -x PATH $PATH $PNPM_HOME
# pnpm end
# rust
set -x CARGO $HOME/.cargo
set -x PATH $PATH $CARGO/bin
