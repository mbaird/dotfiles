call plug#begin('~/.local/share/nvim/plugged')

Plug '$HOMEBREW_PREFIX/opt/fzf'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf.vim'
Plug 'kylechui/nvim-surround'
Plug 'madox2/vim-ai'
Plug 'mbaird/monochrome.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'neovim/nvim-lspconfig'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

call plug#end()

let mapleader = ' '

syntax enable
colors monochrome

set expandtab           " Convert tabs to spaces
set noshowcmd           " Disable showing keystrokes below statusline
set noswapfile          " Disable swapfile
set number              " Show the current line number
set numberwidth=3       " Use 3 spaces for line numbers
set relativenumber      " Use relative numnbering
set shiftround          " Use multiple of shiftwidth when indenting
set shiftwidth=2        " Use 2 spaces for auto indent
set shortmess=IatF      " Disable intro message, truncate shortmessages
set tabstop=2           " Number of spaces per tab
set termguicolors       " Enable true color
set textwidth=100       " Reasonable wrap width
set ttimeoutlen=10      " Time to wait for keycode sequences
set scrolloff=3         " Keep lines of context when scrolling

set statusline=
set statusline+=\ %f
set statusline+=%{&modified?'\ [+]':''}
set statusline+=%{&readonly?'\ [-]':''}
set statusline+=%<
set statusline+=%=
set statusline+=%{&filetype!=#''?&filetype.'\ ':'none\ '}
set statusline+=%2c,
set statusline+=%l/%L

" Correctly format lua heredocs in init.vim
autocmd FileType vim lua vim.treesitter.start()

" Switch to last viewed buffer
nnoremap <leader><leader> <c-^>

" Quick window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Quick edit vim config
nnoremap <leader>v :e $MYVIMRC<return>

" Quick save
nnoremap <esc><esc> :w<return>

" Close buffer
nnoremap <silent> <leader>d :bd<return>
nnoremap <silent> <leader>D :bd!<return>

" Close the current tab
nnoremap <silent> gx :tabclose<return>

" Clear current search highlight with Escape
nnoremap <silent> <esc> :nohlsearch<return>

" Exit (non-fzf) Terminal mode with Escape
tnoremap <expr> <esc> &filetype == 'fzf' ? "\<esc>" : "\<c-\>\<c-n>"

" Unmap lazy buffer switching from `vim-unimpaired`
autocmd VimEnter * nunmap [b
autocmd VimEnter * nunmap ]b

augroup AutoGroup
  autocmd!
  au VimLeave * set guicursor=a:hor30       " Reset cursor style on exit
  au BufWritePre * silent! :%s/\s\+$//e     " Remove trailing whitespace
  au FileType javascript set filetype=javascriptreact
augroup END

" fzf.vim
nnoremap ff :Files<return>
nnoremap fb :Buffers<return>
let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages'
let g:fzf_preview_window = []

" nvim-cmp
lua << EOF
local cmp = require('cmp')

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert",
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
    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})
EOF

" lsp
lua << EOF
local lspconfig = require('lspconfig')

require('lspfuzzy').setup {
  save_last = true,
  fzf_preview = false,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.solargraph.setup({
  capabilities = capabilities
})

lspconfig.tsserver.setup({
  capabilities = capabilities
})

lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end
})

vim.diagnostic.config({
  severity_sort = true,
  float = { border = "rounded" },
})

vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', '<leader>fr', ':LspFuzzyLast<CR>', opts)
  end,
})
EOF

" nvim-surround
lua << EOF
require("nvim-surround").setup()
EOF

" nvim-treesitter
lua << EOF
require('nvim-treesitter.configs').setup({
  auto_install = true,
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = false,
      node_incremental = ".",
      scope_incremental = ";",
      node_decremental = ",",
    },
  },
})
EOF

" commentstring
lua << EOF
require('ts_context_commentstring').setup { }
vim.g.skip_ts_context_commentstring_module = true
EOF

" splitjoin.vim
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_do_block_split = 0
let g:splitjoin_ruby_options_as_arguments = 1

" vim-ruby
let g:ruby_path = system('echo $HOME/.rbenv/shims') " Faster init

" vim-test
let g:test#strategy = "basic"

command! Make call s:make(join(map(split(&makeprg), 'expand(v:val)')))

function! s:make(cmd) abort
  call test#strategy#basic(a:cmd)
endfunction

nmap <silent> <leader>t :w \| :TestNearest<return>
nmap <silent> <leader>T :w \| :TestFile<return>
nmap <silent> <leader>l :w \| :TestLast<return>
nmap <silent> <leader>m :w \| :Make<return>
