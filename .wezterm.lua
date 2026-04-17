local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

wezterm.on("update-right-status", function(window, pane)
  window:set_right_status(window:active_workspace())
end)
-- load plugin
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
-- set path to zoxide
workspace_switcher.zoxide_path = "/opt/homebrew/bin/zoxide"

local config = wezterm.config_builder()


config.font = wezterm.font_with_fallback({
	{
		family = "Monaspace Neon Var",
    weight = "Medium",
    harfbuzz_features = {
      "ss01=1",
      "ss02=1",
      "ss03=1",
      "ss04=1",
      "ss05=1",
      "ss06=1",
      "ss07=1",
      "ss08=1",
      "ss09=1",
      "ss10=1",
      "calt=1",
    },
	},
	-- {
	-- 	family = "JetBrains Mono",
	--    weight = "Bold",
	--    harfbuzz_features = {
	--      "ss01=0",
	--      "ss02=0",
	--      "ss19=1",
	--      "ss20=0", 
	--    },
	-- },
})

config.freetype_load_flags = 'NO_HINTING'

config.font_size = 15

config.window_decorations = "RESIZE"

local direction_keys = {
    h = "Left",
    j = "Down",
    k = "Up",
    l = "Right",
}

local function is_vim(pane)
  local proc_info = pane:get_foreground_process_info()
  if not proc_info then return false end
  
  local proc_name = proc_info.name
  return proc_name == 'nvim' or proc_name == 'vim'
end

local function split_nav(key)
    return {
        key = key,
        mods = "CTRL",
        action = wezterm.action_callback(function(win, pane)
            wezterm.log_info("pane variables: " .. wezterm.format(pane:get_user_vars()))
            if is_vim(pane) then
                -- pass the keys through to vim/nvim
                win:perform_action({
                    SendKey = { key = key, mods = "CTRL" },
                }, pane)
            else
                wezterm.log_info("activating pane in direction: " .. direction_keys[key])
                win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
            end
        end),
    }
end


-- Hide tab bar
config.hide_tab_bar_if_only_one_tab = true

-- Sizing
config.initial_cols = 130
config.initial_rows = 24

-- Color scheme
config.color_scheme = "Catppuccin Mocha"

config.window_background_opacity = 0.9
config.macos_window_background_blur = 15

config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 3,
}

config.line_height = 1.2

-- Keys
config.send_composed_key_when_left_alt_is_pressed = true
config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1001 }


config.keys = {
	{
		key = "\\",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
  {
    key = "h",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
  },
  {
    key = "j",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
  },
  {
    key = "k",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
  },
  {
    key = "l",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
  },
  { key = "[", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
  split_nav("h"),
  split_nav("j"),
  split_nav("k"),
  split_nav("l"),
  -- alternative movements when inside nvim
  {
    key = "h",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  { key = 'E', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
  { key = "s", mods = "CTRL|SHIFT", action = workspace_switcher.switch_workspace() },
  { key = "t", mods = "CTRL|SHIFT", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
  { key = "[", mods = "CTRL|SHIFT", action = wezterm.action.SwitchWorkspaceRelative(1) },
  { key = "]", mods = "CTRL|SHIFT", action = wezterm.action.SwitchWorkspaceRelative(-1) },
}

-- keymaps

return config
