local command = vim.api.nvim_create_user_command

local ok, fzf = pcall(require, "fzf-lua")
if ok then
  local fzf_callback = fzf.utils.create_user_command_callback
  command("Rg", fzf_callback("grep", "search"), { desc = "Search", nargs = "?" })
end

command("PackSync", function()
  local plugins = {}
  for _, plugin in ipairs(my.plugins) do
    if type(plugin) == "string" then
      plugins[plugin] = true
    elseif type(plugin) == "table" and plugin.src then
      plugins[plugin.src] = true
    end
  end

  local to_delete = {}
  for _, plugin in ipairs(vim.pack.get()) do
    local src = plugin.spec and plugin.spec.src
    if src and not plugins[src] then
      table.insert(to_delete, plugin.spec.name)
    end
  end

  vim.pack.del(to_delete)
  vim.pack.add(my.plugins)
  vim.pack.update()
end, { desc = "Sync plugins" })
