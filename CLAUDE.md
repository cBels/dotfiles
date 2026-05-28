# CLAUDE.md — System Context for cbels

This file provides Claude with all relevant context about my system, software, preferences, and history of changes made. Use this as a starting point for every new chat instead of asking me to re-explain my setup.

---

## Preferences

- **Always respond in English**, regardless of what language I write in.
- **I have very little Linux experience**, but I want to learn — not just copy-paste commands. Always explain what a command or solution does and why, so I understand the reasoning.
- **When researching bugs or errors**, always check the version of the software involved and verify whether a suggested fix is relevant for my current version. Discard fixes that are too old or too new to apply.
- I prefer **terminal-based solutions** over GUI where reasonable.
- Keep explanations concise but educational.

---

## System Specifications

### Hardware
| Component | Details |
|-----------|---------|
| CPU | Intel Core i7-10700KF (8-core, 16-thread, Comet Lake, no iGPU) @ 5.1GHz boost |
| GPU | NVIDIA GeForce RTX 4070 Ti (AD104/Lovelace, driver 595.71.05) |
| RAM | 32GB DDR4 4000MT/s |
| Motherboard | ASUS ROG STRIX Z490-I GAMING (UEFI/BIOS v2701, 2022-12-23) |
| Storage (OS) | Samsung SSD 970 EVO Plus 250GB NVMe (232.89 GiB) — /dev/nvme0n1 |
| Storage (Games) | Corsair Force MP510 NVMe (894.25 GiB) — /dev/nvme1n1, mounted at /mnt/games |
| Storage (Unused) | Corsair Force 3 SSD 120GB SATA — /dev/sda |
| Audio | FiiO K7 USB DAC/Amp |
| Network | Intel Ethernet I225-V (1Gbps, enp4s0) + Intel AX201 WiFi (wlan0, unused) |
| Bluetooth | Intel AX201 Bluetooth 5.2 |

### Monitors
| Name | Model | Resolution | Refresh | Connection | Hyprland ID |
|------|-------|-----------|---------|------------|-------------|
| ASUS ROG OLED (right/primary) | XG27ACDNG | 2560x1440 | 360Hz | DisplayPort | DP-2 |
| Lenovo Ultrawide (left) | P34WD-40 | 3440x1440 | 120Hz | HDMI | HDMI-A-1 |

> **Important:** Monitor names in Hyprland are DP-2 and HDMI-A-1 — these can occasionally swap on reboot (Nvidia bug). Run `hyprctl monitors` or `xrandr | grep connected` to verify current names if something seems wrong.

### Peripherals
- Mouse 1: Razer Viper V3 Pro
- Mouse 2: Razer Naga V2 Pro
- Keyboard: Keychron (with volume knob, mapped via wpctl)
- Headset/Audio: FiiO K7 DAC

---

## Operating System & Software

### OS & Core
| Software | Version |
|----------|---------|
| Distro | CachyOS (base: Arch Linux) |
| Kernel | linux-cachyos 7.0.5-2 (also has LTS: 6.18.28-1) |
| Init | systemd v260 |
| Display Server | Wayland (Xwayland 24.1.11 for compatibility) |
| Display Manager | SDDM 0.21.0 (autologin enabled) |
| Window Manager | Hyprland 0.55.0 |
| Compositor | Hyprland (Wayland native) |

> **Important:** Hyprland 0.55 uses **Lua** as the primary config format. `hyprland.conf` is deprecated. Config is in `hyprland.lua`. `windowrulev2` is also deprecated — use `windowrule` with new syntax.

### Desktop Environment Components
| Component | Software | Version |
|-----------|----------|---------|
| Status Bar | Waybar | 0.15.0 |
| Wallpaper | Hyprpaper | 0.8.4 |
| Notifications | Mako | 1.11.0 |
| App Launcher | Wofi | 1.5.3 |
| Lock Screen | Hyprlock | 0.9.5 |
| Idle Daemon | Hypridle | 0.1.7 |
| File Manager | Dolphin | 26.04.1 |
| Polkit Agent | Hyprpolkitagent | 0.1.3 |
| Clipboard | Cliphist + wl-clipboard | 0.7.0 |
| Screenshot | Hyprshot | 1.3.0 |

