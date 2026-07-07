# CLAUDE.md — System Context for cbels

This file provides Claude with all relevant context about my system, software, preferences, and history of changes made. Use this as a starting point for every new chat instead of asking me to re-explain my setup.

---

## Environment Overview

This machine has **two desktop sessions**, selectable at the SDDM login screen.

| Name | Version | Used For | Session Type |
|------|---------|----------|-------------|
| KDE Plasma | 6.7.2 (KWin 6.7.2, KF6 6.27.0) | Gaming + everyday use | Wayland |
| Hyprland | 0.55.3 | Coding / creative | Wayland |

> **Rule:** When I report a bug or issue, ALWAYS establish which environment I'm in before suggesting fixes. Run `echo $XDG_CURRENT_DESKTOP` if unsure. Fixes for one (e.g. `hyprctl`, `kwriteconfig6`) do **not** apply to the other.

---

## Preferences

- **Always respond in English**, regardless of what language I write in.
- **I have very little Linux experience**, but I want to learn — not just copy-paste commands. Always explain what a command or solution does and why, so I understand the reasoning.
- **When researching bugs or errors**, always check the version of the software involved and verify whether a suggested fix is relevant for my current version. Discard fixes that are too old or too new to apply.
- I prefer **terminal-based solutions** over GUI where reasonable.
- Keep explanations concise but educational.
- **After every file edit**, show the changes in a ```diff code block: `-` (red) for removed lines, `+` (green) for added lines, each prefixed with its line number (e.g. `#31`).

---

## System Specifications

### Hardware
| Component | Details |
|-----------|---------|
| CPU | Intel Core i7-10700KF (8-core, 16-thread, Comet Lake, no iGPU) @ 5.1GHz boost |
| GPU | NVIDIA GeForce RTX 4070 Ti (AD104/Lovelace, driver 610.43.02) |
| RAM | 32GB DDR4 4000MT/s |
| Motherboard | ASUS ROG STRIX Z490-I GAMING (UEFI/BIOS v2701, 2022-12-23) |
| Storage (OS) | Samsung SSD 970 EVO Plus 250GB NVMe (232.89 GiB) — /dev/nvme0n1 |
| Storage (Games) | Corsair Force MP510 NVMe (894.25 GiB) — /dev/nvme1n1, mounted at /mnt/games |
| Storage (Unused) | Corsair Force 3 SSD 120GB SATA — /dev/sda |
| Audio | FiiO K7 USB DAC/Amp |
| Network | Intel Ethernet I225-V (1Gbps, enp4s0) + Intel AX201 WiFi (wlan0, unused) |
| Bluetooth | Intel AX201 Bluetooth 5.2 |

### Monitors
| Name | Model | Resolution | Refresh | Connection | ID (both envs) |
|------|-------|-----------|---------|------------|----------------|
| ASUS ROG OLED (right/primary) | XG27ACDNG | 2560x1440 | 360Hz | DisplayPort | DP-2 |
| Lenovo Ultrawide (left) | P34WD-40 | 3440x1440 | 120Hz | HDMI | HDMI-A-1 |

> **Important:** Monitor names DP-2 and HDMI-A-1 are the same in both KDE and Hyprland (verified with `kscreen-doctor -o` and `hyprctl monitors`). They can occasionally swap on reboot (Nvidia bug). Run `hyprctl monitors` (Hyprland) or `kscreen-doctor -o` (KDE) to verify current names if something seems wrong.

> **Monitor layout (both environments):** HDMI-A-1 at geometry 0,0 (left), DP-2 at geometry 3440,0 (right).

### Peripherals
- Mouse 1: Razer Viper V3 Pro
- Mouse 2: Razer Naga V2 Pro
- Keyboard: Keychron (with volume knob, mapped via wpctl)
- Headset/Audio: FiiO K7 DAC

---

## Operating System & Core

| Software | Version |
|----------|---------|
| Distro | CachyOS (base: Arch Linux) |
| Kernel | linux-cachyos 7.0.11-1 (also has LTS: 6.18.33-2) |
| Init | systemd v261 |
| Display Server | Wayland (Xwayland 24.1.12 for compatibility) — used by both sessions |
| Display Manager | SDDM 0.21.0 (password login — autologin disabled; `plasma-login-manager` provides KDE SDDM integration) |
| Window Manager | **KDE:** KWin 6.7.2 / **Hyprland:** Hyprland 0.55.3 |

### Terminal & Shell
| Component | Software | Version |
|-----------|----------|---------|
| Terminal | Kitty | 0.47.1 |
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
| Vivaldi | latest |
| Vesktop (Discord) | 1.6.5 |
| TeamSpeak | 6.0.0beta4 |

