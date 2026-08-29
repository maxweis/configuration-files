-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
-- Use Caps Lock and both Alt keys as Super keys. Alt/Win pairs are swapped.
hl.config({ input = { kb_options = "caps:super,altwin:swap_lalt_lwin,altwin:swap_ralt_rwin" } })

-- hl.config({
--   input = {
--     -- Use multiple keyboard layouts and switch between them with Left Alt + Right Alt.
--     kb_layout = "us,dk,eu",
--     kb_options = "compose:caps,shift:both_capslock_cancel,grp:alts_toggle",
--
--     -- Use a specific keyboard variant if needed (e.g. intl for international keyboards).
--     kb_variant = "intl",
--
--     -- Change speed of keyboard repeat.
--     repeat_rate = 40,
--     repeat_delay = 250,
--
--     -- Start with numlock on by default.
--     numlock_by_default = true,
--
--     -- Increase sensitivity for mouse/trackpad (default: 0).
--     sensitivity = 0.35,
--
--     -- Turn off mouse acceleration (default: adaptive).
--     accel_profile = "flat",
--
--     touchpad = {
--       -- Use natural (inverse) scrolling.
--       natural_scroll = true,
--
--       -- Use two-finger clicks for right-click instead of lower-right corner.
--       clickfinger_behavior = true,
--
--       -- Control the speed of your scrolling.
--       scroll_factor = 0.4,
--
--       -- Enable the touchpad while typing.
--       disable_while_typing = false,
--
--       -- Left-click-and-drag with three fingers.
--       drag_3fg = 1,
--     },
--   },
-- })

-- App-specific touchpad scroll speeds.
-- o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
-- o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })

-- Enable touchpad gestures for changing workspaces.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- Explicit three-finger workspace navigation. Numeric targets allow an empty
-- workspace to be created on either side, including to the left.
local function focus_adjacent_workspace(delta)
  return function()
    local workspace = hl.get_active_workspace()
    if not workspace then return end
    local target = workspace.id + delta
    if target < 1 then
      target = 1
      for _, candidate in ipairs(hl.get_workspaces()) do
        if candidate and not candidate.special and candidate.id > target then
          target = candidate.id
        end
      end
    end
    hl.dispatch(hl.dsp.focus({ workspace = tostring(target) }))
  end
end

hl.gesture({ fingers = 3, direction = "left", action = focus_adjacent_workspace(-1) })
hl.gesture({ fingers = 3, direction = "right", action = focus_adjacent_workspace(1) })

-- Use three-finger vertical motion to continuously zoom around the pointer.
-- Up zooms in and down zooms out; this replaces pinch-to-zoom.
local zoom_per_pixel = 0.006
local min_zoom = 1.0
local max_zoom = 3.0

local function apply_zoom_delta(delta_y)
  local current = hl.get_config("cursor.zoom_factor") or min_zoom
  local next_zoom = current * math.exp(-delta_y * zoom_per_pixel)
  next_zoom = math.max(min_zoom, math.min(max_zoom, next_zoom))
  hl.config({ cursor = { zoom_factor = next_zoom } })
end

hl.gesture({
  fingers = 3,
  direction = "vertical",
  action = {
    start = function(e) apply_zoom_delta(e.delta.y) end,
    update = function(e) apply_zoom_delta(e.delta.y) end,
    finish = function() end,
  },
})

-- Smooth workspace transitions while keeping them quick enough for swipes.
hl.animation({ leaf = "workspaces", enabled = true, speed = 6.5, bezier = "easeOutQuint" })

-- Reverse the workspace-swipe direction.
hl.config({
  gestures = {
    workspace_swipe_invert = false,
    -- Require a longer, more deliberate three-finger swipe.
    workspace_swipe_distance = 360,
    workspace_swipe_min_speed_to_force = 35,
    -- Allow workspace swipes to continue into empty/new workspaces.
    workspace_swipe_create_new = true,
    -- Stop at the edge so Hyprland can create the next workspace.
    workspace_swipe_forever = false,
  },
})

-- Enable touchpad gestures for moving focus (helpful on scrolling layout).
-- hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({ direction = "l" })) end })
-- hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({ direction = "r" })) end })
