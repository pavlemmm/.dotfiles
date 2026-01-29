#!/usr/bin/env bash

# Install oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s
echo "Oh-my-posh has been installed"

# Install opencode
curl -fsSL https://opencode.ai/install | bash
echo "Opencode has been installed"

# Install zen browser
curl -L -o zen.linux-x86_64.tar.xz "https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-x86_64.tar.xz"
tar -xvf zen.linux-x86_64.tar.xz
sudo mv zen /opt/zen-browser
sudo ln -s /opt/zen-browser/zen /usr/local/bin/zen
rm zen.linux-x86_64.tar.xz
