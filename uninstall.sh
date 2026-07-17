#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

cd "$DOTFILES_DIR"

echo "==> Unstowing configs..."
for pkg in hypr waybar swaync wofi gtk kitty; do
  echo "  stow -D $pkg"
  stow -D "$pkg"
done

echo "==> Unstowing system configs..."
for pkg in greetd; do
  echo "  sudo stow -D $pkg"
  sudo stow -D "$pkg"
done

echo ""
echo "All dotfiles symlinks removed. Original files kept in $DOTFILES_DIR"
