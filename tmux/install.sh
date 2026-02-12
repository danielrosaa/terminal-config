#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
PLUGINS_DIR="$SCRIPT_DIR/plugins"

# ---- TPM (Tmux Plugin Manager) ----
TPM_DIR="$PLUGINS_DIR/tpm"
if [ -d "$TPM_DIR" ]; then
  echo "TPM already installed, skipping..."
else
  echo "Cloning TPM..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

# ---- Install plugins via TPM ----
echo "Installing tmux plugins via TPM..."
"$TPM_DIR/bin/install_plugins"

echo -e "\n------====== Tmux installed ======------"
echo "Restart tmux or press prefix + I to reload plugins."
