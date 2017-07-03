set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath


" Plugins
" --------------------

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'janko-m/vim-test'
Plug 'jkramer/vim-checkbox'
Plug 'mbaird/vim-dracula'
Plug 'mhinz/vim-grepper'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-ruby/vim-ruby'

call plug#end()


" General
" --------------------

let mapleader = ' '

syntax enable
color dracula

set backspace=2         " Expected backspace behaviour
set expandtab           " Convert tabs to spaces
set hidden              " Prevent unloading abandoned buffers
set ignorecase          " Ignore case when searching
set smartcase           " Ignore case if all lowercase when searching
set nofoldenable        " Disable folding
set nojoinspaces        " Disable inserting 2 spaces after sentences
set noshowmode          " Hide mode (use `vim-airline` instead)
set nohlsearch          " Disable search match highlighting
set noswapfile          " Disable swapfile
set number              " Show the current line number
set relativenumber      " Use relative numnbering
set numberwidth=3       " Use 3 spaces for line numbers
set shiftround          " Use multiple of shiftwidth when indenting
set shiftwidth=2        " Use 2 spaces for auto indent
set smartindent         " Smarter auto indenting
set tabstop=2           " Number of spaces per tab
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
nnoremap gd :bd<cr>

" Enter newlines without entering insert mode
nnoremap <CR> o<Esc>k

" Close buffer without closing the window
nnoremap <silent> <leader>d :bp\|bd #<CR>


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

" ctrlp.vim -- Fuzzy file/buffer finder
nnoremap ff :CtrlP<CR>
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

" vim-grepper -- Decent async grep with quickfix support
set grepprg=rg\ --color=never
nnoremap <leader>g :Grepper -tool rg<cr>

" vim-airline -- Statusbar & tabline
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['ctrlp', 'branch', 'tabline']
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%{airline#util#wrap(airline#parts#filetype(),0)}'

" vim-ruby -- Syntax highlighting for Ruby
let g:ruby_path = system('rbenv prefix') " Faster init

" vim-test -- Wrapper for running tests on different granularities
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>

" vim-jsx -- Syntax highlighting for .jsx files
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" netrw.vim -- Useless shit
let g:loaded_netrw       = 1 " Disable netrw
let g:loaded_netrwPlugin = 1 " Disable netrw
