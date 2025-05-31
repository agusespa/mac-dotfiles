export EDITOR='nvim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$HOME/.jenv/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/Code/go-lib/bin"
export PATH="$PATH:$HOME/Code/cli-tools/mux"

export C_INCLUDE_PATH="/opt/homebrew/include/glib-2.0"
export GOPATH="$HOME/Code/go-lib"
export CLASSPATH="/Library/Saxon/saxon-he-12.4.jar"
export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/corretto-21.0.6/Contents/Home"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export TMUXINATOR_CONFIG="$HOME/Code/tmux-projects"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

if [ -n "$TMUX" ]; then
  alias nvim='TERM=tmux-256color nvim'
fi

alias la="ls -A"
alias ll="ls -l"
