set nocompatible

" Load plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

let mapleader = " "

" Visual
set title
set laststatus=2
set number
set numberwidth=3
syntax enable
filetype plugin indent on
color dracula

" Basic
set encoding=utf-8
set history=5112
set nofoldenable
set ignorecase smartcase
set incsearch
set noshowmode
set ttimeoutlen=10
set noswapfile
set hidden
set undofile
set undodir=~/.vim/undo

" Formatting
set nojoinspaces
set backspace=2
set smartindent
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Enter newlines without entering insert mode
" http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
nnoremap <CR> o<Esc>k

" Close buffer without closing the window
nnoremap <silent> <leader>d :bp\|bd #<CR>

" ctrlp
nnoremap ff :CtrlP<CR>
" let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" No newline at end of file
set noeol
autocmd BufWritePre * :set binary | set noeol
autocmd BufWritePost * :set nobinary | set eol

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" vim-fugitive
nnoremap <leader>gx :Gbrowse<CR>
nnoremap <leader>g :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Ruler at 80 characters
set textwidth=80
set colorcolumn=+1
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE gui=NONE

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Force h,j,k,l
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Line number style switching
set relativenumber
set number

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>
let g:test#preserve_screen = 1

nnoremap <leader>v :e ~/.dotfiles/vimrc<CR>
map <Esc><Esc> :w<CR>

" Easier buffer switching
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1