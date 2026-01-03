_G.my = {}

my.plugins = {
  "https://github.com/AndrewRadev/splitjoin.vim",
  "https://github.com/ggml-org/llama.vim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/rktjmp/lush.nvim",
  "https://github.com/rktjmp/shipwright.nvim",
  "https://github.com/tommcdo/vim-exchange",
  "https://github.com/tpope/vim-eunuch",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/tpope/vim-projectionist",
  "https://github.com/tpope/vim-rails",
  "https://github.com/tpope/vim-repeat",
  "https://github.com/tpope/vim-rhubarb",
  "https://github.com/tpope/vim-surround",
  "https://github.com/tpope/vim-unimpaired",
  "https://github.com/vim-test/vim-test",
}

vim.pack.add(my.plugins)

require("plugins.fzf")

require("config")
require("commands")
require("keymaps")
require("autocmds")
