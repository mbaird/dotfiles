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
  context_commentstring = {
    enable = true
  }
})
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

