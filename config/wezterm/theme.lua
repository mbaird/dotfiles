local wezterm = require("wezterm")
local M = {}

wezterm.add_to_config_reload_watch_list('/tmp/appearance')

M.toggle = function()
  local mode = M.mode

  if mode == 'light' then
    mode = 'dark'
  else
    mode = 'light'
  end

  local ok, _, stderr = wezterm.run_child_process({
    "sh", "-c", 'printf %s "' .. mode .. '" > /tmp/appearance',
  })

  if not ok then
    error(stderr, 0)
  else
    M.mode = mode
    wezterm.run_child_process({ 'pkill', '-USR1', 'nvim' })
  end
end

M.init = function()
  local ok, stdout = wezterm.run_child_process({
    "sh", "-c", "cat /tmp/appearance",
  })

  if ok then
    M.mode = stdout
  else
    M.toggle()
  end

  return M
end

return M
