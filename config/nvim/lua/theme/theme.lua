local lush = require("lush")

local palette = require("theme.palette")

local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    ColorColumn   { bg = palette.panel },
    Conceal       { },
    Cursor        { fg = palette.bg, bg = palette.fg },
    CursorColumn  { bg = palette.panel },
    CursorLine    { bg = palette.panel },
    Folded        { fg = palette.subtle, bg = palette.panel },
    LineNr        { fg = palette.muted },
    MatchParen    { bg = palette.pine_blend, fg = palette.pine },
    NonText       { fg = palette.highlight_high },
    Normal        { fg = palette.fg },
    NormalFloat   { },
    Visual        { bg = palette.highlight_med },
    Winseparator  { },

    StatusLine    { fg = palette.subtle, bg = palette.panel },
    StatusLineNC  { fg = palette.muted, bg = palette.surface },
    Question      { fg = palette.subtle },
    Directory     { fg = palette.foam, bold = true },
    QuickFixLine  { fg = palette.foam },
    Title         { fg = palette.foam, bold = true },
    ModeMsg       { fg = palette.subtle },
    MsgArea       { ModeMsg },
    MsgSeparator  { ModeMsg },
    MoreMsg       { fg = palette.iris },
    ErrorMsg      { fg = palette.error },
    WarningMsg    { fg = palette.warn },

    Search        { fg = palette.text, bg = palette.gold_blend },
    CurSearch     { fg = palette.base, bg = palette.gold },

    Pmenu         { fg = palette.subtle },
    PmenuMatch    { fg = palette.gold, bold = true },
    PmenuSel      { bg = palette.highlight_med },
    PmenuSbar     { bg = palette.panel },
    PmenuThumb    { bg = palette.muted },

    SpellBad      { sp = palette.error, undercurl = true },
    SpellCap      { sp = palette.warn, undercurl = true },
    SpellLocal    { sp = palette.ok, undercurl = true },
    SpellRare     { sp = palette.hint, undercurl = true },

    DiffAdd       { bg = palette.foam_blend },
    DiffChange    { bg = palette.iris_blend },
    DiffDelete    { bg = palette.love_blend },
    DiffText      { bg = palette.panel },
    diffAdded     { DiffAdd },
    diffChanged   { DiffChange },
    diffRemoved   { DiffDelete },

    -- :h group-name
    Comment         { fg = palette.muted },

    Constant        { fg = palette.rose },
    String          { fg = palette.pine },
    Character       { },
    Number          { },
    Boolean         { fg = palette.rose },
    Float           { },

    Identifier      { Normal },
    Function        { Normal },

    Statement       { fg = palette.iris },
    Conditional     { fg = palette.love },
    Repeat          { fg = palette.love },
    Label           { fg = palette.rose },
    Operator        { },
    Keyword         { fg = palette.cerulean },

    PreProc         { fg = palette.pine },
    Include         { },
    PreCondit       { },

    Type            { fg = palette.ochre },
    StorageClass    { },
    Structure       { },
    Typedef         { },

    Special         { String },
    SpecialChar     { Special },
    Tag             { },
    Delimiter       { fg = palette.subtle },
    SpecialComment  { Comment },
    Debug           { },

    Underlined      { underline = true },

    Ignore          { },
    Error           { fg = palette.love },
    Todo            { fg = palette.rose, bg = palette.rose_blend },

    -- :h diagnostic-highlights
    DiagnosticError           { fg = palette.error },
    DiagnosticWarn            { fg = palette.warn },
    DiagnosticInfo            { fg = palette.info },
    DiagnosticHint            { fg = palette.hint },
    DiagnosticOk              { fg = palette.ok },
    DiagnosticUnderlineError  { sp = palette.error, underline = true },
    DiagnosticUnderlineWarn   { sp = palette.warn, underline = true },
    DiagnosticUnderlineInfo   { sp = palette.info, underline = true },
    DiagnosticUnderlineHint   { sp = palette.hint, underline = true },
    DiagnosticUnderlineOk     { sp = palette.ok, underline = true },

    -- Ruby
    -- rubyClass             { PreProc },
    -- rubyDefine            { Keyword },
    -- rubyInstanceVariable  { fg = palette.pine },
    rubyMethodName        { Normal },
    rubyPseudoVariable    { Normal },
    rubySymbol            { Normal },

    -- Treesitter
    sym("@variable")        { Normal },
    sym("@lsp.type.method") { },

    -- llama.vim
    llama_hl_hint { fg = palette.muted, italic = true },
    llama_hl_info { fg = palette.info },

    -- fzf-lua
    FzfLuaBufFlagCur  { fg = palette.gold, bold = true },
    FzfLuaBufFlagAlt  { fg = palette.rose },
    FzfLuaPathLineNr  { fg = palette.pine },
  }
end)

return theme
