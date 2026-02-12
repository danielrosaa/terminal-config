#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

echo "========================================="
echo "  Dotfiles Installer"
echo "========================================="
echo ""

# ---- Zsh ----
echo "[1/3] Zsh + Oh My Zsh + Powerlevel10k"
echo "---------------------------------------"
"$DOTFILES_DIR/zsh/install.sh"
echo ""

# ---- Tmux ----
echo "[2/3] Tmux + TPM + Plugins"
echo "---------------------------------------"
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
echo "  ~/.tmux.conf -> $DOTFILES_DIR/tmux/.tmux.conf"
"$DOTFILES_DIR/tmux/install.sh"
echo ""

# ---- Neovim ----
echo "[3/3] Neovim"
echo "---------------------------------------"
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
echo "  ~/.config/nvim -> $DOTFILES_DIR/nvim"
echo -e "\n------====== Neovim installed ======------"
echo ""

echo "========================================="
echo "  All done!"
echo "========================================="
echo "Restart your terminal or run 'source ~/.zshrc' to apply changes."
