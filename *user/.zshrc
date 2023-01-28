# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git)

source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'

# Load Angular CLI autocompletion.
source <(ng completion script)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias mux="tmuxinator"
alias ls="ls -a"
