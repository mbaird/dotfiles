hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "dark"

let s:lighter_gray = "#f7f7f7"
let s:light_gray = "#d9d9d9"
let s:gray = "#bcbcbc"
let s:dark_gray = "#909090"
let s:darker_gray = "#666666"
let s:black = "#000000"

let s:red = "#ce5252"
let s:blue = "#5f819d"
let s:orange = '#e18254'

let s:none = "NONE"
let s:fg = s:gray
let s:bg = "#252525"
let s:highlight = '#fafafa'

function! s:hi(group, ...)
  let l:fg = get(a:, 1, s:none)
  let l:bg = get(a:, 2, s:none)
  let l:gui = get(a:, 3, 'none')

  exe 'hi' a:group
    \ ' guifg=' l:fg 'guibg=' l:bg 'gui=' l:gui
    \ 'term=' l:gui 'cterm=' l:gui
endfunction

" Text
call s:hi('Normal', s:fg, s:bg)
hi! link Constant Normal
hi! link Identifier Normal
hi! link Ignore Normal
hi! link Special Normal
hi! link Type Normal
hi! link Directory Normal

call s:hi('Title', s:fg, s:bg, 'bold')

call s:hi('PreProc', s:dark_gray, s:bg)
hi! link Statement PreProc
hi! link NonText PreProc

call s:hi('Comment', s:darker_gray)

call s:hi('Error', s:red, s:none, 'bold')
hi! link ErrorMsg Error
hi! link SpellBad Error
hi! link SpellCap Error
hi! link WarningMsg Error

call s:hi('String', s:highlight)
call s:hi('Visual', s:highlight, s:darker_gray)
call s:hi('IncSearch', s:bg, s:light_gray)
call s:hi('Search', s:bg, s:light_gray)
call s:hi('MatchParen', s:bg, s:fg)
call s:hi('Todo', s:blue)
call s:hi('Link', s:blue)

" UI
call s:hi('LineNr', s:dark_gray, s:bg)
hi! link SignColumn LineNr

call s:hi('CursorLineNr', s:light_gray, s:none, 'bold')
call s:hi('VertSplit', s:gray, s:none)
call s:hi('ColorColumn', s:none, '#333333')
call s:hi('StatusLine', s:fg, '#333333')

call s:hi('Pmenu', s:light_gray, s:darker_gray)
call s:hi('PmenuSel', s:fg, s:bg)

" Hidden
call s:hi('EndOfBuffer', s:bg, s:bg)

" Ale
hi! link ALEWarningSign Error
hi! link ALEErrorSign Error

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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
