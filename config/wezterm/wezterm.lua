local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- Text
config.font_size = 15.0
config.line_height = 1.22
config.cell_width = 0.94
config.font = wezterm.font('SF Mono')

-- Cursor
config.default_cursor_style = "SteadyUnderline"
config.cursor_thickness = 2.0
config.cursor_blink_rate = 0

-- Window
config.quit_when_all_windows_are_closed = false
config.use_resize_increments = true
config.window_decorations = "TITLE|RESIZE"
config.window_padding = {
  bottom = '0cell',
}

-- Tabs
config.show_new_tab_button_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_bar_at_bottom = true
config.tab_max_width = 25
config.use_fancy_tab_bar = false

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
  selection_fg = "#131313",
  selection_bg = "#ffffff",
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