### Package Managers
- **Pacman** — official repos + CachyOS optimized repos (v3/v4)
- **Paru** 2.1.0 — AUR helper (use instead of yay, which is not installed)
- **Flatpak** 1.16.6 — 7 packages installed, Flathub connected

### Other Notable Software
- `ddcutil` 2.2.7 — monitor brightness control via DDC/CI
- `wlopm` 1.0.0 — turn monitors on/off (used for screen sleep shortcut in Hyprland)
- `brightnessctl` — waybar scroll brightness (laptop-style, limited use on desktop)
- `wl-gammarelay-rs` 1.0.1 — Wayland gamma/brightness control via D-Bus (installed but ineffective on Nvidia — see Nvidia notes in Hyprland section)
- `btop` 1.4.7 — system monitor
- `pavucontrol` — PipeWire/audio GUI
- `stow` 2.4.1 — dotfiles management
- `snapper` + `btrfs-assistant` — BTRFS snapshots

### Audio Stack
- PipeWire 1.6.6 (active)
- WirePlumber 0.5.14
- pipewire-pulse + pipewire-alsa

### Audio — Headphone EQ (added 2026-06-09)
- **System-wide parametric EQ** via PipeWire's built-in filter-chain module — no extra software.
- Config: `~/.config/pipewire/pipewire.conf.d/10-eq.conf` (loads `libpipewire-module-filter-chain` with `param_eq`)
- EQ profile: `~/.config/pipewire/eq/dt1990-analytical.txt` (AutoEq "Equalizer APO ParametricEq" format, for DT 1990 Pro analytical pads; balanced-pads profile can be downloaded from autoeq.app and swapped via the `filename` line)
- Creates virtual sink "DT 1990 Pro EQ" (`eq_sink.dt1990`), output hard-wired to the FiiO K7 by node name (`target.object`) — do NOT let it follow the default sink, that creates a loop → silence
- Default sink = the EQ sink. Apps and volume knob target it via `@DEFAULT_AUDIO_SINK@`
- **Gain staging:** K7 software volume parked at 100%, EQ sink is the working volume, K7 physical dial for coarse adjustment. Never push software volume past 100% — the EQ preamp headroom is calculated for ≤100%
- After editing the EQ config: `systemctl --user restart pipewire pipewire-pulse wireplumber`, then verify sink with `wpctl status`

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

## Config File Locations (Shared)

Shared configs are managed via **GNU Stow** from `~/dotfiles/`. Symlinks point from `~/.config/` back to the dotfiles repo.

| Config | Actual File | Symlink |
|--------|-------------|---------|
| Kitty | `~/dotfiles/kitty/.config/kitty/kitty.conf` | `~/.config/kitty/kitty.conf` |
| Fish | `~/.config/fish/config.fish` | (direct) |
| Neovim | `~/.config/nvim/init.vim` | (direct) |
| Micro settings | `~/.config/micro/settings.json` | (direct) |

> **When editing dotfile configs:** Always edit the file in `~/dotfiles/` — never the symlink target directly, or changes won't be tracked by git.

> Dotfiles GitHub repo: **[to be added after cleanup]**

---

---

## Environment: KDE Plasma

### Versions
| Component | Version |
|-----------|---------|
| Plasma Shell | 6.7.2 |
| KWin (compositor + WM) | 6.7.2 |
| KDE Frameworks (KF6) | 6.27.0 |
| Session type | Wayland (`XDG_SESSION_TYPE=wayland`, `XDG_CURRENT_DESKTOP=KDE`) |
| Installed | 2026-07-07 |

### Desktop Components
| Component | Software |
|-----------|---------|
| Window Manager / Compositor | KWin 6.7.2 |
| Panel / Taskbar | Plasma Desktop 6.7.2 |
| System Settings | `systemsettings` 6.7.2 |
| App Launcher | KRunner + application menu |
| Screen Locker | `kscreenlocker` 6.7.2 |
| Notifications | Plasma notifications (built-in) |
| Clipboard | Plasma clipboard (built-in) |
| File Manager | Dolphin 26.04.2 |
| Screenshot | Spectacle 6.7.2 |
| Polkit Agent | KDE polkit agent (built-in) |

