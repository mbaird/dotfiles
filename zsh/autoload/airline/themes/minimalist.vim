let s:theme = 'minimalist'

let s:darker_gray = "#666666"
let s:bg = "#252525"
let s:highlight = '#fafafa'

function! airline#themes#{s:theme}#refresh()
    " Normal
    let N1 = [ s:highlight, s:darker_gray, 254, 237 ]
    let N2 = [ s:highlight, s:bg, 254, 239 ]
    let N3 = [ s:darker_gray, s:bg, 255, 235 ]

    " Inactive
    let IA = [ N3[0], N3[1], 242, N3[3] ]

    " Reverse
    let NR = [ s:darker_gray, s:highlight, N2[3], N2[2] ]

    let palette = {}
    let palette.normal = airline#themes#generate_color_map(N1, N2, N3)
    let palette.insert = airline#themes#generate_color_map(NR, N2, N3)

    let tabline = {}
    let tabline.airline_tab = N1
    let tabline.airline_tabmod = NR
    let tabline.airline_tabmod_unsel = N2
    let tabline.airline_tabhid = N3

    let palette.replace  = palette.insert
    let palette.visual   = palette.insert
    let palette.inactive = airline#themes#generate_color_map(IA, IA, IA)
    let palette.tabline = tabline

    let g:airline#themes#{s:theme}#palette = palette
endfunction

call airline#themes#{s:theme}#refresh()
