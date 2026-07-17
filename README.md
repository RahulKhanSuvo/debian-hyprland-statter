# dotfiles

Hyprland desktop config on Debian (trixie). Catppuccin-inspired colors — dark backgrounds, lavender accents, cyan highlights.

## What's inside

| Package  | What it configures                         |
|----------|--------------------------------------------|
| `hypr`   | Hyprland, hypridle, hyprlock, hyprpaper     |
| `waybar` | Status bar + media scripts                  |
| `swaync` | Notification center                         |
| `wofi`   | App launcher                                |
| `gtk`    | GTK theme (Yaru-Lavender-dark)              |
| `kitty`  | Terminal emulator                           |
| `greetd` | Login screen (tuigreet) — system config     |

## Quick start

```bash
# Install stow (symlink manager)
sudo apt install stow

# Clone and activate
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

## How stow works

Each folder (hypr, waybar, etc.) is a stow **package** that mirrors the filesystem root:

```
~/dotfiles/
└── hypr/
    └── .config/        ← mirrors $HOME
        └── hypr/
            └── hyprland.conf

stow hypr  →  ~/.config/hypr/hyprland.conf
               becomes a symlink into ~/dotfiles/hypr/
```

Edit files in `~/.config/` normally — changes go straight into the repo.

## Manual stow commands

```bash
stow hypr          # link hypr configs
stow waybar        # link waybar configs
stow -D waybar     # unlink waybar configs
sudo stow greetd   # system configs need sudo
```

## Adding new configs

```bash
mkdir -p ~/dotfiles/appname/.config/appname
mv ~/.config/appname/file ~/dotfiles/appname/.config/appname/
stow appname
```
