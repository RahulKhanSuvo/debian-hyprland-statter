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

ALL_PACKAGES="hypr waybar swaync wofi gtk kitty greetd"
USER_PACKAGES="hypr waybar swaync wofi gtk kitty"

stow_single() {
  local pkg="$1"
  cd "$DOTFILES_DIR"
  if [ "$pkg" = "greetd" ]; then
    echo "  sudo stow greetd"
    sudo stow greetd
  elif echo "$USER_PACKAGES" | grep -qw "$pkg"; then
    echo "  stow $pkg"
    stow "$pkg"
  else
    echo "Unknown package: $pkg"
    echo "Available: $ALL_PACKAGES"
    exit 1
  fi
}

case "${1:-}" in
  --dotfiles)
    if [ $# -gt 1 ]; then
      shift
      for pkg in "$@"; do stow_single "$pkg"; done
    else
      stow_dotfiles
    fi
    ;;
  --help|-h)
    echo "Usage: ./install.sh [--dotfiles] [package...]"
    echo "  (no args)       — full install (packages + all dotfiles)"
    echo "  --dotfiles      — all dotfiles only"
    echo "  --dotfiles hypr — just hyprland config"
    echo "  --dotfiles waybar — just waybar config"
    echo "  Packages: $ALL_PACKAGES"
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
    echo "Unknown: $1"
    echo "Usage: ./install.sh [--dotfiles] [package...]"
    exit 1
    ;;
esac
