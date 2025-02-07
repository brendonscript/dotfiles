local wezterm = require "wezterm"
local applyKeymaps = require("keymaps").applyKeymaps
local colors = wezterm.color
local theme = colors.get_builtin_schemes()["tokyonight_storm"]

local nvim = require("nvim").apply_smart_splits

wezterm.on("update-right-status", function(window, pane)
  local leader = ""
  if window:leader_is_active() then
    leader = " ^A "
  end

  local domain = ""
  if pane:get_domain_name() == "unix" then
    domain = " " .. "(C)"

    if window:active_workspace() == "default" then
      domain = domain .. " "
    end
  end

  local workspace = ""
  if window:active_workspace() ~= "default" then
    workspace = " " .. window:active_workspace() .. " "
  end

  window:set_right_status(wezterm.format {
    { Foreground = { Color = "Black" } },
    { Background = { Color = "Orange" } },
    { Text = leader },
    "ResetAttributes",
    { Text = domain },
    { Text = workspace },
  })
end)

local font_size = 18.0
local config = wezterm.config_builder()

config = {
  window_padding = {
    top = 0,
    bottom = 0,
    left = 0,
    right = 0,
  },
  audible_bell = "Disabled",
  cursor_blink_rate = 0,
  default_cursor_style = "SteadyBlock",
  window_background_opacity = 0.9,
  text_background_opacity = 0.9,

  command_palette_font_size = font_size,
  command_palette_bg_color = theme.background,
  command_palette_fg_color = theme.foreground,

  color_scheme = "tokyonight_storm",
  font = wezterm.font_with_fallback {
    { family = "Monaspace Neon", weight = "Medium" },
    { family = "Symbols Nerd Font Regular" },
    { family = "Symbols Nerd Font Mono Regular" },
    { family = "Symbols Nerd Font" },
    { family = "SF Pro" },
    { family = "sketchybar-app-font" },
    { family = "Hack Nerd Font" },
    { family = "MonaspiceNe Nerd Font Mono", weight = "Medium" },
    { family = "MonaspiceNe Nerd Font Mono", weight = "Medium" },
  },
  window_decorations = "RESIZE",

  -- unix_domains = {
  --   {
  --     name = "unix",
  --   },
  -- },
  -- default_gui_startup_args = { "connect", "unix" },

  -- mux_env_remove = {
  --   "SSH_AUTH_SOCK",
  --   "SSH_CLIENT",
  --   "SSH_CONNECTION",
  --   "GPG_TTY",
  -- },
  allow_square_glyphs_to_overflow_width = "Always",
  freetype_load_target = "Light",
  freetype_render_target = "HorizontalLcd",
  font_size = font_size,
  line_height = 1.1,
  max_fps = 240,

  enable_scroll_bar = false,
  native_macos_fullscreen_mode = true,
  hide_mouse_cursor_when_typing = false,

  use_fancy_tab_bar = false,
  tab_bar_at_bottom = false,
  tab_max_width = 24,
  hide_tab_bar_if_only_one_tab = false,

  window_frame = {
    font_size = font_size,
  },

  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = true,
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.9,
  },
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "pwsh.exe" }
end

applyKeymaps(config)
nvim(config)

return config
