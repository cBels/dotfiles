-- Hyprland configuration – cBels
-- Converted from hyprland.conf
-- Reference: https://wiki.hypr.land/Configuring/

local mainMod     = "SUPER"
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "wofi --show drun"


-- ── Environment variables (NVIDIA RTX 4070 Ti) ───────────────────────────────

hl.env("LIBVA_DRIVER_NAME",           "nvidia")
hl.env("GBM_BACKEND",                 "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME",   "nvidia")
hl.env("NVD_BACKEND",                 "direct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT","auto")


-- ── Monitors ─────────────────────────────────────────────────────────────────

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "3440x1440@119.99",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = "DP-2",
    mode     = "2560x1440@359.98",
    position = "3440x0",
    scale    = 1,
})


-- ── Autostart ────────────────────────────────────────────────────────────────

hl.on("hyprland.start", function()
hl.exec_cmd("wl-paste --type text --watch cliphist store")
hl.exec_cmd("mako")
hl.exec_cmd("sleep 5 && hyprpaper")
hl.exec_cmd("waybar")
hl.exec_cmd("hypridle")
hl.exec_cmd("hyprctl dispatch focusmonitor HDMI-A-1")
end)


-- ── Look and feel ─────────────────────────────────────────────────────────────

hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 10,
        border_size = 2,
        col = {
            active_border   = "rgba(7e9cd8ff)",
            inactive_border = "rgba(363646ff)",
        },
        layout = "dwindle",
    },

    decoration = {
        rounding = 0,

        blur = {
            enabled = true,
            size    = 3,
            passes  = 1,
        },

        shadow = {
            enabled = false,
        },
    },

    animations = {
        enabled = true,
    },

    input = {
        kb_layout = "no",
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
})

hl.curve("linear",  { type = "bezier", points = { {0.0, 0.0}, {1.0, 1.0} } })
hl.curve("easeOut", { type = "bezier", points = { {0.0, 0.0}, {0.2, 1.0} } })

hl.animation({ leaf = "windows",    enabled = true, speed = 3, bezier = "easeOut", style = "slide" })
hl.animation({ leaf = "fade",       enabled = true, speed = 3, bezier = "easeOut" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "easeOut", style = "slide" })


-- ── Window rules ──────────────────────────────────────────────────────────────

hl.window_rule({
    name    = "steam-on-dp2",
    match   = { class = "^(steam_app)" },
    monitor = "DP-2",
})


-- ── Keybindings ───────────────────────────────────────────────────────────────

-- Applications
hl.bind(mainMod .. " + return",    hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + backspace", hl.dsp.window.close())
hl.bind(mainMod .. " + M",         hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space",     hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B",         hl.dsp.exec_cmd("firefox"))

-- Move focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Swap windows
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.swap({ direction = "down" }))

-- Move window between monitors
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left",  monitor = true }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right", monitor = true }))

-- Switch workspace (number row 1–9)
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
end

-- Switch workspace (numpad)
hl.bind(mainMod .. " + KP_End",   hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + KP_Down",  hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + KP_Next",  hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + KP_Left",  hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + KP_Begin", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + KP_Right", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + KP_Home",  hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + KP_Up",    hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + KP_Prior", hl.dsp.focus({ workspace = 9 }))

-- Move window to workspace (numpad)
hl.bind(mainMod .. " + SHIFT + KP_End",   hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + KP_Down",  hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + KP_Next",  hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + KP_Left",  hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + KP_Begin", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + KP_Right", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + KP_Home",  hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + KP_Up",    hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + KP_Prior", hl.dsp.window.move({ workspace = 9 }))

-- Screenshots
hl.bind("PRINT",          hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("ALT + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
