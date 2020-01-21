set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath


" Plugins
" --------------------

call plug#begin('~/.local/share/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'pbrisbin/vim-mkdir'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug '~/.dotfiles/zsh'

call plug#end()


" General
" --------------------

let mapleader = ' '

syntax enable
colors dark

set backspace=2         " Expected backspace behaviour
set expandtab           " Convert tabs to spaces
set hidden              " Prevent unloading abandoned buffers
set ignorecase          " Ignore case when searching
set smartcase           " Ignore case if all lowercase when searching
set nofoldenable        " Disable folding
set nojoinspaces        " Disable inserting 2 spaces after sentences
set noshowmode          " Hide mode (use `vim-airline` instead)
set nohlsearch          " Disable search match highlighting
set noshowcmd           " Disable showing keystrokes below statusline
set noswapfile          " Disable swapfile
set number              " Show the current line number
set relativenumber      " Use relative numnbering
set numberwidth=4       " Use 4 spaces for line numbers
set shiftround          " Use multiple of shiftwidth when indenting
set shiftwidth=2        " Use 2 spaces for auto indent
set shortmess=Iat       " Disable intro message, truncate shortmessages
set smartindent         " Smarter auto indenting
set tabstop=2           " Number of spaces per tab
set termguicolors       " Enable true color
set title               " Set the window title
set ttimeoutlen=10      " Time to wait for keycode sequences
set textwidth=80        " Ruler at 80 characters
set colorcolumn=+1      " Highlight at 80 characters


" Mappings
" --------------------

" Switch to last viewed buffer
nnoremap <leader><leader> <c-^>

" Force use of h, j, k, l
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quick window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Quick edit vim config
nnoremap <leader>v :e $MYVIMRC<CR>

" Quick save
nnoremap <Esc><Esc> :w<CR>

" Quick buffer switching
nnoremap gn :bn<cr>
nnoremap gp :bp<cr>

" Enter newlines without entering insert mode
nnoremap <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : 'o'

" Close buffer without closing the window
nnoremap <silent> <leader>d :bp\|bd #<CR>

" Close all other buffers
nnoremap <silent> <leader>D :%bd\|e#\|bd #<CR>


" Auto Commands
" --------------------

augroup AutoGroup
  autocmd!
  au VimLeave * set guicursor=a:hor30       " Reset cursor style on exit
  au BufWritePre * :%s/\s\+$//e             " Remove trailing whitespace
  au BufReadPost .today set syntax=markdown " Use Markdown syntax for .today
augroup END


" Plugin Config
" -------------

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['solargraph', 'stdio'],
    \ }
let g:LanguageClient_echoProjectRoot = 0
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>

" fzf.vim -- Fuzzy file/buffer finder
nnoremap ff :Files<CR>
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages'

" vim-ruby -- Syntax highlighting for Ruby
let g:ruby_path = system('echo $HOME/.rbenv/shims') " Faster init

" vim-airline -- Statusbar & tabline
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_extensions = ['tabline']
let g:airline_left_alt_sep=''
let g:airline_left_sep=''
let g:airline_powerline_fonts = 1
let g:airline_right_alt_sep=''
let g:airline_right_sep=''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_skip_empty_sections = 1
let g:airline_theme='minimalist'
call airline#parts#define_accent('mode', 'none')

" vim-test -- Wrapper for running tests on different granularities
let g:fifo_file = "/tmp/vim.fifo"

function! PipeStrategy(cmd)
  call system('echo clear > ' . g:fifo_file)
  execute 'silent !echo ' . a:cmd . ' > ' . g:fifo_file
endfunction

let g:test#custom_strategies = { 'pipe': function('PipeStrategy') }
let g:test#strategy = 'pipe'

nmap <silent> <leader>t :w \| :TestNearest<CR>
nmap <silent> <leader>T :w \| :TestFile<CR>
nmap <silent> <leader>l :w \| :TestLast<CR>

" netrw.vim -- Useless shit
let g:loaded_netrw       = 1 " Disable netrw
let g:loaded_netrwPlugin = 1 " Disable netrw

" ale -- Use linters to fix on save
nmap <silent> <leader>f :ALEFix<CR>
let g:ale_sign_error = '->'
let g:ale_sign_warning = '->'
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'ruby': ['rubocop']
      \ }
let g:ale_history_enabled = 0
