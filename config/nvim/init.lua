vim.g.mapleader = ' '

require('plugins')

vim.cmd('colors monochrome')

vim.o.expandtab = true        -- Convert tabs to spaces
vim.o.showcmd = false         -- Disable showing keystrokes below statusline
vim.o.swapfile = false        -- Disable swapfile
vim.o.number = true           -- Show the current line number
vim.o.shiftround = true       -- Use multiple of shiftwidth when indenting
vim.o.shiftwidth = 2          -- Use 2 spaces for auto indent
vim.o.shortmess = 'atIF'      -- Disable intro message, truncate shortmessages
vim.o.tabstop = 2             -- Number of spaces per tab
vim.o.textwidth = 100         -- Reasonable wrap width
vim.o.ttimeoutlen = 10        -- Time to wait for keycode sequences
vim.o.scrolloff = 3           -- Keep lines of context when scrolling
vim.o.mouse = ""              -- Disable mouse

vim.o.statusline = table.concat({
  ' %f',        -- Filepath
  ' %m%r%h%w',  -- Flags for Modified, Readonly, Help, Preview
  '%<',
  '%=',
  "%{&filetype != '' ? &filetype : 'none'} ",
  '%2c,',       -- Column
  '%l/%L'       -- Line number / number of lines in buffer
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

-- Close the current tab
vim.keymap.set('n', 'gx', '<cmd>tabclose<return>', { silent = true })

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

-- Reset cursor style on exit
vim.api.nvim_create_autocmd('VimLeave', {
  command = 'set guicursor=a:hor30',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'javascript',
  command = 'set filetype=javascriptreact',
})

vim.diagnostic.config({
  severity_sort = true,
  float = { border = 'rounded' },
})

vim.g.ruby_path = vim.fn.expand('~/.rbenv/shims')

-- fzf.vim
vim.keymap.set('n', 'ff', '<cmd>Files<return>')
vim.keymap.set('n', 'fb', '<cmd>Buffers<return>')
vim.fn.setenv('FZF_DEFAULT_COMMAND', 'rg --files --no-messages')
vim.g.fzf_preview_window = ''

-- splitjoin.vim
vim.g.splitjoin_ruby_curly_braces = 0
vim.g.splitjoin_ruby_hanging_args = 0
vim.g.splitjoin_ruby_do_block_split = 0
vim.g.splitjoin_ruby_options_as_arguments = 1

-- vim-test
vim.g['test#strategy'] = 'basic'
vim.keymap.set('n', '<leader>t', '<cmd>w <bar> TestNearest<return>')
vim.keymap.set('n', '<leader>T', '<cmd>w <bar> TestFile<return>')
vim.keymap.set('n', '<leader>l', '<cmd>w <bar> TestLast<return>')
vim.keymap.set('n', '<leader>m', '<cmd>w <bar> Make<return>')

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

--  nvim-ts-context-commentstring
require('ts_context_commentstring').setup { }
vim.g.skip_ts_context_commentstring_module = true

-- lspconfig
local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.solargraph.setup({ capabilities = capabilities })
lsp.tsserver.setup({ capabilities = capabilities })
lsp.eslint.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end
})

vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format { async = true }
end)

-- nvim-lspfuzzy
require('lspfuzzy').setup {
  save_last = true,
  fzf_preview = false,
}

vim.keymap.set('n', '<leader>fr', '<cmd>LspFuzzyLast<return>')

-- nvim-cmp
local cmp = require('cmp')

local has_words_before = function()
  unpack = unpack or table.unpack
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
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

    ['<s-tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
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
  }, {
    { name = 'buffer' },
  })
})

-- copilot.vim
vim.keymap.set('i', '<C-J>', 'copilot#Accept("<return>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
vim.cmd.highlight({ 'link', 'CopilotSuggestion', 'DiagnosticWarn' })
