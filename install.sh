#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

PACKAGES=(
  # Core
  hyprland waybar sway-notification-center wofi kitty
  greetd tuigreet

  # Hyprland extras
  hyprpaper hypridle hyprlock hyprpolkitagent

  # Screenshots
  grim slurp swappy

  # Clipboard
  cliphist wl-clipboard

  # Media
  playerctl pavucontrol

  # Network
  network-manager network-manager-applet network-manager-gnome

  # System
  btop wlogout stow brightnessctl numlockx
  jq gnome-keyring libnotify-bin

  # Fonts (JetBrainsMono from Debian repos)
  fonts-jetbrains-mono
)

echo "==> Installing packages..."
sudo apt-get update
sudo apt-get install -y "${PACKAGES[@]}"

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
echo "All done! Log out and log back in."
echo ""
echo "Note: Install JetBrainsMono Nerd Font manually from"
echo "  https://www.nerdfonts.com/font-downloads"
echo "  for full icon support in waybar and kitty."
