local M = {}

M.omnifunc = function(findstart, _)
  if findstart == 1 then
    return -1
  else
    local response = vim.system({
      "curl",
      "--silent",
      "--get",
      "--header", "Accept: application/json",
      "--data-urlencode", "fields=key,summary",
      "--config", vim.fn.expand("~/.jira-completion")
    }, {
      text = true,
    }):wait()

    if response.code ~= 0 then
      vim.notify("Request failed: '" .. response.stderr:gsub("\n", "") .. "'")
      return {}
    end

    local ok, parsed = pcall(vim.fn.json_decode, response.stdout)

    if not ok then
      vim.notify("Failed to parse: '" .. response.stdout:gsub("\n", "") .. "'")
      return {}
    end

    local issues = parsed.issues

    if not issues or #issues == 0 then
      vim.notify("No issues found")
      return {}
    end

    local completions = {}

    for _, issue in ipairs(issues) do
      local key = issue.key
      local summary = issue.fields.summary
      local len = 50

      table.insert(completions, {
        word = issue.self:match("(https?://[^/]+)") .. "/browse/" .. key,
        abbr = key .. " " .. (summary:len() > len and summary:sub(1, len) .. "..." or summary),
      })
    end

    return completions
  end
end

return M