### Terminal & Shell
| Component | Software | Version |
|-----------|----------|---------|
| Terminal | Kitty | 0.46.2 |
| Shell | Fish | 4.7.1 |
| Prompt | Starship | 1.25.1 |

### Editors
| Editor | Version | Notes |
|--------|---------|-------|
| Micro | 2.0.15 | Preferred for simple config edits, uses gruvbox theme |
| Neovim | 0.12.2 | For more advanced editing |
| Nano | 9.0 | Available as fallback |
| VS Code | 1.120.0 | With Claude Code extension (Anthropic official) |

### Browsers & Communication
| Software | Version |
|----------|---------|
| Firefox | 150.0.2 |
| Vesktop (Discord) | 1.6.5 |
| TeamSpeak | 6.0.0beta4 |

### Gaming
| Software | Version | Notes |
|----------|---------|-------|
| Steam | via pacman | Primary game launcher |
| Heroic Games Launcher | via pacman | Epic Games Store on Linux |
| Gamescope | via pacman | Used for all games — fixes xwayland/Hz/monitor issues |
| GE-Proton | GE-Proton10_34 | Preferred Proton version for gaming |
| MangoHud | via cachyos-gaming-meta | FPS/GPU overlay |
| game-performance | via CachyOS | CPU performance wrapper for gaming |

### Package Managers
- **Pacman** — official repos + CachyOS optimized repos (v3/v4)
- **Paru** 2.1.0 — AUR helper (use instead of yay, which is not installed)
- **Flatpak** 1.16.6 — 7 packages installed, Flathub connected

### Other Notable Software
- `ddcutil` 2.2.7 — monitor brightness control via DDC/CI
- `wlopm` 1.0.0 — turn monitors on/off (used for screen sleep shortcut)
- `brightnessctl` — waybar scroll brightness (laptop-style, limited use on desktop)
- `btop` 1.4.7 — system monitor
- `pavucontrol` — PipeWire/audio GUI
- `stow` 2.4.1 — dotfiles management
- `snapper` + `btrfs-assistant` — BTRFS snapshots

### Audio Stack
- PipeWire 1.6.4 (active)
- WirePlumber 0.5.14
- pipewire-pulse + pipewire-alsa

---

## File System & Disk Layout

```
/dev/nvme0n1p1  →  /boot       (4GB, vfat/EFI)
/dev/nvme0n1p2  →  /  /home  /var/log  /var/tmp  /srv  (228.88GB, btrfs)
/dev/nvme1n1p1  →  /mnt/games  (880GB, ext4)
/dev/sda        →  unmounted   (111.79GB, unused)
swap            →  zram0       (31.21GB, ZRAM — no swap partition)
```

> fstab uses UUID for /mnt/games with `nofail` option to prevent boot failure if disk is unavailable.

---

## Config File Locations

All configs are managed via **GNU Stow** from `~/dotfiles/`. Symlinks point from `~/.config/` back to the dotfiles repo.

| Config | Actual File | Symlink |
|--------|-------------|---------|
| Hyprland | `~/dotfiles/hyprland/.config/hypr/hyprland.lua` | `~/.config/hypr/hyprland.lua` |
| Hyprpaper | `~/dotfiles/hyprpaper/.config/hypr/hyprpaper.conf` | `~/.config/hypr/hyprpaper.conf` |
| Hypridle | `~/dotfiles/hyprland/.config/hypr/hypridle.conf` | `~/.config/hypr/hypridle.conf` |
| Hyprlock | `~/dotfiles/hyprlock/.config/hypr/hyprlock.conf` | `~/.config/hypr/hyprlock.conf` |
| Waybar config | `~/dotfiles/waybar/.config/waybar/config.jsonc` | `~/.config/waybar/config.jsonc` |
| Waybar style | `~/dotfiles/waybar/.config/waybar/style.css` | `~/.config/waybar/style.css` |
| Kitty | `~/dotfiles/kitty/.config/kitty/kitty.conf` | `~/.config/kitty/kitty.conf` |
| Fish | `~/.config/fish/config.fish` | (direct) |
| Neovim | `~/.config/nvim/init.vim` | (direct) |
| Micro settings | `~/.config/micro/settings.json` | (direct) |

