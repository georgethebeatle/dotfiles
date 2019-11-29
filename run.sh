#!/bin/bash

set -euo pipefail

install_ansible() {
  log "installing/upgrading Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install ansible
}


log() {
  echo
  echo "----------------------------------------------------------------------------"
  echo "$1"
  echo "----------------------------------------------------------------------------"
  echo
}

switch_to_zsh() {
  if [[ "$(echo $SHELL)" == "/bin/zsh" ]]; then
    log "Looks like zsh is already enabled. Skipping..."
    return
  fi
  chsh -s /bin/zsh
}

log "Hold on tight while I am provisioning your machine. What could go wrong?"

if ! which ansible-playbook > /dev/null 2>&1 ; then
  echo "ansible-playbook not found on \$PATH, installing"
  install_ansible
fi

(
cd "$(dirname "$0")"
ansible-playbook -i localhost, --con local playbook.yml
)

switch_to_zsh

log "All set up! You might have to restart your terminal session for the changes to take effect."
