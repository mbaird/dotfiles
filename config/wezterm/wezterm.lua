local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- Text
config.font_size = 15.0
config.line_height = 1.22
config.cell_width = 0.94
config.font = wezterm.font('SF Mono')
config.font_rules = {
  { intensity = 'Half', font = wezterm.font('SF Mono', { weight = 'Regular' }) }
}

-- Cursor
config.default_cursor_style = "SteadyUnderline"
config.cursor_thickness = 2.0
config.cursor_blink_rate = 0

-- Window
config.quit_when_all_windows_are_closed = false
config.window_decorations = "TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
config.window_padding = {
  bottom = '0cell',
}

-- Tabs
config.show_new_tab_button_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_bar_at_bottom = true
config.tab_max_width = 35
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Theme
config.color_scheme = "light"
config.inactive_pane_hsb = {
  brightness = 0.9,
}

-- Shortcuts
config.keys = {
  {
    key = ",",
    mods = "SUPER",
    action = act.SpawnCommandInNewWindow({
      cwd = os.getenv("WEZTERM_CONFIG_DIR"),
      args = { os.getenv("SHELL"), "-c", "$EDITOR $WEZTERM_CONFIG_FILE" },
    }),
  },
  {
    key = 'Enter',
    mods = 'CMD',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    key = 'Enter',
    mods = 'CMD|SHIFT',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'w',
    mods = 'CMD',
    action = act.CloseCurrentPane { confirm = true },
  },
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
    },
  },
  {
    key = '[',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Prev',
  },
  {
    key = ']',
    mods = 'CMD',
    action = act.ActivatePaneDirection 'Next',
  },
}

return config
