# dotfiles

Hyprland desktop config on Debian (trixie). Clean, functional, Catppuccin-inspired.

## Colors

| Token      | Hex       | Usage                  |
|------------|-----------|------------------------|
| Background | `#18181b` | Waybar, swaync, GTK    |
| Surface    | `#27272a` | Module backgrounds     |
| Cyan       | `#75f1fa` | Active workspace, sliders, highlights |
| Red        | `#ef4444` | Power button, notification dot |
| Green      | `#42ff9f` | Media module text      |
| Yellow     | `#facc15` | Capslock indicator     |
| Lavender   | `#b4befe` | Lock screen date       |

## Packages

### `hypr` — Window manager

| File                  | What it does                        |
|-----------------------|-------------------------------------|
| `hyprland.conf`       | Keybinds, workspaces, monitor, autostart |
| `hypridle.conf`       | Dim → DPMS off → lock → suspend     |
| `hyprlock.conf`       | Lock screen with clock + input field|
| `hyprpaper.conf`      | Wallpaper (5 wallpapers, cycle)     |
| `screenshot.sh`       | grim + slurp + swappy region select |

**Notable keybinds:**
- `SUPER + Q` — close window
- `SUPER + W` — toggle float
- `SUPER + F` — fullscreen
- `SUPER + T` — launch kitty
- `SUPER + D` — wofi launcher
- `SUPER + R` — screenshot region
- `SUPER + L` — lock screen
- `SUPER + V` — cliphist paste
- `SUPER + 1-0` — switch workspace
- `SUPER + SHIFT + 1-0` — move window to workspace
- `SUPER + SHIFT + Q` — logout
- `SUPER + SHIFT + R` — reload config
- `SUPER + SHIFT + E` — shutdown
- `SUPER + ALT + R` — restart Hyprland

### `waybar` — Status bar

| File                                     | What it does              |
|------------------------------------------|---------------------------|
| `config`                                 | Layout + module config    |
| `style.css`                              | Catppuccin dark theme     |
| `custom_modules/media/media-animation.sh`| Now-playing animation     |
| `custom_modules/media/media-now-playing.sh`| Track info            |
| `custom_modules/media/media-time.sh`     | Track progress            |

**Modules (left to right):**
Tray → Media (prev/play-pause/next) → Workspaces → Clock → Notification → Volume (icon + slider) → Network → CPU → Memory → Power

### `swaync` — Notifications

| File          | What it does                 |
|---------------|------------------------------|
| `config.json` | Layout, position, widgets    |
| `style.css`   | Catppuccin dark theme        |

### `wofi` — App launcher

| File          | What it does                 |
|---------------|------------------------------|
| `config`      | Prompt, dimensions, location |
| `style.css`   | GTK-theme-aware styling      |

### `gtk` — GTK theme

| File             | What it does              |
|------------------|---------------------------|
| `settings.ini`   | Yaru-Lavender-dark + icons|

### `kitty` — Terminal

| File          | What it does                 |
|---------------|------------------------------|
| `kitty.conf`  | JetBrainsMono Nerd Font, Catppuccin colors, keybinds |

### `greetd` — Login manager

| File (system)              | What it does            |
|----------------------------|-------------------------|
| `/etc/greetd/config.toml`  | Points to tuigreet-run.sh |
| `/usr/local/bin/tuigreet-run.sh` | Catppuccin-colored greeter |

## Setup

```bash
sudo apt install stow
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` runs `stow` on each package, creating symlinks from `~/dotfiles/` into `~/.config/` (and `/etc/` for greetd).

## Uninstall

```bash
cd ~/dotfiles
./uninstall.sh
```

Removes all symlinks. Original files stay in `~/dotfiles/`.

## How stow works

Each directory is a stow **package** that mirrors the filesystem root:

```
~/dotfiles/
└── hypr/
    └── .config/        ← mirrors $HOME
        └── hypr/
            ├── hyprland.conf
            └── hypridle.conf

stow hypr  →
  ~/.config/hypr/hyprland.conf  → symlink to ~/dotfiles/hypr/.config/hypr/hyprland.conf
  ~/.config/hypr/hypridle.conf  → symlink to ~/dotfiles/hypr/.config/hypr/hypridle.conf
```

Edit files in `~/.config/` — changes go straight into the repo.

## Manual stow

```bash
stow hypr          # link hyprland configs
stow waybar        # link waybar configs
stow -D waybar     # unlink waybar configs
sudo stow greetd   # system configs (needs root)
```

## Add a new config

```bash
mkdir -p ~/dotfiles/myapp/.config/myapp
mv ~/.config/myapp/config ~/dotfiles/myapp/.config/myapp/
cd ~/dotfiles && stow myapp
```

## Manual installs (not in apt)

These programs are referenced by keybinds but must be installed separately:

| Program        | Where to get it                        |
|----------------|----------------------------------------|
| JetBrainsMono Nerd Font | [nerdfonts.com](https://www.nerdfonts.com/font-downloads) |
| Brave Browser  | [brave.com/linux](https://brave.com/linux/) |
| Zed Editor     | [zed.dev/download](https://zed.dev/download) |

## Notes

- **Hyprland 0.55.2** (Debian package) — does NOT support: `windowrule = float/center`, `decoration { drop_shadow, shadow_range, ... }`, `blur { ... }` block syntax, `misc { allow_swallow, ... }`
- **Autostart** runs: waybar, hyprpaper, hypridle, hyprpolkitagent, numlockx, cliphist, gnome-keyring, nm-applet, swaync
- **Screenshots** via grim + slurp + swappy (opens in swappy for annotation)
- **Clipboard** via cliphist (text + image)
- **Media keys**: playerctl with now-playing in waybar
