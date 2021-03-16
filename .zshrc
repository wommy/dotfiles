# Set up the prompt

autoload -Uz promptinit vcs_info

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

promptinit
PS1="%~ %F{red}\$vcs_info_msg_0_%f "
RPS1=""
zstyle ':vcs_info:git:*' formats '%b'

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
# added deno
fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#
##### ALIASES
# 

# browser-sync
alias bsstart="sudo browser-sync start -s --host 0.0.0.0 --no-open"

# todo.txt
alias t="sudo todo.sh"

# ls: dir first, colors
alias ls="ls --group-directories-first --color=auto -a"

# rd stuffs
alias rddate="echo $(date) >> ./$(date +'%m-%d').md"
alias rdsbj='echo $1 >> ./$(date +"%m-%d").md'
alias rdnew="rddate; rdsbj $1"

# pushit
alias pushit="git add .; git commit; git push"

# redshift
alias redshift="redshift -P -O 4000"

# pypy
alias py="pypy3"

# mpv | help:  youtube-dl --list-formats URL
alias mpv="mpv --ytdl-format=22 $1"
# mpv audio
alias mpvA="mpv --ytdl-format=251 $1 --loop"

#
###### other
#

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# editor
export EDITOR=nvim
alias vim="nvim"

# deno
export DENO_INSTALL="/home/$USER/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# .config
export DOT_CONFIG="$HOME/.config"

# java
export JAVA_HOME="/usr/lib/jvm/java-14-openjdk/"
export PATH=$PATH:$JAVA_HOME/bin/
source /usr/share/nvm/init-nvm.sh
