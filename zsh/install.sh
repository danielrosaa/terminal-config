#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
ZSH_DIR="$SCRIPT_DIR/.oh-my-zsh"

# ---- Oh My Zsh ----
if [ -d "$ZSH_DIR" ]; then
  echo "Oh My Zsh already installed at $ZSH_DIR, skipping..."
else
  echo "Cloning Oh My Zsh..."
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$ZSH_DIR"
fi

# ---- Powerlevel10k theme ----
P10K_DIR="$ZSH_DIR/custom/themes/powerlevel10k"
if [ -d "$P10K_DIR" ]; then
  echo "Powerlevel10k already installed, skipping..."
else
  echo "Cloning Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
fi

# ---- zsh-autosuggestions plugin ----
AUTOSUGGESTIONS_DIR="$ZSH_DIR/custom/plugins/zsh-autosuggestions"
if [ -d "$AUTOSUGGESTIONS_DIR" ]; then
  echo "zsh-autosuggestions already installed, skipping..."
else
  echo "Cloning zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions.git "$AUTOSUGGESTIONS_DIR"
fi

# ---- Symlinks ----
echo "Creating symlinks..."

ln -sf "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
echo "  ~/.zshrc -> $SCRIPT_DIR/.zshrc"

ln -sf "$SCRIPT_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
echo "  ~/.p10k.zsh -> $SCRIPT_DIR/.p10k.zsh"

echo -e "\n------====== Zsh installed ======------"
echo "Restart your terminal or run 'source ~/.zshrc' to apply changes."
