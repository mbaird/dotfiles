local ok, fzf = pcall(require, "fzf-lua")
if not ok then return end

fzf.setup({
  defaults = {
    header = false,
    input_prompt = "> ",
  },
  winopts = {
    preview = {
      hidden = true,
    },
    title_flags = false,
  },
  hls = {
    backdrop = "None",
  },
  fzf_opts = {
    ["--info"] = false,
    ["--layout"] = false,
  },
  keymap = {
    builtin = {
      true,
      ["<C-p>"] = "toggle-preview",
    },
  },
  files = {
    cwd_prompt = false,
  },
  lsp = {
    trim_entry = true,
  },
  grep = {
    exec_empty_query = true,
  },
})
