return {
  init_options = {
    formatter = "standard",
    linters = { "standard" },
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
  reuse_client = function(client, config)
    return client.config.root_dir == config.root_dir
  end,
}
