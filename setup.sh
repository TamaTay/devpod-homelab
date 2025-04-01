#!/bin/bash
set -e

echo "🔧 Starte Setup für devpod-homelab..."

# Nix Setup
echo "🔧 Verlinke config.nix..."
mkdir -p "$HOME/.config/nixpkgs"
ln -sf "$PWD/config.nix" "$HOME/.config/nixpkgs/config.nix"

echo "📦 Installiere Pakete via Nix..."
nix-env -iA nixpkgs.myPackages

# Dotfiles
DOTFILES_REPO="https://github.com/TamaTay/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
  echo "📥 Klone Dotfiles..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

echo "🔗 Verlinke Dotfiles..."
ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

echo "🎨 Verlinke komplette LazyVim-Config..."
rm -rf "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

echo "✅ Setup abgeschlossen!"

