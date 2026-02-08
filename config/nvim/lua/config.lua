vim.g.mapleader = " "

vim.g.llama_config = { show_info = false }

vim.g.splitjoin_ruby_curly_braces = 0
vim.g.splitjoin_ruby_do_block_split = 0
vim.g.splitjoin_ruby_hanging_args = 0
vim.g.splitjoin_ruby_options_as_arguments = 1

vim.g.projectionist_heuristics = {
  ["go.mod"] = {
    ["*.go"] = {
      ["type"] = "source",
      ["alternate"] = "{}_test.go",
      ["make"] = "go run {file}",
    },
    ["*_test.go"] = {
      ["type"] = "test",
      ["alternate"] = "{}.go",
    },
  },
}

vim.g["test#go#gotest#options"] = "-race -tags=debug -v"

vim.opt.background = "light"
vim.opt.complete = ".,o"
vim.opt.completeopt = "fuzzy,menuone,noselect"
vim.opt.confirm = true
vim.opt.expandtab = true
vim.opt.guicursor:append("t:hor20")
vim.opt.list = true
vim.opt.listchars:append("trail:∙")
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.pumborder = "rounded"
vim.opt.pumheight = 7
vim.opt.scrolloff = 5
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.shortmess = {
  A = true, -- Hide `swapfile` messages
  I = true, -- Hide intro message
  F = true, -- Hide file messages
  c = true, -- Hide completion messages
  t = true, -- Truncate long file messages
  T = true, -- Truncate other long messages
}
vim.opt.spelllang = "en_gb"
vim.opt.statusline = table.concat({
  " %f ",     -- Filepath
  "%m%r%h%w", -- Flags
  "%=",       -- Separator
  [[%{% luaeval('#vim.diagnostic.count() ~= 0 and vim.diagnostic.status() .. " " or ""') %}]],
  "%{&filetype != '' ? &filetype : 'none'} ",
  "%2c:",     -- Column
  "%l/%L ",   -- Line, Total
}, "")
vim.opt.tabstop = 2
vim.opt.winborder = "rounded"

vim.cmd.colorscheme("light")

vim.diagnostic.config({
  float = {
    focus = false,
    scope = "cursor",
  },
  jump = {
    on_jump = vim.diagnostic.open_float,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.WARN] = "",
    },
  },
})

vim.lsp.enable({
  "golangci_lint_ls",
  "gopls",
  "herb_ls",
  "intelephense",
  "jsonls",
  "ruby_lsp",
  "ts_ls",
})
