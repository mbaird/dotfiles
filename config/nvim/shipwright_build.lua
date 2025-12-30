local lushwright = require("shipwright.transform.lush")
local helpers = require("shipwright.transform.helpers")

package.loaded["theme.palette"] = nil
package.loaded["theme.theme"] = nil

local palette = require("theme.palette")
local colorscheme = require("theme.theme")

run(colorscheme, lushwright.to_lua, function(lines)
  local template = [[
local colors = {
$colors
}

vim.opt.background = "light"
vim.cmd("highlight clear")
vim.cmd("syntax reset")

for group, attrs in pairs(colors) do
  vim.api.nvim_set_hl(0, group, attrs)
end
]]
  return helpers.split_newlines(helpers.apply_template(template, {
    colors = table.concat(lines, "\n"),
  }))
end, { overwrite, vim.fn.expand("~/.dotfiles/config/nvim/colors/light.lua") })

local wezterm = run({ colorscheme = colorscheme, palette = palette }, function(theme)
  local c = theme.colorscheme
  local p = theme.palette

  return {
    fg = p.text,
    bg = p.base,
    cursor_fg = c.Cursor.fg,
    cursor_bg = c.Cursor.bg,
    cursor_border = c.Cursor.bg,
    selection_fg = "none",
    selection_bg = c.Visual.bg,
    black = p.overlay,
    red = p.error,
    green = p.pine,
    yellow = p.gold,
    blue = p.foam,
    magenta = p.iris,
    cyan = p.rose,
    white = p.text,
    bright_black = p.subtle,
    bright_red = p.error,
    bright_green = p.pine,
    bright_yellow = p.gold,
    bright_blue = p.foam,
    bright_magenta = p.iris,
    bright_cyan = p.rose,
    bright_white = p.text,
    tab_bar_background = p.base,
    tab_bar_active_bg = p.base,
    tab_bar_active_fg = c.StatusLine.fg,
    tab_bar_inactive_bg = p.base,
    tab_bar_inactive_fg = c.StatusLineNC.fg,
  }
end)

run(wezterm, { contrib.wezterm }, {
  append,
  run(wezterm, function(w)
    local template = [[
[colors.tab_bar]
background = "$tab_bar_background"

[colors.tab_bar.active_tab]
bg_color = "$tab_bar_active_bg"
fg_color = "$tab_bar_active_fg"
intensity = "Bold"

[colors.tab_bar.inactive_tab]
bg_color = "$tab_bar_inactive_bg"
fg_color = "$tab_bar_inactive_fg"
]]

    return helpers.split_newlines(helpers.apply_template(template, w))
  end),
}, { overwrite, vim.fn.expand("~/.dotfiles/config/wezterm/colors/light.toml") })

local ghostty = run({ colorscheme = colorscheme, palette = palette }, function(theme)
  local c = theme.colorscheme
  local p = theme.palette

  return {
    background = p.base,
    foreground = p.text,
    cursor_color = c.Cursor.bg,
    cursor_text = c.Cursor.fg,
    selection_background = c.Visual.bg,
    selection_foreground = p.text,
    palette_0 = p.overlay,
    palette_1 = p.error,
    palette_2 = p.pine,
    palette_3 = p.gold,
    palette_4 = p.foam,
    palette_5 = p.iris,
    palette_6 = p.rose,
    palette_7 = p.text,
    palette_8 = p.subtle,
    palette_9 = p.error,
    palette_10 = p.pine,
    palette_11 = p.gold,
    palette_12 = p.foam,
    palette_13 = p.iris,
    palette_14 = p.rose,
    palette_15 = p.text,
  }
end)

run(ghostty, function(g)
  local template = [[
background = $background
foreground = $foreground
cursor-color = $cursor_color
cursor-text = $cursor_text
selection-background = $selection_background
selection-foreground = $selection_foreground
palette = 0=$palette_0
palette = 1=$palette_1
palette = 2=$palette_2
palette = 3=$palette_3
palette = 4=$palette_4
palette = 5=$palette_5
palette = 6=$palette_6
palette = 7=$palette_7
palette = 8=$palette_8
palette = 9=$palette_9
palette = 10=$palette_10
palette = 11=$palette_11
palette = 12=$palette_12
palette = 13=$palette_13
palette = 14=$palette_14
palette = 15=$palette_15
]]
  return helpers.split_newlines(helpers.apply_template(template, g))
end, { overwrite, vim.fn.expand("~/.dotfiles/config/ghostty/themes/light") })
