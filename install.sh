#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"

echo "Installing dotfiles..."

# Ensure .config exists
mkdir -p "$HOME/.config"

# Backup existing files if they exist and are not symlinks
backup_if_exists() {
  if [ -e "$1" ] && [ ! -L "$1" ]; then
    echo "Backing up $1"
    mv "$1" "$1.backup"
  fi
}

backup_if_exists "$HOME/.zshrc"
backup_if_exists "$HOME/.gitconfig"
backup_if_exists "$HOME/.tmux.conf"
backup_if_exists "$HOME/.config/nvim"

ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"

echo "Dotfiles installed ✔"

