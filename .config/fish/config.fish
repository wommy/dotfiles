if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x fish_greeting
set -gx PNPM_HOME "/home/wom/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
