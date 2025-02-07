local wezterm = require "wezterm"
local mux = wezterm.mux
local utils = require "utils"
local action = wezterm.action
local module = {}
local keys = {}

local function mergeKeys(...)
  local args = { ... }
  for i = 1, #args do
    keys = utils.mergeArrays(keys, args[i])
  end
end

-- local nvimKeys = require("nvim")

local paneKeys = {
  {
    key = "s",
    mods = "LEADER",
    action = action.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = "v",
    mods = "LEADER",
    action = action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    key = "z",
    mods = "LEADER",
    action = action.TogglePaneZoomState,
  },
  {
    key = "c",
    mods = "LEADER",
    action = action.SpawnTab "CurrentPaneDomain",
  },
  {
    key = "h",
    mods = "LEADER",
    action = action.ActivatePaneDirection "Left",
  },
  {
    key = "j",
    mods = "LEADER",
    action = action.ActivatePaneDirection "Down",
  },
  {
    key = "k",
    mods = "LEADER",
    action = action.ActivatePaneDirection "Up",
  },
  {
    key = "l",
    mods = "LEADER",
    action = action.ActivatePaneDirection "Right",
  },
  -- {
  -- 	key = "h",
  -- 	mods = "CTRL",
  -- 	action = action.ActivatePaneDirection("Left"),
  -- },
  -- {
  -- 	key = "j",
  -- 	mods = "CTRL",
  -- 	action = action.ActivatePaneDirection("Down"),
  -- },
  -- {
  -- 	key = "k",
  -- 	mods = "CTRL",
  -- 	action = action.ActivatePaneDirection("Up"),
  -- },
  -- {
  -- 	key = "l",
  -- 	mods = "CTRL",
  -- 	action = action.ActivatePaneDirection("Right"),
  -- },
  {
    key = "H",
    mods = "LEADER|SHIFT",
    action = action.AdjustPaneSize { "Left", 5 },
  },
  {
    key = "J",
    mods = "LEADER|SHIFT",
    action = action.AdjustPaneSize { "Down", 5 },
  },
  {
    key = "K",
    mods = "LEADER|SHIFT",
    action = action.AdjustPaneSize { "Up", 5 },
  },
  {
    key = "L",
    mods = "LEADER|SHIFT",
    action = action.AdjustPaneSize { "Right", 5 },
  },
  {
    key = "h",
    mods = "CTRL|SHIFT",
    action = action.AdjustPaneSize { "Left", 5 },
  },
  {
    key = "j",
    mods = "CTRL|SHIFT",
    action = action.AdjustPaneSize { "Down", 5 },
  },
  {
    key = "k",
    mods = "CTRL|SHIFT",
    action = action.AdjustPaneSize { "Up", 5 },
  },
  {
    key = "l",
    mods = "CTRL|SHIFT",
    action = action.AdjustPaneSize { "Right", 5 },
  },
  {
    key = "o",
    mods = "LEADER|CTRL",
    action = action.RotatePanes "Clockwise",
  },
  {
    key = "x",
    mods = "LEADER",
    action = action.CloseCurrentPane { confirm = true },
  },
}

local tabKeys = {
  {
    key = "n",
    mods = "LEADER",
    action = action.ActivateTabRelative(1),
  },
  {
    key = "p",
    mods = "LEADER",
    action = action.ActivateTabRelative(-1),
  },
  {
    key = "a",
    mods = "LEADER|CTRL",
    action = action.ActivateLastTab,
  },
  {
    key = "1",
    mods = "LEADER",
    action = action.ActivateTab(0),
  },
  {
    key = "2",
    mods = "LEADER",
    action = action.ActivateTab(1),
  },
  {
    key = "3",
    mods = "LEADER",
    action = action.ActivateTab(2),
  },
  {
    key = "4",
    mods = "LEADER",
    action = action.ActivateTab(3),
  },
  {
    key = "5",
    mods = "LEADER",
    action = action.ActivateTab(4),
  },
  {
    key = "6",
    mods = "LEADER",
    action = action.ActivateTab(5),
  },
  {
    key = "7",
    mods = "LEADER",
    action = action.ActivateTab(6),
  },
  {
    key = "8",
    mods = "LEADER",
    action = action.ActivateTab(7),
  },
  {
    key = "9",
    mods = "LEADER",
    action = action.ActivateTab(8),
  },
  {
    key = "d",
    mods = "LEADER",
    action = action.DetachDomain "CurrentPaneDomain",
  },
  {
    key = ",",
    mods = "LEADER",
    action = action.PromptInputLine {
      description = "Enter new name for tab",
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
}

local workspaceKeys = {
  {
    key = "c",
    mods = "LEADER|CTRL",
    action = action.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Text = "Enter name for new workspace" },
      },
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            action.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },
  {
    key = ",",
    mods = "LEADER|CTRL",
    action = action.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Text = "Enter name for workspace" },
      },
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          mux.rename_workspace(mux.get_active_workspace(), line)
        end
      end),
    },
  },
  {
    key = "n",
    mods = "LEADER|CTRL",
    action = action.SwitchWorkspaceRelative(1),
  },
  {
    key = "p",
    mods = "LEADER|CTRL",
    action = action.SwitchWorkspaceRelative(-1),
  },
}

local wezKeys = {
  {
    key = "f",
    mods = "LEADER|CTRL",
    action = action.ShowLauncher,
  },
  {
    key = "]",
    mods = "LEADER",
    action = action.ActivateCopyMode,
  },
  {
    key = "p",
    mods = "LEADER|CTRL",
    action = action.SwitchWorkspaceRelative(-1),
  },
  {
    key = ":",
    mods = "LEADER|SHIFT",
    action = action.ActivateCommandPalette,
  },
}

-- mergeKeys(paneKeys, tabKeys, workspaceKeys, wezKeys, nvimKeys)
mergeKeys(paneKeys, tabKeys, workspaceKeys, wezKeys)

local function applyKeymaps(config)
  config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = math.maxinteger }
  config.keys = keys
end

module.applyKeymaps = applyKeymaps
return module