> Dotfiles GitHub repo: **[to be added after cleanup]**

> **When editing configs:** Always edit the file in `~/dotfiles/` — never the symlink target directly, or changes won't be tracked by git.

---

## Nvidia Configuration

No iGPU (KF suffix on CPU). Requires specific env vars for Wayland stability. Set in `hyprland.lua`:

```lua
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
```

**Known Nvidia issues on this system:**
- No iGPU means CachyOS live ISO showed black screen — booted using "Legacy Hardware (nomodeset)" option
- Monitor names (DP-2/HDMI-A-1) can occasionally swap between reboots
- XWayland games lock to 60Hz without Gamescope

---

## Gaming Setup

### Standard Launch Options (all Steam games)
```
gamescope -w 2560 -h 1440 -r 360 -f --hdr-enabled --hdr-sdr-content-nits 250 -- game-performance mangohud %command%
```

**Explanation:**
- `gamescope` — isolates game in its own compositor, fixes xwayland multi-monitor and Hz issues
- `-w 2560 -h 1440` — forces correct resolution for ASUS OLED
- `-r 360` — forces 360Hz refresh rate
- `-f` — fullscreen
- `--hdr-enabled` — tells Gamescope to properly handle HDR output for the ASUS OLED (which is always in HDR mode via Hyprland); without this, Gamescope sends SDR-encoded frames to an HDR display, causing warm colors (sunsets etc.) to appear glowing/oversaturated
- `--hdr-sdr-content-nits 250` — sets SDR white point to 250 nits, matching `sdr_max_luminance = 250` in hyprland.lua; keeps gaming brightness consistent with the desktop
- `game-performance` — CachyOS wrapper that sets CPU to performance mode during game
- `mangohud` — FPS/GPU/CPU overlay
- `%command%` — Steam's placeholder for the actual game executable

### Per-Game Notes

**Satisfactory (App ID: 526870)**
- Runs via Proton (xwayland)
- Class name: `steam_app_526870`
- Known issue: Gamescope required, game took over workspace and hid all windows without it
- Graphics: Set to Vulkan in-game settings

**Baldur's Gate 3 (App ID: 1086940)**
- Native Linux build (no Proton needed)
- Save files: `~/.local/share/Larian Studios/Baldur's Gate 3/PlayerProfiles/Public/Savegames/Story/`
- Also synced to Steam Cloud: `~/.local/share/Steam/userdata/17512678/1086940/remote/`
- Known issue: Occasional stuttering — likely VRAM buildup over time, restart fixes it
- MangoHud config at `~/.config/MangoHud/MangoHud.conf` — includes gpu_mem_used to monitor VRAM

**Guild Wars 2**
- On Steam
- ArcDPS damage meter: place `d3d11.dll` from deltaconnected.com/arcdps/x64/ in GW2 bin64 folder
- Launch options: same standard options as above

---

## Hyprland Keybindings (current)

