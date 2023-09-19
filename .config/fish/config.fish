if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x fish_greeting
# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
