call plug#begin('~/.local/share/nvim/plugged')

Plug '$HOMEBREW_PREFIX/opt/fzf'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'dense-analysis/ale'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf.vim'
Plug 'mbaird/wiki.vim'
Plug 'neoclide/coc.nvim', { 'tag': 'v0.0.81' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()

let mapleader = ' '

syntax enable
colors dark

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
set statusline+=%#StatusLine#
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

" ale
command! Fix ALEFix
command! Lint ALELint
nmap <silent> <leader>f :Fix<return>
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '➤'
let g:ale_disable_lsp = 1
let g:ale_fixers = {
      \ 'javascriptreact': ['eslint'],
      \ 'typescriptreact': ['eslint'],
      \ 'typescript': ['eslint'],
      \ 'ruby': ['rubocop']
      \ }
let g:ale_history_enabled = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" fzf.vim
nnoremap ff :Files<return>
nnoremap fb :Buffers<return>
let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages'
let g:fzf_preview_window = []

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
let test#custom_runners = {'javascript': ['vitest']}

command! Make call s:make(join(map(split(&makeprg), 'expand(v:val)')))

function! s:make(cmd) abort
  call test#strategy#basic(a:cmd)
endfunction

nmap <silent> <leader>t :w \| :TestNearest<return>
nmap <silent> <leader>T :w \| :TestFile<return>
nmap <silent> <leader>l :w \| :TestLast<return>
nmap <silent> <leader>m :w \| :Make<return>

" wiki.vim
let g:wiki_root = '~/.notes'
let g:wiki_filetypes = ['md']
let g:wiki_index_name = '0-home'

" coc.vim
set completeopt=menu,menuone,longest,noinsert
set pumheight=10

let g:coc_global_extensions = [
      \'coc-snippets',
      \'coc-solargraph',
      \'coc-tsserver',
      \]

" Use <Tab> to trigger completion and navigate up/down
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ?
      \   "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<return>" :
      \   CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <Enter> to insert the highlighted item
inoremap <expr> <return> pumvisible() ? "\<C-y>" : "\<C-g>u\<return>"

" Jump to next snippet placeholder
let g:coc_snippet_next = '<Tab>'

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Goto mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Apply codeaction to buffer
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