| Shortcut | Action |
|----------|--------|
| SUPER + Return | Open Kitty terminal |
| SUPER + Backspace | Kill active window |
| SUPER + M | Exit Hyprland |
| SUPER + E | Open Dolphin file manager |
| SUPER + V | Toggle floating window |
| SUPER + Space | Open Wofi launcher |
| SUPER + B | Open Firefox |
| SUPER + Arrow keys | Move focus between windows |
| SUPER + CTRL + Arrow keys | Swap windows |
| SUPER + SHIFT + Left/Right | Move window to other monitor |
| SUPER + 1-9 | Switch workspace |
| SUPER + KP_1-9 | Switch workspace (numpad) |
| SUPER + SHIFT + KP_1-9 | Move window to workspace (numpad) |
| SUPER + L | Lock screen (hyprlock) + screens off (wlopm) |
| Print | Screenshot window (hyprshot) |
| ALT + SHIFT + S | Screenshot region (hyprshot) |
| Volume knob | wpctl volume up/down/mute |

---

## Known Issues & Bugs

### Active / Unsolved
- **Wallpaper rotation on boot** — Hyprland's built-in anime mascot wallpapers (Wall0/1/2.png in `/usr/share/hypr/`) appear briefly on boot before hyprpaper loads. Root cause: `misc.force_default_wallpaper = -1` in system lua config. Fix: add `misc { force_default_wallpaper = 0 }` to hyprland config.
- **BG3 stuttering** — Intermittent after extended play sessions, likely VRAM buildup. Monitor with MangoHud `gpu_mem_used`. Restart game as workaround.
- **OLED brightness** — sdrMaxLuminance defaults to 80 nits in Hyprland, making SDR content appear darker than expected. Fix: set `sdr_max_luminance = 200` in monitor config in hyprland.lua.

### Solved
- **Black screen on live ISO boot** — Nvidia RTX 4070 Ti + no iGPU. Solution: selected "CachyOS Legacy Hardware (GPU nomodeset)" in GRUB boot menu.
- **Monitor order** — Physical left monitor (Lenovo) is HDMI-A-1, physical right monitor (ASUS OLED) is DP-2. These names can swap — always verify with `hyprctl monitors` if something is wrong.
- **60Hz locked in games** — XWayland locks refresh rate. Solution: use Gamescope with `-r 360 -O DP-2`.
- **/mnt/games not mounting on boot** — Was using device path `/dev/nvme1n1p1` in fstab. Fixed by switching to UUID with `nofail` option.
- **Hyprland windowrule deprecated syntax** — `windowrulev2` is deprecated in 0.55. Use `windowrule` with new syntax.
- **Norwegian keyboard layout** — Set via `input { kb_layout = no }` in hyprland config AND `sudo localectl set-keymap no`.
- **Clipboard not working across apps** — Wayland clipboard requires `wl-paste --type text --watch cliphist store` running at startup. Copy in terminal with Ctrl+Shift+C.
- **Hyprpaper not applying correct wallpaper** — Config was symlinked via stow to dotfiles repo. Edit `~/dotfiles/hyprpaper/.config/hypr/hyprpaper.conf` — not the symlink.

---

## Important Commands Reference

```bash
# Reload Hyprland config without restart
hyprctl reload

# Check monitor names and status
hyprctl monitors

# Check running windows and their class names (useful for windowrules)
hyprctl clients

# Kill a specific window by class
hyprctl dispatch closewindow class:APP_CLASS

# Kill a process by PID
kill PID

# Turn monitors off/on
wlopm --off HDMI-A-1 && wlopm --off DP-2
wlopm --on HDMI-A-1 && wlopm --on DP-2

# Set monitor brightness via DDC
ddcutil setvcp 10 VALUE  # 0-100

# Install package (official repos)
sudo pacman -S PACKAGE

# Install package (AUR)
paru -S PACKAGE

# Search for package
pacman -Ss KEYWORD
paru -Ss KEYWORD

# Update all packages
sudo pacman -Syu
paru -Syu
```

---

## Git / Dotfiles Workflow

```bash
# After editing a config in ~/dotfiles/
cd ~/dotfiles
git add -A
git commit -m "describe change"
git push
```

GitHub repo: **[to be added after cleanup]**

---

*Last updated: May 2026*
