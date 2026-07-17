#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

stow_dotfiles() {
  cd "$DOTFILES_DIR"
  echo "==> Stowing configs..."
  for pkg in hypr waybar swaync wofi gtk kitty; do
    echo "  stow $pkg"
    stow "$pkg"
  done
  echo "==> Stowing system configs..."
  echo "  sudo stow greetd"
  sudo stow greetd
  echo "Dotfiles linked."
}

install_packages() {
  PACKAGES=(
    hyprland waybar sway-notification-center wofi kitty
    greetd tuigreet
    hyprpaper hypridle hyprlock hyprpolkitagent
    grim slurp swappy
    cliphist wl-clipboard
    playerctl pavucontrol
    network-manager network-manager-applet network-manager-gnome
    thunar
    btop wlogout stow brightnessctl numlockx
    jq gnome-keyring libnotify-bin hyprland-guiutils
    fonts-jetbrains-mono
  )
  echo "==> Installing packages..."
  sudo apt-get update
  sudo apt-get install -y "${PACKAGES[@]}"
}

case "${1:-}" in
  --dotfiles)
    stow_dotfiles
    ;;
  --help|-h)
    echo "Usage: ./install.sh [--dotfiles]"
    echo "  (no args)  — full install (packages + dotfiles)"
    echo "  --dotfiles — dotfiles only (stow symlinks)"
    ;;
  "")
    install_packages
    stow_dotfiles
    echo ""
    echo "All done! Log out and log back in."
    echo ""
    echo "Note: Install JetBrainsMono Nerd Font manually from"
    echo "  https://www.nerdfonts.com/font-downloads"
    echo "  for full icon support in waybar and kitty."
    ;;
  *)
    echo "Unknown option: $1"
    echo "Usage: ./install.sh [--dotfiles]"
    exit 1
    ;;
esac
