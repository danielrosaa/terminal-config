#!/usr/bin/env bash
# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

# updateNvimConfigFilesOnly

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
DOTFILES_PATH=$(dirname "$SCRIPT_DIR")

mkdir ~/.config || true
rm "$NVIM_CONFIG_PATH" || true
ln -fs "$DOTFILES_PATH/nvim" "$NVIM_CONFIG_PATH" || true

echo "Installing Lazy package manager"
nvim --headless -c "+Lazy! sync" +qa &>/dev/null
echo "Lazy package manager installed"

sleep 1

cleanUpMasonTempFiles

echo -e "\n------====== Neovim installed ======------"
echo "Next time you start neovim, Mason will download necessary packages automatically"
