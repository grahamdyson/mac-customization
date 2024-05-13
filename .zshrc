export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$(pyenv root)/shims"
export PATH="$PATH:/Users/gdyson/.dotnet:/Users/gdyson/.dotnet/tools"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

export EDITOR='code -w'

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias ls='ls -A'
alias date='gdate'

export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
alias podman-sock="rm -f /tmp/podman.sock && ssh -i ~/.ssh/podman-machine-default -p $(podman system connection list --format=json | jq '.[0].URI' | sed -E 's|.+://.+@.+:([[:digit:]]+)/.+|\1|') -L'/tmp/podman.sock:/run/user/1000/podman/podman.sock' -N core@localhost"
export TESTCONTAINERS_RYUK_DISABLED=true

export WORDCHARS=''

alias bastion1='ssh -i ~/.ssh/stronghold gdyson@secure-bastion-01.cs.aws-ue1.usp.czrs.io'
alias bastion2='ssh -i ~/.ssh/stronghold gdyson@secure-bastion-02.cs.aws-ue1.usp.czrs.io'

alias braved='open -n -a /Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser --args http://localhost:3000 --user-data-dir="/Users/gdyson/Library/Application Support/BraveSoftware/Brave-Browser/Profile 4" --disable-web-security'

frp () {
  DEVICE_ID=$1
  NAMESPACE=$2
  CLUSTER=$3
  [[ -z ${DEVICE_ID} || -z ${NAMESPACE} || -z ${CLUSTER} ]] && echo "specify deviceid namespace cluster" && return 1
  DEVICE_USER="ops-emergency-user"
  FRP_USER="gdyson"
  FRP_HOST="frp-ssh.${NAMESPACE}.${CLUSTER}.aws-us-east-1.${CLUSTER}.williamhill.plc"

  echo "Getting FRP port for device ${DEVICE_ID} from FRP host ${FRP_HOST}"
  FRP_DYNAMIC_PORT=$(ssh ${FRP_USER}@${FRP_HOST} grep Port /opt/frp/ssh_config/${DEVICE_ID}.conf | awk '{print $2}')

  echo "Finding free local port.."
  [[ -z ${FRP_DYNAMIC_PORT} ]] && echo "Unable to find FRP port for ${DEVICE_ID}, is it online?" && return 1
  
  REMOTE_PORT_1=9222;LOCAL_PORT_1=${REMOTE_PORT_1}; while LOCAL_PORT_1=$(echo "${LOCAL_PORT_1} + 1" | bc); lsof -nP -i4TCP:${LOCAL_PORT_1} | grep -q LISTEN; do continue; done
  REMOTE_PORT_2=9223;LOCAL_PORT_2=${REMOTE_PORT_2}; while LOCAL_PORT_2=$(echo "${LOCAL_PORT_2} + 1" | bc); lsof -nP -i4TCP:${LOCAL_PORT_2} | grep -q LISTEN; do continue; done

  echo "Creating tunnel to device ${DEVICE_ID} via FRP port ${FRP_DYNAMIC_PORT}"
  echo "Open this URL: http://localhost:${LOCAL_PORT_1} http://localhost:${LOCAL_PORT_2}"
  ssh -N -p${FRP_DYNAMIC_PORT} -L ${LOCAL_PORT_1}:127.0.0.1:${REMOTE_PORT_1} -L ${LOCAL_PORT_2}:127.0.0.1:${REMOTE_PORT_2} -J ${FRP_HOST} ${DEVICE_USER}@127.0.0.1
}