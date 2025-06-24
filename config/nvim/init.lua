require('paq') {
  'AndrewRadev/splitjoin.vim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'ggandor/leap.nvim',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  'junegunn/fzf',
  'junegunn/fzf.vim',
  'neovim/nvim-lspconfig',
  'ojroques/nvim-lspfuzzy',
  'savq/paq-nvim',
  'tpope/vim-eunuch',
  'tpope/vim-fugitive',
  'tpope/vim-projectionist',
  'tpope/vim-repeat',
  'tpope/vim-rhubarb',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  'vim-test/vim-test',
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
}

vim.g.mapleader = ' '

vim.o.expandtab = true        -- Convert tabs to spaces
vim.o.showcmd = false         -- Disable showing keystrokes below statusline
vim.o.swapfile = false        -- Disable swapfile
vim.o.number = true           -- Show the current line number
vim.o.shiftround = true       -- Use multiple of shiftwidth when indenting
vim.o.shiftwidth = 2          -- Use 2 spaces for auto indent
vim.o.shortmess = 'atIF'      -- Disable intro message, truncate shortmessages
vim.o.tabstop = 2             -- Number of spaces per tab
vim.o.scrolloff = 3           -- Keep lines of context when scrolling
vim.o.mouse = ''              -- Disable mouse
vim.o.list = true             -- Show whitespace

vim.o.statusline = table.concat({
  ' %f',        -- Filepath
  ' %m%r%h%w',  -- Flags for Modified, Readonly, Help, Preview
  '%<',
  '%=',
  "%{&filetype != '' ? &filetype : 'none'} ",
  '%2c,',       -- Column
  '%l/%L '      -- Line number / number of lines in buffer
}, '')

-- Switch to last viewed buffer
vim.keymap.set('n', '<leader><leader>', '<c-^>')

-- Quick edit config
vim.keymap.set('n', '<leader>v', '<cmd>e $MYVIMRC<return>')

-- Quick save
vim.keymap.set('n', '<esc><esc>', '<cmd>write<return>')

-- Close buffer
vim.keymap.set('n', '<leader>d', '<cmd>bdelete<return>', { silent = true })
vim.keymap.set('n', '<leader>D', '<cmd>bdelete!<return>', { silent = true })

-- Searching and replacing
vim.keymap.set('n', '<leader>ff', [[:Rg ]])
vim.keymap.set('n', '<leader>fw', [[:Rg \<<C-r><C-w>\>]])
vim.keymap.set('v', '<leader>fw', [[y:Rg <C-r>"]])
vim.keymap.set('n', '<leader>sw', [[:%s/\<<C-r><C-w>\>//c<Left><Left>]])
vim.keymap.set('v', '<leader>sw', [[y:%s/<C-r>"//c<Left><Left>]])

-- Exit (non-fzf) Terminal mode with <esc>
vim.keymap.set(
  't',
  '<esc>',
  [[&filetype == 'fzf' ? "\<esc>" : "\<c-\>\<c-n>"]],
  { expr = true }
)

-- Remove trailing whitespace on write
vim.api.nvim_create_autocmd('BufWritePre', {
 pattern = '*',
 command = "silent! :%s/\\s\\+$//e"
})

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = false,
  float = {
    header = false,
    border = 'rounded',
  },
})

-- fzf.vim
vim.keymap.set('n', 'ff', '<cmd>Files<return>')
vim.keymap.set('n', 'fg', '<cmd>Buffers<return>')
vim.g.fzf_preview_window = ''

-- splitjoin.vim
vim.g.splitjoin_ruby_curly_braces = 0
vim.g.splitjoin_ruby_hanging_args = 0
vim.g.splitjoin_ruby_do_block_split = 0
vim.g.splitjoin_ruby_options_as_arguments = 1

-- vim-test
vim.keymap.set('n', '<leader>t', '<cmd>w <bar> TestNearest<return>')
vim.keymap.set('n', '<leader>T', '<cmd>w <bar> TestFile<return>')
vim.keymap.set('n', '<leader>l', '<cmd>w <bar> TestLast<return>')
vim.keymap.set('n', '<leader>S', '<cmd>w <bar> TestSuite<return>')

-- nvim-treesitter
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'vim', 'json', 'yaml', 'vimdoc' },
  auto_install = true,
  indent = {
    enable = true,
    disable = { 'ruby', 'yaml' },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = '.',
      scope_incremental = ';',
      node_decremental = ',',
    },
  },
})

-- nvim-ts-context-commentstring
require('ts_context_commentstring').setup { }
vim.g.skip_ts_context_commentstring_module = true

-- leap.nvim
require('leap')
vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')

-- lspconfig
local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.ruby_lsp.setup({ capabilities = capabilities })
lsp.standardrb.setup({ capabilities = capabilities })
lsp.gopls.setup({ capabilities = capabilities })
lsp.ts_ls.setup({ capabilities = capabilities })
lsp.eslint.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end
})

vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format { async = true }
end)

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { border = 'rounded' }
)

-- nvim-lspfuzzy
require('lspfuzzy').setup {
  save_last = true,
  fzf_preview = false,
}
vim.keymap.set('n', '<leader>fr', '<cmd>LspFuzzyLast<return>')

-- nvim-cmp
local cmp = require('cmp')

local has_words_before = function()
  if vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt' then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert',
    autocomplete = false
  },
  performance = {
    max_view_entries = 20
  },
  preselect = true,
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

    ['<s-tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

    ['<return>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  })
})