### Config Locations (KDE)
| Config | Location | Notes |
|--------|----------|-------|
| KWin settings | `~/.config/kwinrc` | Window manager rules, effects |
| Plasma shell | `~/.config/plasmarc` | Panel/shell settings |
| KScreen (monitors) | `~/.local/share/kscreen/` | Display layout saved by KScreen |
| Screen locker | `~/.config/kscreenlockerrc` | Timeout, appearance |
| Shortcuts | `~/.config/kglobalshortcutsrc` | Global keyboard shortcuts |
| SDDM theme | `/usr/share/sddm/themes/gruvbox/Main.qml` | Not in dotfiles — edit with sudo |
| SDDM display | `/etc/sddm/xsetup.sh` | Not in dotfiles — edit with sudo |

> KDE configs are **not** managed by Stow — they are written directly by System Settings and KDE apps. Do not use Stow for these.

### HDR in KDE
KDE Plasma 6 has **native HDR support** — configure in System Settings → Display and Monitor. Toggle HDR per monitor from the GUI; no scripts are needed.

Current state (verified via `kscreen-doctor -o` on 2026-07-07):
- **DP-2 (ASUS OLED):** HDR enabled, SDR brightness 240 nits, peak brightness override 1400 nits, Wide Color Gamut enabled
- **HDMI-A-1 (Lenovo):** HDR incapable

> **Important:** The `hdr-on.sh`/`hdr-off.sh` scripts edit `hyprland.lua` — they do **NOT** work in KDE and should never be run here. Use System Settings to toggle HDR instead.

### Gaming (KDE)

> **Note:** All Gamescope launch options below were tuned under Hyprland. Behavior under KWin has not yet been tested. Every flag is marked with its verification status.

#### Standard Launch Options
```
gamescope -w 2560 -h 1440 -r 360 -f --hdr-enabled --hdr-sdr-content-nits 250 --force-grab-cursor -- game-performance mangohud %command%
```

| Flag | verified in KDE | Notes |
|------|-----------------|-------|
| `gamescope -w -h -r -f` | TODO | XWayland games under KWin may also lock to 60Hz — Gamescope likely still needed |
| `--hdr-enabled` | TODO | HDR is native and always-on in KDE; this flag may be redundant or interact differently with KWin |
| `--hdr-sdr-content-nits 250` | TODO | KDE's SDR brightness is 240 nits — may need tuning to match |
| `--force-grab-cursor` | TODO | Likely still needed to prevent cursor escape |
| `game-performance` | TODO | CachyOS wrapper — should work regardless of DE |
| `mangohud` | TODO | Should work regardless of DE |

#### Gaming Software
| Software | Version | Notes |
|----------|---------|-------|
| Steam | via pacman | Primary game launcher |
| Heroic Games Launcher | via pacman | Epic Games Store on Linux |
| Gamescope | via pacman | Still used under KDE for Hz/xwayland isolation |
| GE-Proton | GE-Proton10_34 | Preferred Proton version |
| MangoHud | via cachyos-gaming-meta | FPS/GPU overlay |
| game-performance | via CachyOS | CPU performance wrapper |
| vk-hdr-layer-kwin6-git | r47.303e0c6-1 | Vulkan HDR layer for KWin (installed 2026-07-07) |

#### Per-Game Notes (KDE)

**Satisfactory (App ID: 526870)**
- Standard launch options — KDE behavior: **TODO (not yet tested)**

**Baldur's Gate 3 (App ID: 1086940)**
- `hdr-on.sh`/`hdr-off.sh` do NOT apply in KDE — HDR is always-on via native Display Settings.
- KDE launch options (proposed, untested): `ENABLE_HDR_WSI=1 gamescope -w 2560 -h 1440 -r 360 -f --hdr-enabled --hdr-sdr-content-nits 250 --force-grab-cursor -- game-performance mangohud %command%`
- BG3 save files and VRAM stutter fix are the same regardless of DE — see Hyprland section for details.
- In-KDE behavior: **TODO (not yet tested)**

**Sea of Thieves (App ID: 1172620)**
- Standard launch options (no HDR) — KDE behavior: **TODO (not yet tested)**

**Guild Wars 2**
- Standard launch options — KDE behavior: **TODO (not yet tested)**
- ArcDPS: same as Hyprland (see below)

### Known Issues [KDE]
- All gaming launch options and per-game behavior are untested as of 2026-07-07. Test each game and update this section.
- `hdr-on.sh` / `hdr-off.sh` will break if run under KDE (they edit `hyprland.lua`). Do not use them.
- `wlopm` (screen-off shortcut) was set up for Hyprland — KDE has its own power management; verify or configure a KDE equivalent.

---

## Environment: Hyprland

### Version & Config Format
| Component | Version |
|-----------|---------|
| Hyprland | 0.55.3 |
| Config format | **Lua** (`hyprland.lua`) — `hyprland.conf` is deprecated |
| Session type | Wayland (`XDG_CURRENT_DESKTOP=Hyprland`) |
| Xwayland | 24.1.12 |

