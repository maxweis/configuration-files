-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Move bindings that previously occupied SUPER+J/K/L to shifted variants.
hl.unbind("SUPER + J")
hl.unbind("SUPER + SHIFT + J")
o.bind("SUPER + CTRL + SHIFT + J", "Toggle window split", hl.dsp.layout("togglesplit"))
hl.unbind("SUPER + K")
hl.unbind("SUPER + SHIFT + K")
o.bind("SUPER + CTRL + SHIFT + K", "Keybindings", "omarchy-menu-keybindings")
hl.unbind("SUPER + L")
hl.unbind("SUPER + SHIFT + L")
o.bind("SUPER + CTRL + SHIFT + L", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")

-- Use SUPER+SHIFT+TAB to open the graphical window-switcher menu.
hl.unbind("SUPER + SHIFT + TAB")
o.bind("SUPER + SHIFT + TAB", "Window switcher", "/home/max/.config/omarchy/plugins/io.github.xadacka.window-switcher/bin/omarchy-window-switcher")

-- Vim-style directional focus. Keep the arrow-key bindings as alternatives.
o.bind("SUPER + H", "Focus left / menu back", "/home/max/.local/bin/omarchy-vim-nav Left l")
o.bind("SUPER + J", "Focus down / menu down", "/home/max/.local/bin/omarchy-vim-nav Down d")
o.bind("SUPER + K", "Focus up / menu up", "/home/max/.local/bin/omarchy-vim-nav Up u")
o.bind("SUPER + L", "Focus right / menu select", "/home/max/.local/bin/omarchy-vim-nav Right r")

-- Vim-style active-window movement with SUPER+SHIFT+H/J/K/L.
o.bind("SUPER + SHIFT + H", "Move window to the left", hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + SHIFT + J", "Move window down", hl.dsp.window.swap({ direction = "d" }))
o.bind("SUPER + SHIFT + K", "Move window up", hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + SHIFT + L", "Move window to the right", hl.dsp.window.swap({ direction = "r" }))

-- Vim-style focused-window resizing with SUPER+CTRL+H/J/K/L.
hl.unbind("SUPER + CTRL + H")
hl.unbind("SUPER + CTRL + J")
hl.unbind("SUPER + CTRL + K")
hl.unbind("SUPER + CTRL + L")
o.bind("SUPER + CTRL + H", "Expand window horizontally", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
o.bind("SUPER + CTRL + J", "Expand window downward", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))
o.bind("SUPER + CTRL + K", "Shrink window upward", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
o.bind("SUPER + CTRL + L", "Shrink window horizontally", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))

-- Media controls.
hl.unbind("SUPER + COMMA")
hl.unbind("SUPER + PERIOD")
hl.unbind("SUPER + SLASH")
o.bind("SUPER + COMMA", "Previous song", "playerctl previous")
o.bind("SUPER + PERIOD", "Next song", "playerctl next")
o.bind("SUPER + SLASH", "Play / pause", "playerctl play-pause")

-- Volume controls.
o.bind("SUPER + BRACKETLEFT", "Volume down", "omarchy-audio-output-volume lower")
o.bind("SUPER + BRACKETRIGHT", "Volume up", "omarchy-audio-output-volume raise")
o.bind("SUPER + BACKSLASH", "Mute toggle", "omarchy-audio-output-volume mute-toggle")

-- Replace the old horizontal-resize shortcuts with display brightness controls.
hl.unbind("SUPER + MINUS")
hl.unbind("SUPER + EQUAL")
hl.unbind("SUPER + code:20")
hl.unbind("SUPER + code:21")
o.bind("SUPER + MINUS", "Brightness down", "omarchy-brightness-display 5%-", { locked = true, repeating = true })
o.bind("SUPER + EQUAL", "Brightness up", "omarchy-brightness-display +5%", { locked = true, repeating = true })

-- Open the Omarchy menu with SUPER+; (no SHIFT).
hl.unbind("SUPER + SPACE")
o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle")
o.bind("SUPER + semicolon", "Omarchy menu", "omarchy-menu toggle")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Added by the xadacka.window-switcher plugin.
o.bind("SUPER + GRAVE", "Window switcher", "/home/max/.config/omarchy/plugins/io.github.xadacka.window-switcher/bin/omarchy-window-switcher")

-- Use the dedicated Copilot/Assistant key to open the ChatGPT desktop app.
hl.unbind("XF86Assistant")
o.bind("XF86Assistant", "ChatGPT", "chatgpt")
-- ASUS Copilot keys commonly emit Windows+Shift+F23 rather than a single key.
-- Windows is swapped to Alt in this setup, so bind both possible reports.
o.bind("SUPER + SHIFT + F23", "ChatGPT", "chatgpt")
o.bind("SUPER + SHIFT + XF86Assistant", "ChatGPT", "chatgpt")
o.bind("ALT + SHIFT + F23", "ChatGPT", "chatgpt")
o.bind("ALT + SHIFT + XF86Assistant", "ChatGPT", "chatgpt")
