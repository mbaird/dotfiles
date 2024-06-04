local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local hostname = wezterm.hostname()
local act = wezterm.action

-- Text
config.font_size = 15.0
config.line_height = 1.22
config.cell_width = 0.94
config.font = wezterm.font('SF Mono')
config.font_rules = {
  {
    intensity = 'Normal',
    font = wezterm.font('SF Mono', { italic = false })
  },
  {
    intensity = 'Bold',
    font = wezterm.font('SF Mono', { weight = 'Regular' })
  }
}

-- Cursor
config.default_cursor_style = "SteadyUnderline"
config.cursor_thickness = 2.0

-- Window
config.initial_rows = 30
config.initial_cols = 110
config.use_resize_increments = true
config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0.5cell',
  bottom = '0cell',
}

-- Tabs
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true

-- Theme
config.colors = {
  ansi = {
    '#131313',
    '#fc6a5d',
    '#8abae1',
    '#dddddd',
    '#ffffff',
    '#dddddd',
    '#dddddd',
    '#ffffff',
  },

  brights = {
    '#131313',
    '#fc6a5d',
    '#8abae1',
    '#dddddd',
    '#ffffff',
    '#dddddd',
    '#dddddd',
    '#ffffff',
  },

  cursor_bg = "#efbf38",
  cursor_border = "#131313",
  cursor_fg = "#08080a",
  foreground = "#c1c1c1",
  background = "#131313",
}

config.inactive_pane_hsb = {
  saturation = 1.0,
  brightness = 0.6,
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