> **Important (0.55+):** `windowrulev2` is deprecated — use `windowrule` with new syntax. `hyprctl keyword` does not work with the Lua config parser — use `hyprctl eval 'hl.config({...})'` for runtime config changes. `hyprctl dispatch <name> <args>` string shorthand also fails on 0.55+ (args get pasted into Lua as-is) — use `hyprctl eval 'hl.dispatch(hl.dsp.*)'` instead. Dispatchers are Lua functions under `hl.dsp.*`. Coordinates are passed as a table `{ x, y }`. To discover available dispatchers: iterate `pairs(hl.dsp)` (note: `print` output goes to the compositor log, not the terminal).

### Config File Locations (Hyprland)
| Config | Actual File | Symlink |
|--------|-------------|---------|
| Hyprland | `~/dotfiles/hyprland/.config/hypr/hyprland.lua` | `~/.config/hypr/hyprland.lua` |
| Wallpaper (swaybg) | launched from `hyprland.lua` — image: `/home/cbels/Wallpaper/wallhaven-2y77jy.png` | (no separate config) |
| Hypridle | `~/dotfiles/hyprland/.config/hypr/hypridle.conf` | `~/.config/hypr/hypridle.conf` |
| Idle dim shader | `~/dotfiles/hyprland/.config/hypr/dim.frag` | `~/.config/hypr/dim.frag` |
| Hyprlock | `~/dotfiles/hyprlock/.config/hypr/hyprlock.conf` | `~/.config/hypr/hyprlock.conf` |
| Waybar config | `~/dotfiles/waybar/.config/waybar/config.jsonc` | `~/.config/waybar/config.jsonc` |
| Waybar style | `~/dotfiles/waybar/.config/waybar/style.css` | `~/.config/waybar/style.css` |
| SDDM theme | `/usr/share/sddm/themes/gruvbox/Main.qml` | (not in dotfiles — edit with sudo) |
| SDDM display | `/etc/sddm/xsetup.sh` | (not in dotfiles — edit with sudo) |

### Nvidia Configuration (Hyprland-specific)
No iGPU (KF suffix on CPU). Requires specific env vars for Wayland stability. Set in `hyprland.lua`:

```lua
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
```

**Known Nvidia issues (Hyprland):**
- No iGPU means CachyOS live ISO showed black screen — booted using "Legacy Hardware (nomodeset)" option
- XWayland games lock to 60Hz without Gamescope
- `wlr-gamma-control-unstable-v1` Wayland protocol is silently ignored by the Nvidia proprietary driver — tools like `wl-gammarelay-rs` connect fine but have no visible effect. Use Hyprland screen shaders instead for software-level brightness control.
- `hyprctl keyword` does not work with the Lua config parser (0.55+). Use `hyprctl eval 'hl.config({...})'`.
- `hyprctl dispatch <name> <args>` string shorthand fails on 0.55+. Use `hyprctl eval 'hl.dispatch(hl.dsp.*)'`.

### Desktop Components (Hyprland)
| Component | Software | Version |
|-----------|----------|---------|
| Status Bar | Waybar | 0.15.0 |
| Wallpaper | swaybg | — |
| Notifications | Mako | 1.11.0 |
| App Launcher | Wofi | 1.5.3 |
| Lock Screen | Hyprlock | 0.9.5 |
| Idle Daemon | Hypridle | 0.1.7 |
| File Manager | Dolphin | 26.04.2 |
| Polkit Agent | Hyprpolkitagent | 0.1.3 |
| Clipboard | Cliphist + wl-clipboard | 0.7.0 |
| Screenshot | Hyprshot | 1.3.0 |

### Hyprland Keybindings
| Shortcut | Action |
|----------|--------|
| SUPER + Return | Open Kitty terminal |
| SUPER + Backspace | Kill active window |
| SUPER + M | Exit Hyprland |
| SUPER + E | Open Dolphin file manager |
| SUPER + V | Toggle floating window |
| SUPER + Space | Open Wofi launcher |
| SUPER + B | Open Vivaldi |
| SUPER + Arrow keys | Move focus between windows |
| SUPER + CTRL + Arrow keys | Swap windows |
| SUPER + SHIFT + Left/Right | Move window to other monitor |
| SUPER + 1-9 | Switch workspace |
| SUPER + KP_1-9 | Switch workspace (numpad) |
| SUPER + SHIFT + KP_1-9 | Move window to workspace (numpad) |
| SUPER + L | Lock screen (hyprlock) + screens off (wlopm) |
| SUPER + H | Toggle HDR on/off for ASUS OLED (runs ~/scripts/toggle-hdr.sh) |
| Print | Screenshot window (hyprshot) |
| ALT + SHIFT + S | Screenshot region (hyprshot) |
| Volume knob | wpctl volume up/down/mute |

