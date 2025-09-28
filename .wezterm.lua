local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
	{
		family = "JetBrains Mono",
		harfbuzz_features = { "liga=0", "calt=0", "dlig=0" },
	},
	{
		family = "Monaspace Neon",
		-- harfbuzz_features = { "liga=0", "calt=0", "dlig=0" },
	},
})

config.font_size = 15

-- Hide tab bar
config.hide_tab_bar_if_only_one_tab = true

-- Sizing
config.initial_cols = 130
config.initial_rows = 24

-- Color scheme
config.color_scheme = "OneDark (base16)"

config.window_background_opacity = 0.9
config.macos_window_background_blur = 25

config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 3,
}

config.line_height = 1.45

-- Keys
config.send_composed_key_when_left_alt_is_pressed = true
config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1000 }
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
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
}
return config
