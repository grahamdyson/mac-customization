export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$(pyenv root)/shims"
export PATH="$PATH:/Users/gdyson/.dotnet"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

export EDITOR='code -w'

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias ls='ls -A'

export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
alias podman-sock="rm -f /tmp/podman.sock && ssh -i ~/.ssh/podman-machine-default -p $(podman system connection list --format=json | jq '.[0].URI' | sed -E 's|.+://.+@.+:([[:digit:]]+)/.+|\1|') -L'/tmp/podman.sock:/run/user/1000/podman/podman.sock' -N core@localhost"
export TESTCONTAINERS_RYUK_DISABLED=true

export WORDCHARS=''