### Gaming (Hyprland — verified)

#### Standard Launch Options (all Steam games)
```
gamescope -w 2560 -h 1440 -r 360 -f --hdr-enabled --hdr-sdr-content-nits 250 --force-grab-cursor -- game-performance mangohud %command%
```

**Explanation:**
- `gamescope` — isolates game in its own compositor, fixes xwayland multi-monitor and Hz issues
- `-w 2560 -h 1440` — forces correct resolution for ASUS OLED
- `-r 360` — forces 360Hz refresh rate
- `-f` — fullscreen
- `--hdr-enabled` — tells Gamescope the display is in HDR mode; without this when Hyprland's HDR is active, Gamescope sends SDR-encoded frames to an HDR display causing warm colors (sunsets etc.) to appear glowing/oversaturated. Harmless no-op when Hyprland is in SDR mode.
- `--hdr-sdr-content-nits 250` — sets SDR white point to 250 nits, matching `sdr_max_luminance = 250` in hyprland.lua; keeps gaming brightness consistent with the desktop
- `--force-grab-cursor` — prevents the cursor from rubberbanding back when hovering over text fields or sliders; without this, Wayland pointer constraints let the cursor escape Gamescope's window briefly, snapping it back
- `game-performance` — CachyOS wrapper that sets CPU to performance mode during game
- `mangohud` — FPS/GPU/CPU overlay
- `%command%` — Steam's placeholder for the actual game executable

#### Per-Game Notes (Hyprland)

**Satisfactory (App ID: 526870)**
- Runs via Proton (xwayland)
- Class name: `steam_app_526870`
- Gamescope required — without it, game took over the workspace and hid all windows
- Graphics: Set to Vulkan in-game settings
- Mouse rubberbanding on text fields/sliders — fixed by `--force-grab-cursor`

**Baldur's Gate 3 (App ID: 1086940)**
- Native Linux build (no Proton needed)
- Launch options: `~/scripts/hdr-on.sh && ENABLE_HDR_WSI=1 gamescope -w 2560 -h 1440 -r 360 -f --hdr-enabled --hdr-sdr-content-nits 250 --force-grab-cursor -- game-performance mangohud %command%; ~/scripts/hdr-off.sh`
  - `~/scripts/hdr-on.sh` — enables HDR in Hyprland before launch (edits hyprland.lua + reloads, waits 2s); `~/scripts/hdr-off.sh` re-disables it when game exits (including on crash)
  - `ENABLE_HDR_WSI=1` — enables Vulkan HDR WSI extension so BG3 renders natively in HDR; do NOT add `--hdr-itm-enabled` (ITM is for SDR games, adds a full GPU render pass per frame, causes choppy graphics when combined with native HDR output)
  - `DXVK_HDR=1` — do NOT add; BG3 is native Vulkan, not DXVK, so this is a no-op
  - **If HDR looks dull in-game**: adjust the HDR brightness slider in BG3's Options → Display — that controls the game's own tone-mapping and is the primary lever for perceived HDR brightness
- Save files: `~/.local/share/Larian Studios/Baldur's Gate 3/PlayerProfiles/Public/Savegames/Story/`
- Also synced to Steam Cloud: `~/.local/share/Steam/userdata/17512678/1086940/remote/`
- Cyclic stutter (1s freeze / 1s normal after extended play) — caused by progressive VRAM exhaustion. Fixed by enabling Async Compute (`vkDeviceConfig.lsx`) and Triple Buffering (`graphicSettings.lsx`). If stutter returns, check `gpu_mem_used` in MangoHud overlay; if VRAM hits ~11-12GB, lower Texture Quality one notch in-game.
- MangoHud config at `~/.config/MangoHud/MangoHud.conf` — shows fps, frame timing, gpu temp, and live VRAM usage

**Sea of Thieves (App ID: 1172620)**
- Runs via Proton (DirectX → DXVK)
- Launch options: standard launch options (see above) — no HDR
- **HDR: abandoned (2026-07-06).** The game supports HDR on Windows PC, but no in-game HDR option appears under Proton. Tried the BG3-style setup (`hdr-on.sh` + gamescope `--hdr-enabled`) with `DXVK_HDR=1` — the correct switch for DXVK titles (makes DXVK report an HDR-capable display to the game) — still nothing. Note: `ENABLE_HDR_WSI=1` does nothing here; that's for native Vulkan games like BG3 only.
- Crosshair offset issue diagnosed in this game — see "Monitor OSD crosshair off-center" under Known Issues

