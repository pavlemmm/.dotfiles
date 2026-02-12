#!/usr/bin/env bash

set -euo pipefail

# Install oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s
echo "Oh-my-posh has been installed"

# Install opencode
curl -fsSL https://opencode.ai/install | bash
echo "Opencode has been installed"


# Install zen browser (latest) -> /opt/zen-browser + /usr/local/bin/zen + desktop entry
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT

curl -L -o "$tmp/zen.tar.xz" "https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-x86_64.tar.xz"
tar -xf "$tmp/zen.tar.xz" -C "$tmp"
sudo rm -rf /opt/zen-browser
sudo mv "$tmp/zen" /opt/zen-browser
sudo ln -sf /opt/zen-browser/zen /usr/local/bin/zen

sudo tee /usr/local/share/applications/zen-browser.desktop >/dev/null <<'EOF'
[Desktop Entry]
Name=Zen Browser
Exec=zen %u
Terminal=false
Type=Application
Icon=/opt/zen-browser/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
StartupNotify=true
StartupWMClass=zen
EOF

echo "Zen browser has been installed"
