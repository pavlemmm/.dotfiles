#!/usr/bin/env bash

set -e

EMAIL="pavlemitic03@gmail.com"
KEY_PATH="$HOME/.ssh/id_ed25519"

mkdir -p ~/.ssh
chmod 700 ~/.ssh

if [ -f "$KEY_PATH" ]; then
  echo "SSH already exists on $KEY_PATH"
  exit 0
fi

echo "Generating SSH key..."
ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH"

echo "Starting ssh-agent..."
eval "$(ssh-agent -s)"
ssh-add "$KEY_PATH"

if command -v wl-copy &> /dev/null; then
  cat "$KEY_PATH.pub" | wl-copy
  echo "Public key copied at clipboard"
else
  echo "wl-copy not found, copy:"
  echo "--------------------------------"
  cat "$KEY_PATH.pub"
  echo "--------------------------------"
fi