**Guild Wars 2**
- On Steam
- ArcDPS damage meter: place `d3d11.dll` from deltaconnected.com/arcdps/x64/ in the **root** GW2 folder (same directory as `Gw2-64.exe`, NOT in bin64)
- Launch options: standard launch options

### Known Issues [Hyprland]

**Active / Unsolved:**
- **Wallpaper rotation on boot** `[Hyprland]` — Hyprland's built-in anime mascot wallpapers (Wall0/1/2.png in `/usr/share/hypr/`) appear briefly on boot before swaybg loads. Root cause: `misc.force_default_wallpaper = -1` in system lua config. Fix: add `misc { force_default_wallpaper = 0 }` to hyprland config.
- **Volume OSD disappeared (2026-06-09)** `[Hyprland]` — a grey slider OSD previously appeared on volume changes; origin unknown (no OSD package installed, nothing in configs). Vanished around the Hyprland 0.55.0→0.55.3 / NVIDIA 595→610 upgrade, or EQ install session. Workaround: waybar shows volume %. If wanted: install `swayosd`.

**Solved:**
- **OLED brightness** `[Hyprland]` — `sdr_max_luminance` defaults to 80 nits in Hyprland, making SDR content appear darker than expected. Fixed by setting `sdr_max_luminance = 250` in the DP-2 monitor config in hyprland.lua.
- **HDR always on (OLED wear)** `[Hyprland]` — `cm = "hdr"` was permanently active. Changed to `cm = "srgb"` as default. HDR is toggled on only for gaming via `SUPER+H` or automatically via BG3 launch options. Toggle scripts live in `~/scripts/`.
- **Mouse rubberbanding in games** `[Hyprland]` — Cursor snaps back when hovering over UI elements (text fields, sliders) in Gamescope. Fixed by adding `--force-grab-cursor` to standard launch options.
- **60Hz locked in games** `[Hyprland]` — XWayland locks refresh rate. Solution: use Gamescope with `-r 360 -O DP-2`.
- **Hyprland windowrule deprecated syntax** `[Hyprland]` — `windowrulev2` is deprecated in 0.55. Use `windowrule` with new syntax.
- **Clipboard not working across apps** `[Hyprland]` — Wayland clipboard requires `wl-paste --type text --watch cliphist store` running at startup. Copy in terminal with Ctrl+Shift+C.
- **Wallpaper tool** `[Hyprland]` — Wallpaper is set by **swaybg**, not hyprpaper. It is launched as a startup command inside `hyprland.lua`: `swaybg -i /home/cbels/Wallpaper/wallhaven-2y77jy.png -m fill`. To change the wallpaper, edit that line in `~/dotfiles/hyprland/.config/hypr/hyprland.lua`.
- **Idle dim affecting monitors on other input** `[Hyprland]` — `ddcutil` sends DDC/CI commands directly to the monitor's hardware, dimming it regardless of which input is active. This caused monitors to dim when switched to the work computer. Fixed by replacing ddcutil with a Hyprland screen shader (`dim.frag`): hypridle applies the shader via `hyprctl eval 'hl.config({ decoration = { screen_shader = "...", dim_inactive = false } })'` on timeout and clears it on resume. `dim_inactive` is toggled off alongside the shader to prevent flickering. `cursor { no_hardware_cursors = true }` was added to hyprland.lua so the cursor renders through the compositor and gets dimmed with everything else (without it, the cursor leaves an unshaded trail).
- **Volume knob unlimited (300%+)** `[Hyprland]` — `wpctl set-volume` has no ceiling by default. Fixed with `-l 1.0` flag on the raise binding in hyprland.lua.
- **PipeWire EQ "failed to open param_eq file"** `[Both]` — config path must match the real filename exactly; check `journalctl --user -u pipewire -e --no-pager`.
- **Monitor OSD crosshair off-center (2026-07-06)** `[Both]` — GamePlus crosshair on the ASUS XG27ACDNG landed a fixed offset from the real aim point in Sea of Thieves. Cause: the crosshair position is adjustable with the monitor joystick and had been nudged off panel center (it stays wherever it was left). Diagnosed by parking the cursor at DP-2's true center — `hyprctl eval 'hl.dispatch(hl.dsp.cursor.move({ x = 4720, y = 720 }))'` (x = 3440 ultrawide width + 1280) — and comparing against the dot. Fixed by realigning it in OSD → GamePlus → Crosshair with the cursor as reference. Gamescope was not at fault: with `-w 2560 -h 1440 -f` it maps 1:1, and it keeps scaled images centered anyway. A *fixed* offset points at the display/OSD; a *varying* one is game mechanics (bloom/projectile arc).

