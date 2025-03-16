--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

local c_yellow
local c_earth
local c_orange
local c_pink
local c_ochre
local c_scarlet
local c_wine
local c_tea
local c_aqua
local c_turquoise
local c_flashlight
local c_skyblue
local c_cerulean
local c_lavender
local c_purple
local c_magenta
local c_pigeon
local c_cumulonimbus
local c_thunder
local c_white
local c_smoke
local c_beige
local c_steel
local c_iron
local c_deepsea
local c_ocean
local c_jeans
local c_space
local c_black
local c_shadow
local c_tea_blend
local c_aqua_blend
local c_purple_blend
local c_lavender_blend
local c_scarlet_blend
local c_wine_blend
local c_earth_blend
local c_smoke_blend

-- DARK
if vim.go.bg == 'dark' then
  c_yellow = hsl(34, 66, 71)
  c_earth = hsl(39, 38, 63)
  c_orange = hsl(22, 81, 67)
  c_pink = hsl(351, 76, 78)
  c_ochre = hsl(12, 71, 66)
  c_scarlet = hsl(0, 56, 60)
  c_wine = hsl(0, 60, 41)
  c_tea = hsl(85, 29, 61)
  c_aqua = hsl(173, 23, 58)
  c_turquoise = hsl(199, 23, 59)
  c_flashlight = hsl(205, 67, 80)
  c_skyblue = hsl(210, 100, 80)
  c_cerulean = hsl(218, 49, 69)
  c_lavender = hsl(263, 66, 80)
  c_purple = hsl(256, 39, 69)
  c_magenta = hsl(309, 57, 71)
  c_pigeon = hsl(220, 21, 65)
  c_cumulonimbus = hsl(214, 28, 46)
  c_thunder = hsl(215, 29, 35)
  c_white = hsl(240, 9, 90)
  c_smoke = hsl(240, 5, 76)
  c_beige = hsl(30, 7, 67)
  c_steel = hsl(216, 18, 45)
  c_iron = hsl(222, 15, 23)
  c_deepsea = hsl(216, 24, 26)
  c_ocean = hsl(216, 21, 23)
  c_jeans = hsl(222, 24, 20)
  c_space = hsl(230, 22, 10)
  c_black = hsl(270, 11, 3)
  c_shadow = hsl(270, 11, 3)
  c_tea_blend = hsl(180, 15, 29)
  c_aqua_blend = hsl(202, 22, 23)
  c_purple_blend = hsl(236, 19, 26)
  c_lavender_blend = hsl(240, 19, 36)
  c_scarlet_blend = hsl(346, 20, 25)
  c_wine_blend = hsl(348, 17, 19)
  c_earth_blend = hsl(240, 3, 19)
  c_smoke_blend = hsl(240, 9, 90)
else
  c_yellow = hsl(40, 100, 39)
  c_earth = hsl(42, 63, 43)
  c_orange = hsl(17, 64, 40)
  c_pink = hsl(356, 61, 64)
  c_ochre = hsl(14, 63, 47)
  c_scarlet = hsl(0, 56, 60)
  c_wine = hsl(0, 60, 41)
  c_tea = hsl(95, 38, 40)
  c_aqua = hsl(171, 40, 39)
  c_turquoise = hsl(196, 48, 32)
  c_flashlight = hsl(200, 50, 71)
  c_skyblue = hsl(210, 60, 56)
  c_cerulean = hsl(218, 53, 46)
  c_lavender = hsl(263, 38, 64)
  c_purple = hsl(259, 46, 61)
  c_magenta = hsl(312, 38, 49)
  c_pigeon = hsl(240, 26, 53)
  c_cumulonimbus = hsl(213, 32, 42)
  c_thunder = hsl(30, 23, 84)
  c_white = hsl(213, 32, 34)
  c_smoke = hsl(221, 14, 29)
  c_beige = hsl(213, 32, 34)
  c_steel = hsl(43, 7, 59)
  c_iron = hsl(45, 4, 71)
  c_deepsea = hsl(30, 28, 88)
  c_ocean = hsl(28, 35, 93)
  c_jeans = hsl(33, 72, 96)
  c_space = hsl(37, 64, 97)
  c_black = hsl(0, 0, 94)
  c_shadow = hsl(30, 10, 22)
  c_tea_blend = hsl(84, 19, 75)
  c_aqua_blend = hsl(135, 10, 80)
  c_purple_blend = hsl(270, 12, 88)
  c_lavender_blend = hsl(263, 19, 73)
  c_scarlet_blend = hsl(7, 41, 81)
  c_wine_blend = hsl(15, 32, 84)
  c_earth_blend = hsl(40, 34, 88)
  c_smoke_blend = hsl(210, 4, 89)
