#!/bin/bash

set -euo pipefail

log() {
  echo
  echo "----------------------------------------------------------------------------"
  echo "$1"
  echo "----------------------------------------------------------------------------"
  echo
}

switch_to_zsh() {
  if [[ "${SHELL}" == "/bin/zsh" ]]; then
    log "Looks like zsh is already enabled. Skipping..."
    return
  fi
  chsh -s /bin/zsh
}

log "Hold on tight while I am provisioning your machine. What could go wrong?"

stow -t $HOME zsh git nvim tmux utils
switch_to_zsh

log "All set up! You might have to restart your terminal session for the changes to take effect."
