-- Hyprland Lua config
-- Converted from hyprlang (see backup/hyprland.conf)
-- See https://wiki.hypr.land/0.56.0/Configuring/Start/

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/0.56.0/Configuring/Basics/Monitors/
hl.monitor({ output = "DP-1",     mode = "2560x1440@164", position = "0x0",     scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60",  position = "2560x0",  scale = 1, transform = 3 })
hl.monitor({ output = "DP-2",     mode = "2560x1440@60",  position = "0x-1440", scale = 1, transform = 2 })
hl.monitor({ output = "",         mode = "preferred",     position = "auto",    scale = "auto" })

-- Keep standard colors when applications enter fullscreen.
hl.config({
    render = { cm_auto_hdr = 0 },
})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "wezterm"
local browser     = "firefox"
local fileManager = "thunar"
local menu        = "rofi --show run"
local music       = "pear-desktop"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/0.56.0/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("/home/user/.local/lib/ashell-hyprland-0.57/ashell")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("playerctld daemon")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")  -- Stores only text data
    hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
    hl.exec_cmd("hypridle")
    hl.exec_cmd("xrandr --output DP-1 --primary")

    hl.exec_cmd(browser, { workspace = "1" })
    hl.exec_cmd(terminal, { workspace = "2", no_initial_focus = true })
    hl.exec_cmd("Telegram", { workspace = "3", no_initial_focus = true })
    hl.exec_cmd("signal-desktop", { workspace = "3", no_initial_focus = true })
    hl.exec_cmd("google-chrome-canary", { workspace = "4", no_initial_focus = true })
    hl.exec_cmd(music, { workspace = "6", no_initial_focus = true, monitor = "DP-2" })

    hl.exec_cmd("fcitx5 --replace -d")
end)


------------------------------
---- ENVIRONMENT VARIABLES ----
------------------------------

-- See https://wiki.hypr.land/0.56.0/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SCREENSHOTS_DIR", os.getenv("HOME") .. "/screenshots")
-- hl.env("XMODIFIERS", "@im=fcitx")
-- hl.env("QT_IM_MODULE", "fcitx")


---------------------
---- PERMISSIONS ----
---------------------

-- See https://wiki.hypr.land/0.56.0/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- hl.permission({ binary = "/usr/(bin|local/bin)/grim", type = "screencopy", mode = "allow" })
-- hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })
-- hl.permission({ binary = "/usr/(bin|local/bin)/hyprpm", type = "plugin", mode = "allow" })


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/0.56.0/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/0.56.0/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves, see https://wiki.hypr.land/0.56.0/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default animations, see https://wiki.hypr.land/0.56.0/Configuring/Advanced-and-Cool/Animations/
hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/0.56.0/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
hl.window_rule({
    name         = "no-gaps-wtv1",
    match        = { float = false, workspace = "w[tv1]" },
    border_size  = 0,
    rounding     = 0,
})
hl.window_rule({
    name         = "no-gaps-f1",
    match        = { float = false, workspace = "f[1]" },
    border_size  = 0,
    rounding     = 0,
})

-- See https://wiki.hypr.land/0.56.0/Configuring/Basics/Variables/#misc
hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


--------------
---- INPUT ----
--------------

-- See https://wiki.hypr.land/0.56.0/Configuring/Basics/Variables/#input
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- See https://wiki.hypr.land/0.56.0/Configuring/Advanced-and-Cool/Gestures
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/0.56.0/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


--------------------
---- KEYBINDINGS ----
--------------------

-- See https://wiki.hypr.land/0.56.0/Configuring/Basics/Binds/
-- local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local mainMod = "ALT" -- Sets "ALT" key as main modifier

-- Example binds, see https://wiki.hypr.land/0.56.0/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q",          hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q",  hl.dsp.exit())
hl.bind(mainMod .. " + F",          hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R",          hl.dsp.exec_cmd(menu .. " -show run"))
hl.bind("SUPER + SHIFT + S",        hl.dsp.exec_cmd("grimblast -f -t png copysave area"))
hl.bind(mainMod .. " + SHIFT + S",  hl.dsp.exec_cmd("systemctl suspend"))
hl.bind("SUPER + L",                hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + V",                hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + SHIFT + F",  hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + E",          hl.dsp.exec_cmd(fileManager))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


------------------------------
---- WINDOWS AND WORKSPACES ----
------------------------------

-- See https://wiki.hypr.land/0.56.0/Configuring/Basics/Window-Rules/
-- See https://wiki.hypr.land/0.56.0/Configuring/Basics/Workspace-Rules/ for workspace rules

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    name           = "ignore-maximize-requests",
    suppress_event = "maximize",
    match          = { class = ".*" },
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name     = "fix-xwayland-dragging",
    no_focus = true,
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
})

hl.window_rule({
    name      = "telegram-windowrule",
    workspace = "3",
    match     = { class = "org.telegram.desktop" },
})

hl.window_rule({
    name      = "signal-windowrule",
    workspace = "3",
    match     = { class = "signal", initial_title = "Signal" },
})

hl.workspace_rule({ workspace = "1", monitor = "DP-1",     default = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "3", monitor = "DP-2",     default = true })
hl.workspace_rule({ workspace = "4", monitor = "DP-1" })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "6", monitor = "DP-2" })
