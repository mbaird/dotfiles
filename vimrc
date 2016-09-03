" Leader
let mapleader = " "

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Load plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

set backspace=2   " Backspace deletes like most programs in insert mode
set history=100   " Remember 100 history changes
set ruler         " Show the cursor position all the time
set showcmd       " Display incomplete commands
set incsearch     " Incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set noshowmode    " Hide mode in favour of vim-airline

" Color scheme
color dracula

" Show line numbers
set number
set numberwidth=4

" Use ag for grep
 set grepprg=ag\ --nogroup\ --nocolor

" Use ag for ctrlp
let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden --ignore .git -g "" %s'
let g:ctrlp_use_caching = 0

" 2 space soft tabs
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Leave INSERT faster
set ttimeoutlen=10

" Status Bar
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Ruler at 80 characters
set textwidth=80
set colorcolumn=+1
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3d3f49 gui=NONE

" Force h,j,k,l
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>