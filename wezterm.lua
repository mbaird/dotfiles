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
config.quit_when_all_windows_are_closed = false

-- Tabs
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true

function is_dark()
  return false
  -- if wezterm.gui then
  --   return wezterm.gui.get_appearance():find("Dark")
  -- end
  -- return true
end

local c_yellow
local c_aqua
local c_ochre
local c_ocean
local c_white
local c_magenta
local c_lavender
local c_cumulonimbus
local c_pigeon
local c_smoke
local c_space
local c_smoke_blend

if is_dark() then
  config.set_environment_variables = {
    OS_THEME = 'dark',
    FZF_DEFAULT_OPTS = '--color=fg:-1,bg:-1,hl:#caafeb,fg+:#79ada7,bg+:#13161f,hl+:#caafeb,info:#bebec3,prompt:#e5e5eb,pointer:#bebec3,marker:#e87c69,spinner:#bebec3,header:#bebec3'
  }

  c_yellow = 'hsl:34 66 71'
  c_aqua = 'hsl:173 23 58'
  c_ochre = 'hsl:12 71 66'
  c_ocean = 'hsl:216 21 23'
  c_white = 'hsl:240 9 90'
  c_magenta = 'hsl:309 57 71'
  c_lavender = 'hsl:263 66 80'
  c_cumulonimbus = 'hsl:214 28 46'
  c_pigeon = 'hsl:220 21 65'
  c_thunder = 'hsl:215 29 35'
  c_smoke = 'hsl:240 5 76'
  c_space = 'hsl:230 22 10'
  c_smoke_blend = 'hsl:225 16 2'
else
  config.set_environment_variables = {
    OS_THEME = 'light',
    FZF_DEFAULT_OPTS = '--color=fg:-1,bg:-1,hl:#9d7bca,fg+:#3b8f84,bg+:#faf7ee,hl+:#9d7bca,info:#404553,prompt:#385372,pointer:#404553,marker:#c84b2b,spinner:#404553,header:#404553'
  }

  c_yellow = 'hsl:40 100 39'
  c_aqua = 'hsl:171 40 39'
  c_ochre = 'hsl:14 63 47'
  c_ocean = 'hsl:28 35 93'
  c_white = 'hsl:213 32 34'
  c_magenta = 'hsl:312 38 49'
  c_lavender = 'hsl:263 38 64'
  c_cumulonimbus = 'hsl:213 32 42'
  c_pigeon = 'hsl:240 26 53'
  c_smoke = 'hsl:221 14 29'
  c_space = 'hsl:37 64 97'
  c_smoke_blend = 'hsl:210 4 89'
end

-- Theme
config.colors = {
  ansi = {
    c_ocean,
    c_ochre,
    c_aqua,
    c_yellow,
    c_cumulonimbus,
    c_lavender,
    c_magenta,
    c_white,
  },

  brights = {
    c_white,
    c_ochre,
    c_aqua,
    c_yellow,
    c_cumulonimbus,
    c_lavender,
    c_magenta,
    c_pigeon,
  },

  cursor_bg = c_white,
  cursor_border = c_white,
  cursor_fg = c_space,
  selection_fg = c_smoke,
  selection_bg = c_smoke_blend,
  foreground = c_smoke,
  background = c_space,
}

config.inactive_pane_hsb = {
  saturation = 1.0,
  brightness = 0.90,
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