---

## Known Issues (Shared) [Both]

- **Monitor names swapping on reboot** `[Both]` — DP-2 and HDMI-A-1 can swap (Nvidia bug). Run `hyprctl monitors` (Hyprland) or `kscreen-doctor -o` (KDE) to verify current assignment.
- **BG3 cyclic stutter** `[Both]` — progressive VRAM exhaustion after extended sessions. Fixed by Async Compute + Triple Buffering (see BG3 notes in Hyprland gaming section — same fix applies in KDE).
- **Norwegian keyboard layout** `[Both]` — Set via `input { kb_layout = no }` in hyprland.lua AND `sudo localectl set-keymap no`. The `localectl` setting is system-wide and also affects KDE.
- **/mnt/games not mounting on boot** `[Both]` — Was using device path `/dev/nvme1n1p1` in fstab. Fixed by switching to UUID with `nofail` option.
- **Black screen on live ISO boot** `[Both]` — Nvidia RTX 4070 Ti + no iGPU. Solution: select "CachyOS Legacy Hardware (GPU nomodeset)" in GRUB.

---

## Important Commands Reference

```bash
# Identify current environment
echo $XDG_CURRENT_DESKTOP    # KDE or Hyprland

# --- Hyprland ---
hyprctl reload                # Reload Hyprland config without restart
hyprctl monitors              # Check monitor names and status
hyprctl clients               # List running windows and their class names
# Runtime config change (0.55+ Lua -- use instead of hyprctl keyword):
hyprctl eval 'hl.config({...})'
# Move cursor to DP-2 center (3440 ultrawide width + 1280 half of 2560):
hyprctl eval 'hl.dispatch(hl.dsp.cursor.move({ x = 4720, y = 720 }))'

# Turn monitors off/on (Hyprland)
wlopm --off HDMI-A-1 && wlopm --off DP-2
wlopm --on HDMI-A-1 && wlopm --on DP-2

# --- KDE ---
kscreen-doctor -o             # Check monitor names, modes, HDR status under KWin
# HDR toggle: System Settings -> Display and Monitor (GUI)

# --- Shared ---
ddcutil setvcp 10 VALUE       # Set monitor brightness via DDC (0-100)
kill PID                      # Kill a process by PID

# Package management
sudo pacman -S PACKAGE        # Install (official repos)
paru -S PACKAGE               # Install (AUR)
pacman -Ss KEYWORD            # Search packages
paru -Syu                     # Full system upgrade
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

*Last updated: 2026-07-07*

---

## System Upgrade Logs

Logs of full system upgrades (paru) are saved here for troubleshooting compatibility issues after reboots.

| Date | File / Source | Notable changes |
|------|--------------|-----------------|
| 2026-06-09 | `~/dotfiles/logs/paru-upgrade-2026-06-09.log` | NVIDIA 595->610, kernel 7.0.5->7.0.11, Kitty 0.46->0.47, Hyprland 0.55.0->0.55.3 |
| 2026-06-09 | `/var/log/pacman.log` (filter by date) | Full pacman transaction log -- run `grep "2026-06-09" /var/log/pacman.log` |
| 2026-07-05 | `/var/log/pacman.log` (filter by date) | glibc, gcc/libstdc++ 16.1, systemd 260->261, glib2, bash 5.3.15, libffi 3.6, sqlite 3.53.3 |
| 2026-07-07 | `/var/log/pacman.log` (filter by date) | KDE Plasma 6.7.2 install: plasma-meta, plasma-desktop, kwin 6.7.2, kscreenlocker, kglobalacceld, libkscreen, breeze, breeze-gtk, discover, spectacle, systemsettings, powerdevil, bluedevil, plasma-nm, plasma-pa, plasma-systemmonitor, vk-hdr-layer-kwin6-git |

---

## Theming -- How to Change the Color Scheme Across All Apps

The system was migrated to **Gruvbox Dark** on 2026-06-04. All app themes are driven by hex colors hardcoded in config files (no single theme engine). When switching themes, every file below must be updated.

### Current theme: Gruvbox Dark

### Files to edit and what to change

| App | File (always edit the `~/dotfiles/` path) | What to change |
|-----|-------------------------------------------|----------------|
| Waybar | `~/dotfiles/waybar/.config/waybar/style.css` | First line `@import` -- points to a CSS file in `themes/`. Available: `themes/gruvbox.css`, `mocha.css`. |
| Kitty | `~/dotfiles/kitty/.config/kitty/current-theme.conf` | Full color file -- background, foreground, 16 ANSI colors, tab bar, borders, cursor. |
| Mako | `~/dotfiles/mako/.config/mako/config` | `background-color`, `text-color`, `border-color` + urgency section colors. |
| Wofi | `~/dotfiles/wofi/.config/wofi/style.css` | All hex colors in the CSS -- background, text, accent, surface, selected state. |
| Hyprland | `~/dotfiles/hyprland/.config/hypr/hyprland.lua` | `col.active_border` and `col.inactive_border` (rgba format, no `#`). |
| Hyprlock | `~/dotfiles/hyprlock/.config/hypr/hyprlock.conf` | Background color (HDMI monitor), text/date color, input field inner/outer/check/fail colors, keyboard label color. |
| Vesktop | `~/dotfiles/vesktop/.config/vesktop/settings/quickCss.css` | `@import` line -- points to a file in `../themes/`. `themes/gruvbox.css` exists and was written by the user. |
| Neovim | `~/dotfiles/nvim/.config/nvim/init.vim` | `colorscheme` line. `gruvbox.vim` is at `~/.config/nvim/colors/gruvbox.vim` (not via package manager -- extracted manually). |
| Starship | `~/dotfiles/starship/.config/starship.toml` | `palette = '...'` line (line ~29). `gruvbox_dark` palette is already defined in the same file. |
| Micro | `~/.config/micro/settings.json` | `"colorscheme"` value. `"gruvbox-tc"` |
| Btop | `~/.config/btop/btop.conf` | `color_theme` value. Available themes are in `/usr/share/btop/themes/` -- `gruvbox_dark.theme` is there. |
| SDDM | `/usr/share/sddm/themes/gruvbox/Main.qml` | All `readonly property color gruvXxx` values at the top of the file. Requires `sudo`. |
| **KDE Plasma** | System Settings -> Colors & Themes | Plasma color scheme is configured separately from other apps -- use `plasma-apply-colorscheme <name>` in terminal or the GUI. No dotfiles entry. |

