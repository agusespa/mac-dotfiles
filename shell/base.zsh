export EDITOR='nvim'

export TMUXINATOR_CONFIG="$HOME/Code/tmux-projects"


if [ -n "$TMUX" ]; then
  alias nvim='TERM=tmux-256color nvim'
fi

alias la="ls -A"
alias ll="ls -l"
