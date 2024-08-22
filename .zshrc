export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$(pyenv root)/shims"
export PATH="$PATH:/Users/gdyson/.dotnet:/Users/gdyson/.dotnet/tools"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/avr-gcc@8/bin:$PATH"

export EDITOR='code -w'

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias ls='ls -A'
alias date='gdate'

export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
export MAVEN_OPTS="-Dmaven.resolver.transport=wagon -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true"    

export TESTCONTAINERS_RYUK_DISABLED=true

export BROWSER=none
export WORDCHARS=''

alias braved='open -n -a /Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser --args http://localhost:3000 --user-data-dir="/Users/gdyson/Library/Application Support/BraveSoftware/Brave-Browser/Profile 4" --disable-web-security'

source ~/.zshrc-work-only