> Micro, Btop, SDDM, and KDE Plasma are **not** in the dotfiles repo -- edit them directly.

### Reload commands after editing

```bash
hyprctl reload                          # Hyprland (borders, window rules)
pkill waybar; waybar &>/dev/null &      # Waybar (restart required for CSS changes)
disown                                  # detach waybar from terminal
notify-send "Test" "Mako colors"        # Mako (live, no restart needed)
# Kitty: Ctrl+Shift+F5 inside a kitty window
# Starship/Btop: open a new terminal
# Wofi: just open it (SUPER+Space)
# Vesktop: restart the app
# Hyprlock: SUPER+L to test
# Neovim: open any file with nvim
# Micro: open any file with micro
# SDDM: no reload needed -- changes take effect at next login screen
# KDE Plasma: plasma-apply-colorscheme <name>, or logout/login
```

### Gruvbox Dark color palette (for reference when writing new configs)

| Role | Hex |
|------|-----|
| Background | `#282828` |
| Background hard | `#1d2021` |
| bg1 (surface) | `#3c3836` |
| bg2 | `#504945` |
| bg4 (overlay) | `#7c6f64` |
| Foreground | `#ebdbb2` |
| fg1 (subtext) | `#d5c4a1` |
| fg3 (muted) | `#a89984` |
| Red / bright | `#cc241d` / `#fb4934` |
| Green / bright | `#98971a` / `#b8bb26` |
| Yellow / bright | `#d79921` / `#fabd2f` |
| Blue / bright | `#458588` / `#83a598` |
| Purple / bright | `#b16286` / `#d3869b` |
| Aqua / bright | `#689d6a` / `#8ec07c` |
| Orange / bright | `#d65d0e` / `#fe8019` |

### Notes from the Gruvbox migration
- Waybar already had `themes/gruvbox.css` -- just needed the import changed.
- Starship already had `[palettes.gruvbox_dark]` -- just needed the `palette =` line changed.
- Vesktop already had `themes/gruvbox.css` written by the user -- just needed the `@import` in quickCss.
- Btop already had `gruvbox_dark.theme` in `/usr/share/btop/themes/`.
- Neovim: `gruvbox.vim` is NOT installed as a system package -- it lives at `~/.config/nvim/colors/gruvbox.vim` (extracted from the AUR git clone). If that file is gone, re-extract: `git --git-dir ~/.cache/paru/clone/vim-gruvbox-git/vim-gruvbox-git show HEAD:colors/gruvbox.vim > ~/.config/nvim/colors/gruvbox.vim`
- GTK theme, VS Code, and Firefox were **not** changed -- they require manual action.
