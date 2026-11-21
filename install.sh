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
backup_if_exists "$HOME/.config/ghostty/config"
backup_if_exists "$HOME/.config/starship.toml"
backup_if_exists "$HOME/.aerospace.toml"

ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"
ln -sf "$DOTFILES/ghostty/config" "$HOME/.config/ghostty/config"
ln -sf "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"
ln -sf "$DOTFILES/aerospace/aerospace.toml" "$HOME/.aerospace.toml"

echo "Dotfiles installed ✔"

