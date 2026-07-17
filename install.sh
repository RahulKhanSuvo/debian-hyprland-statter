#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing stow..."
if ! command -v stow &>/dev/null; then
  sudo apt-get install -y stow
fi

cd "$DOTFILES_DIR"

echo "==> Stowing configs..."
for pkg in hypr waybar swaync wofi gtk kitty; do
  echo "  stow $pkg"
  stow "$pkg"
done

echo "==> Stowing system configs (needs sudo)..."
echo "  sudo stow greetd"
sudo stow greetd

echo ""
echo "Done! Dotfiles are now symlinked into place."
echo "To update later:"
echo "  1. Edit files in ~/.config/ (they're symlinks into ~/dotfiles/)"
echo "  2. Commit and push from ~/dotfiles/"
