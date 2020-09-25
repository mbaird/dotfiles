set background=dark

hi clear
let g:colors_name = 'dark'

let s:gray01 = "#fafafa"
let s:gray02 = "#d9d9d9"
let s:gray03 = '#bcbcbc'
let s:gray04 = '#909090'
let s:gray05 = '#666666'
let s:gray06 = '#333333'
let s:gray07 = '#252525'
let s:red    = '#ce5252'
let s:blue   = '#5f819d'

hi! link ALEErrorSign Error
hi! link ALEWarningSign Error
hi! link Constant Normal
hi! link ErrorMsg Error
hi! link Identifier Normal
hi! link LineNr PreProc
hi! link MatchParen Visual
hi! link SignColumn PreProc
hi! link Special Normal
hi! link SpellBad Error
hi! link SpellCap Error
hi! link Statement PreProc
hi! link Type Normal
hi! link WarningMsg Error

function! s:hi(group, ...)
  let l:guifg = get(a:, 1, "NONE")
  let l:guibg = get(a:, 2, "NONE")
  let l:gui   = get(a:, 3, "NONE")
  let l:cterm = get(a:, 4, "NONE")

  exec "hi " a:group " guifg=" l:guifg " guibg=" l:guibg
        \ " gui=" l:gui " cterm=" l:cterm
endfunction

call s:hi("Normal", s:gray03, s:gray07)
call s:hi("Title", s:gray02, s:gray07, "bold" , "bold")
call s:hi("PreProc", s:gray04)
call s:hi("String", s:gray01)
call s:hi("Comment", s:gray05)
call s:hi("ColorColumn", "NONE", s:gray06)
call s:hi("Todo", s:blue)
call s:hi("CursorLineNr", s:gray02, "NONE", "bold" , "bold")
call s:hi("Error", s:red, "NONE", "bold" , "bold")
call s:hi("VertSplit", s:gray03)
call s:hi("EndOfBuffer", s:gray07, s:gray07)
call s:hi("StatusLine", s:gray06, s:gray03)
call s:hi("Visual", s:gray01, s:gray05)
call s:hi("Search", s:gray07, s:gray02)

let g:terminal_color_0 = s:gray07
let g:terminal_color_1 = '#e78287'
let g:terminal_color_2 = '#a7cb8b'
let g:terminal_color_3 = '#daaa78'
let g:terminal_color_4 = '#71bdf2'
let g:terminal_color_5 = '#d190e3'
let g:terminal_color_6 = '#65c1cd'
let g:terminal_color_7 = '#b9bfca'
let g:terminal_color_8 = s:gray07
let g:terminal_color_9 = '#e78287'
let g:terminal_color_10 = '#a7cb8b'
let g:terminal_color_11 = '#daaa78'
let g:terminal_color_12 = '#71bdf2'
let g:terminal_color_13 = '#d190e3'
let g:terminal_color_14 = '#65c1cd'
let g:terminal_color_15 = '#fefefe'

let g:fzf_colors =
      \ { 'fg':    ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