end

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    ColorColumn    { bg = c_ocean }, -- Columns set with 'colorcolumn'
    Conceal        { fg = c_smoke }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor         { fg = c_space, bg = c_white }, -- Character under the cursor
    CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      { fg = c_pigeon }, -- Directory names (and other special names in listings)
    DiffAdd        { fg = c_tea }, -- Diff mode: Added line |diff.txt|
    DiffChange     { fg = c_pigeon }, -- Diff mode: Changed line |diff.txt|
    DiffDelete     { fg = c_wine }, -- Diff mode: Deleted line |diff.txt|
    DiffText       { bg = c_deepsea }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer    { fg = c_iron }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor     { fg = c_space, bg = c_orange }, -- Cursor in a focused terminal
    TermCursorNC   { fg = c_orange, bg = c_ocean }, -- Cursor in an unfocused terminal
    ErrorMsg       { fg = c_scarlet }, -- Error messages on the command line
    VertSplit      { }, -- Column separating vertically split windows
    Folded         { fg = c_steel, bg = c_ocean }, -- Line used for closed folds

    -- FoldColumn     { }, -- 'foldcolumn'
    -- SignColumn     { }, -- Column where |signs| are displayed
    IncSearch      { fg = c_black, bg = c_orange }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"

    diffAdded { DiffAdd },
    diffRemoved { DiffDelete },
    diffFile { fg = c_turquoise },

    LineNr         { fg = c_steel.darken(15) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    -- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen     { bg = c_deepsea }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg        { fg = c_smoke }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg        { fg = c_aqua }, -- |more-prompt|
    -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal         { fg = c_smoke, bg = c_space }, -- Normal text
    NormalFloat    { fg = Normal.fg }, -- Normal text in floating windows.
    FloatBorder    { fg = Normal.fg }, -- Border of floating windows.
    FloatTitle     { fg = Normal.fg }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    Pmenu          { fg = c_smoke, bg = c_ocean }, -- Popup menu: Normal item.
    PmenuSel       { fg = c_white, bg = c_thunder }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    PmenuSbar      { bg = c_deepsea }, -- Popup menu: Scrollbar.
    PmenuThumb     { bg = c_steel }, -- Popup menu: Thumb of the scrollbar.
    Question       { }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine   { bg = c_deepsea }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search         { bg = c_thunder }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    Substitute     { Search }, -- |:substitute| replacement text highlighting
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     { fg = c_smoke, bg = c_deepsea }, -- Status line of current window
    StatusLineNC   { fg = c_steel, bg = c_ocean }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    Title          { fg = c_pigeon }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         { fg = Normal.bg, bg = c_smoke_blend }, -- Visual mode selection
    VisualNOS      { Visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     { fg = c_yellow }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = c_steel }, -- Any comment

    Constant       { fg = c_scarlet }, -- (*) Any constant
    String         { fg = c_turquoise }, --   A string constant: "this is a string"
    Character      { }, --   A character constant: 'c', '\n'
    Number         { }, --   A number constant: 234, 0xff
    Boolean        { fg = c_scarlet }, --   A boolean constant: TRUE, false
    Float          { }, --   A floating point constant: 2.3e10

    rubySymbol       { fg = Normal.fg }, -- A ruby symbol: :foo

    Identifier     { fg = Normal.fg }, -- (*) Any variable name
    Function       { }, --   Function name (also: methods for classes)

    Statement      { fg = c_lavender }, -- (*) Any statement
    Conditional    { fg = c_magenta }, --   if, then, else, endif, switch, etc.
    Repeat         { }, --   for, do, while, etc.
    Label          { }, --   case, default, etc.
    Operator       { }, --   "sizeof", "+", "*", etc.
    Keyword        { fg = c_cerulean }, --   any other keyword
    Exception      { fg = Statement.fg }, --   try, catch, throw

    PreProc        { fg = c_turquoise }, -- (*) Generic Preprocessor
    Include        { }, --   Preprocessor #include
    Define         { fg = PreProc.fg }, --   Preprocessor #define
    Macro          { fg = PreProc.fg }, --   Same as Define
    PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = c_ochre }, -- (*) int, long, char, etc.
    StorageClass   { }, --   static, register, volatile, etc.
    Structure      { }, --   struct, union, enum, etc.
    Typedef        { }, --   A typedef

    Special        { fg = String.fg }, -- (*) Any special symbol
    SpecialChar    { fg = Special.fg }, --   Special character in a constant
    Tag            { }, --   You can use CTRL-] on this
    Delimiter      { }, --   Character that needs attention
    SpecialComment { fg = Comment.fg }, --   Special things inside a comment (e.g. '\n')
    Debug          { }, --   Debugging statements

    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { }, -- Any erroneous construct
    Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError            { fg = c_wine } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = c_earth } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = c_smoke } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = c_pigeon } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk               { fg = c_tea } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
