if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PNPM_HOME "/home/$USER/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH