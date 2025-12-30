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
