call plug#begin('~/.local/share/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'thalesmello/lkml.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale', { 'for': ['ruby', 'javascript', 'go'] }
Plug '~/.dotfiles/zsh'

call plug#end()

" General
" --------------------
let mapleader = ' '

syntax enable
colors dark

set expandtab           " Convert tabs to spaces
set hidden              " Prevent unloading abandoned buffers
set ignorecase          " Ignore case when searching
set nojoinspaces        " Disable inserting 2 spaces after sentences
set noshowcmd           " Disable showing keystrokes below statusline
set noshowmode          " Hide mode (use `vim-airline` instead)
set noswapfile          " Disable swapfile
set number              " Show the current line number
set numberwidth=3       " Use 3 spaces for line numbers
set relativenumber      " Use relative numnbering
set shiftround          " Use multiple of shiftwidth when indenting
set shiftwidth=2        " Use 2 spaces for auto indent
set shortmess=Iat       " Disable intro message, truncate shortmessages
set smartcase           " Ignore case if all lowercase when searching
set smartindent         " Smarter auto indenting
set tabstop=2           " Number of spaces per tab
set termguicolors       " Enable true color
set textwidth=80        " Ruler at 80 characters
set title               " Set the window title
set ttimeoutlen=10      " Time to wait for keycode sequences

" Mappings
" --------------------
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

" Close buffer without closing the window
nnoremap <silent> <leader>d :bp\|bd #<return>

" Clear current search highlight with Escape
nnoremap <silent> <esc> :nohlsearch<return>

" Exit (non-fzf) Terminal mode with Escape
tnoremap <expr> <esc> &filetype == 'fzf' ? "\<esc>" : "\<c-\>\<c-n>"

" Auto Commands
" --------------------
augroup AutoGroup
  autocmd!
  au VimLeave * set guicursor=a:hor30       " Reset cursor style on exit
  au BufWritePre * silent! :%s/\s\+$//e     " Remove trailing whitespace
  au BufReadPost .today set syntax=markdown " Use Markdown syntax for .today
augroup END

" Plugin Config
" -------------
" fzf.vim -- Fuzzy file/buffer finder
nnoremap ff :Files<return>
nnoremap fb :Buffers<return>
" Hide statusline
autocmd FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages'
let g:fzf_preview_window = ''

" vim-ruby -- Syntax highlighting for Ruby
let g:ruby_path = system('echo $HOME/.rbenv/shims') " Faster init

" vim-airline -- Statusbar & tabline
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_extensions = ['tabline']
let g:airline_left_alt_sep=''
let g:airline_left_sep=''
let g:airline_right_alt_sep=''
let g:airline_right_sep=''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_skip_empty_sections = 1
let g:airline_theme='minimalist'
call airline#parts#define_accent('mode', 'none')

" vim-test
let g:test#strategy = "neovim"
let g:test#rspec_quickfix = "--require $HOME/.config/rspec/quickfix_formatter.rb " .
      \ "--format QuickfixFormatter"
nnoremap <leader>; :Copen<return>
nnoremap <leader>' :ccl<return>

function! ToggleTestingStrategy()
  if g:test#strategy == "dispatch_background"
    " Use a :terminal split for interactive debugging
    let g:test#strategy = 'neovim'
    let g:test#ruby#rspec#options = "--no-profile "
    let test#ruby#minitest#options = '--verbose'
  else
    " Use a background runner and quickfix window
    let g:test#strategy = "dispatch_background"
    let g:test#ruby#rspec#options = "--no-profile " . g:test#rspec_quickfix
  endif
endfunction

command! Debug call ToggleTestingStrategy()

nmap <silent> <leader>t :w \| :TestNearest<return>
nmap <silent> <leader>T :w \| :TestFile<return>
nmap <silent> <leader>l :w \| :TestLast<return>

" netrw.vim -- Useless shit
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" ale -- Use linters to fix on save
command! Fix ALEFix
command! Lint ALELint
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '➤'
let g:ale_disable_lsp = 1
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'ruby': ['rubocop'],
      \ 'go': ['gofmt']
      \ }
let g:ale_history_enabled = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" coc.vim -- LSP integration
set completeopt=menu,menuone,longest,noinsert

let g:coc_global_extensions = [
      \'coc-go',
      \'coc-rls',
      \'coc-snippets',
      \'coc-solargraph',
      \]

" Use <Tab> to trigger completion and navigate up/down
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<return>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <Enter> to insert the highlighted item
:inoremap <expr> <return> pumvisible() ? "\<C-y>" : "\<C-g>u\<return>"

" Jump to next snippet placeholder
let g:coc_snippet_next = '<Tab>'

" Goto mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gf <Plug>(coc-fix-current)
