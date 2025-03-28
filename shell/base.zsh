export EDITOR='nvim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/14/bin"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$HOME/.jenv/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export PATH="$PATH:$HOME/Library/Android/sdk/tools"
export PATH="$PATH:$HOME/Code/go-lib/bin"
export PATH="$PATH:$HOME/Code/cli-tools/mux"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export C_INCLUDE_PATH="/opt/homebrew/include/glib-2.0"
export GOPATH="$HOME/Code/go-lib"
export CLASSPATH="/Library/Saxon/saxon-he-12.4.jar"
export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/corretto-21.0.6/Contents/Home"
export ANDROID_HOME="$HOME/Library/Android/sdk"

alias la="ls -A"
alias ll="ls -l"
