#!/bin/bash

set -euo pipefail

install_ansible() {
  log "installing/upgrading Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install ansible
}


log() {
  echo
  echo "----------------------------------------------------------------------"
  echo "$1"
  echo "----------------------------------------------------------------------"
  echo
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

log "Don't forget to read the post install steps in README.md."
