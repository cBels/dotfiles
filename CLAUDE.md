# Dotfiles – cBels

## System
- **Distro:** CachyOS (Arch-based)
- **Kernel:** CachyOS kernel (performance-optimized)
- **CPU:** Intel Core i7-10700KF (8-core/16-thread)
- **RAM:** 32 GB
- **GPU:** NVIDIA GeForce RTX 4070 Ti (driver: nvidia, NOT nouveau)
- **Shell:** fish

## Monitors
- **Monitor-1:** HDMI-A-1 – Lenovo P34WD-40, 3440x1440 ultrawide (OLED) @ 119.99Hz
- **Monitor-2:** DP-2 – ASUS XG27ACDNG, 2560x1440 @ 359.98Hz
- Hyprland layout: HDMI-A-1 at 0x0, DP-2 at 3440x0

## Audio
- Only USB devices are used:
  - SteelSeries Alias (headset/microphone)
  - FiiO K7 (DAC/amplifier)
- PipeWire + WirePlumber
- Intel HDA and NVIDIA HDA should NOT be used

## Network
- Wired only: enp4s0 (Intel I225-V, 1Gbps)
- WiFi and Bluetooth are not in use

## Applications
| App | Role |
|-----|------|
| Hyprland | Window manager |
| Hyprlock | Screen locker |
| Hyprpaper | Wallpaper daemon |
| Hypridle | Idle management |
| Waybar | Status bar |
| Kitty | Terminal |
| Wofi | App launcher |
| Starship | Shell prompt |
| Neovim | Text editor (init.vim) |
| Mako | Notifications |
| Fish | Shell |
| Hyprshot | Screenshots |
| cliphist | Clipboard history |
| wl-paste | Wayland clipboard |
| Firefox | Browser |
| wpctl | Volume control (PipeWire) |

## Dotfiles Structure
All configs are managed with GNU Stow from `~/dotfiles/` → `~/.config/`.

```
~/dotfiles/
├── CLAUDE.md
├── hyprland/    → hyprland.conf, hypridle.conf
├── hyprlock/    → hyprlock.conf
├── hyprpaper/   → hyprpaper.conf
├── waybar/      → config.jsonc, style.css, modules.jsonc, scripts/, themes/
├── kitty/       → kitty.conf, current-theme.conf
├── wofi/        → style.css
├── starship/    → starship.toml
└── nvim/        → init.vim
```

Reference configs (from YouTube/others) are stored in `~/referanse-configs/` for inspiration only.

## Design Preferences
- **Color palette:** Kanagawa
- **Style:** Technical and minimalist – straight edges, NO rounded corners
- **OLED consideration:** Avoid bright colors on large static areas. Dark backgrounds are important.
- **Waybar:** Minimalist – subtle modules, low visual noise
- **General:** Pastel/chalk colors, not poppy or high contrast

## Keybindings
- **Modifier:** SUPER
- Terminal: SUPER + Return
- Kill window: SUPER + Backspace
- Launcher: SUPER + Space
- Firefox: SUPER + B
- File manager: SUPER + E
- Toggle floating: SUPER + V
- Screenshot (window): Print
- Screenshot (region): ALT + SHIFT + S
- Move focus: SUPER + Arrow keys
- Switch workspace: SUPER + 1-9 (also numpad)
- Move window to workspace: SUPER + SHIFT + numpad
- Move window between monitors: SUPER + SHIFT + left/right
- Volume up/down/mute: XF86 keys

## Important Notes
- NVIDIA requires specific Hyprland env variables (LIBVA_DRIVER_NAME, GBM_BACKEND, etc.)
- AUR helper: paru
- No NixOS/home-manager – standard Arch package management
