set nocompatible

" Load plugins
source ~/.vimrc.bundles

let mapleader = " "

" Visual
set title
set laststatus=2
set number
set relativenumber
set numberwidth=3
syntax enable
filetype plugin indent on
color dracula

" Basic
set encoding=utf-8
set history=10000
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
nnoremap <CR> o<Esc>k

" Close buffer without closing the window
nnoremap <silent> <leader>d :bp\|bd #<CR>

" Quickly fix weird rendering issues
nnoremap <leader>r :redraw!<CR>

" Use `ripgrep`
set grepprg=rg\ --color=never
nnoremap <leader>g :Grepper -tool rg<cr>

" ctrlp
nnoremap ff :CtrlP<CR>
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 1

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['ctrlp', 'branch', 'tabline']
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%{airline#util#wrap(airline#parts#filetype(),0)}'

" Faster `vim-ruby` init
let g:ruby_path = system('rbenv prefix')

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Disable fucking netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

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

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>

" Quick edit .vimrc
nnoremap <leader>v :e ~/.dotfiles/vimrc<CR>

" Quicksave
map <Esc><Esc> :w<CR>

" Easier buffer switching
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" Use Markdown highlighting for today
au BufReadPost .today set syntax=markdown

" Allow JSX in normal JS files
let g:jsx_ext_required = 0
