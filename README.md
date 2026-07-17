# Debian Hyprland Starter

One-command Hyprland desktop on Debian trixie/testing. Dark Catppuccin-inspired theme, sane keybinds, ready to go.

## Fresh install

```bash
# 1. Install Debian (trixie/testing) with standard tools
# 2. Clone dotfiles
sudo apt install stow git
git clone <your-repo-url> ~/dotfiles

# 3. Full install (packages + dotfiles)
cd ~/dotfiles
./install.sh

# 4. Reboot
systemctl reboot
```

## Dotfiles only

If packages are already installed, just link the configs:

```bash
cd ~/dotfiles
./install.sh --dotfiles          # all configs
./install.sh --dotfiles waybar   # just waybar
./install.sh --dotfiles hypr     # just hyprland
./install.sh --dotfiles kitty swaync  # pick multiple
```

Available: `hypr`, `waybar`, `swaync`, `wofi`, `gtk`, `kitty`, `greetd`

## What you get

| Package  | What it configures                     |
|----------|----------------------------------------|
| `hypr`   | Hyprland, hypridle, hyprlock, hyprpaper |
| `waybar` | Status bar + media module              |
| `swaync` | Notification center                    |
| `wofi`   | App launcher + emoji picker            |
| `gtk`    | Yaru-Lavender-dark theme + icons       |
| `kitty`  | Terminal with Catppuccin colors        |
| `greetd` | Login screen (tuigreet)                |

## Colors

| Token      | Hex       | Usage                               |
|------------|-----------|-------------------------------------|
| Background | `#18181b` | Waybar, swaync, GTK                 |
| Surface    | `#27272a` | Module backgrounds                  |
| Cyan       | `#75f1fa` | Active workspace, sliders, accents  |
| Red        | `#ef4444` | Power button, notification dot      |
| Green      | `#42ff9f` | Media module text                   |
| Yellow     | `#facc15` | Capslock indicator                  |
| Lavender   | `#b4befe` | Lock screen date                    |

## Keybinds

| Key                        | Action                        |
|----------------------------|-------------------------------|
| `SUPER + T`                | Open terminal (kitty)         |
| `SUPER + D`                | App launcher (wofi)           |
| `SUPER + R`                | Screenshot region (swappy)    |
| `SUPER + L`                | Lock screen                   |
| `SUPER + V`                | Clipboard picker (cliphist)   |
| `SUPER + Q`                | Close window                  |
| `SUPER + W`                | Toggle float                  |
| `SUPER + F`                | Fullscreen                    |
| `SUPER + 1-0`              | Switch workspace              |
| `SUPER + SHIFT + 1-0`      | Move window to workspace      |
| `SUPER + SHIFT + Q`        | Logout                        |
| `SUPER + SHIFT + R`        | Reload config                 |
| `SUPER + SHIFT + E`        | Shutdown                      |
| `SUPER + ALT + R`          | Restart Hyprland              |
| `SUPER + P`                | Wallpaper picker (wofi)       |
| `SUPER + period`           | Emoji picker                  |
| `PRINT`                    | Full screenshot               |

## Waybar layout

`Tray → Media → Workspaces → Clock → Notification → Volume → Network → CPU → Memory → Power`

## Manual installs

Not in Debian repos, install separately:

- **JetBrainsMono Nerd Font** — [nerdfonts.com](https://www.nerdfonts.com/font-downloads)
- **Brave Browser** — [brave.com/linux](https://brave.com/linux/)
- **Zed Editor** — [zed.dev/download](https://zed.dev/download)

## Uninstall

```bash
cd ~/dotfiles
./uninstall.sh     # removes all symlinks
```

## How stow works

Each folder is a package that mirrors the filesystem:

```
~/dotfiles/
└── hypr/
    └── .config/hypr/hyprland.conf

stow hypr →
~/.config/hypr/hyprland.conf → symlink to ~/dotfiles/hypr/.config/hypr/hyprland.conf
```

Edit in `~/.config/` — changes go straight into the repo.

## Notes

- **Hyprland 0.55.2** (Debian package) — no float/center rules, no blur block syntax, no swallow
- **Autostarts**: waybar, hyprpaper, hypridle, hyprpolkitagent, numlockx, cliphist, gnome-keyring, nm-applet, swaync
- **Screenshots**: grim + slurp → swappy for annotation
- **Clipboard**: cliphist (text + image)
- **Media keys**: playerctl with now-playing in waybar
