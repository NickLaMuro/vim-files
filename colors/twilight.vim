
set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "twilight"

let s:grey_blue = '#8a9597'
let s:light_grey_blue = '#a0a8b0'
let s:dark_grey_blue = '#34383c'
let s:mid_grey_blue = '#64686c'
let s:beige = '#ceb67f'
let s:light_orange = '#ebc471'
let s:yellow = '#e3d796'
let s:violet = '#a999ac'
let s:green = '#a2a96f'
let s:lightgreen = '#c2c98f'
let s:red = '#d08356'
let s:cyan = '#74dad9'
let s:darkgrey = '#1a1a1a'
let s:grey = '#303030'
let s:lightgrey = '#605958'
let s:white = '#fffedc'

if version >= 700
  hi CursorLine guibg=#262626
  hi CursorColumn guibg=#262626
  hi MatchParen guifg=white guibg=#80a090 gui=bold

  "Tabpages
  hi TabLine guifg=#a09998 guibg=#202020 gui=underline
  hi TabLineFill guifg=#a09998 guibg=#202020 gui=underline
  hi TabLineSel guifg=#a09998 guibg=#404850 gui=underline

  "P-Menu (auto-completion)
  hi Pmenu guifg=#605958 guibg=#303030 gui=underline
  hi PmenuSel guifg=#a09998 guibg=#404040 gui=underline
  "PmenuSbar
  "PmenuThumb
endif

hi Visual guibg=#404040

"hi Cursor guifg=NONE guibg=#586068
hi Cursor guibg=#b0d0f0


hi Normal         guifg=#fffedc guibg=#1a1a1a
hi Underlined     guifg=#fffedc guibg=#1a1a1a gui=underline
hi NonText        guifg=#605958 guibg=#303030
hi SpecialKey     guifg=#303030 guibg=#1a1a1a

hi LineNr         guifg=#64686c guibg=#34383c gui=none
hi StatusLine     guifg=#fffedc guibg=#303030 gui=underline
hi StatusLineNC   guifg=#605958 guibg=#303030 gui=underline
hi VertSplit      guifg=#303030 guibg=#303030 gui=none

hi Folded         guifg=#8a9597 guibg=#34383c gui=none
hi FoldColumn     guifg=#8a9597 guibg=#34383c gui=none
hi SignColumn     guifg=#8a9597 guibg=#34383c gui=none

hi Comment        guifg=#64686c guibg=#1a1a1a
hi TODO           guifg=#8a9597 guibg=#1a1a1a gui=bold

hi Title          guifg=#d08356 guibg=#1a1a1a gui=underline

hi Constant       guifg=#d08356 guibg=#1a1a1a gui=none
hi String         guifg=#a2a96f guibg=#1a1a1a gui=none
hi Special        guifg=#c2c98f guibg=#1a1a1a gui=none

hi Identifier     guifg=#8a9597 guibg=#1a1a1a gui=none
hi Statement      guifg=#ceb67f guibg=#1a1a1a gui=none
hi Conditional    guifg=#ceb67f guibg=#1a1a1a gui=none
hi Repeat         guifg=#ceb67f guibg=#1a1a1a gui=none
hi Structure      guifg=#ceb67f guibg=#1a1a1a gui=none
hi Function       guifg=#a999ac guibg=#1a1a1a gui=none

hi PreProc        guifg=#8a9597 guibg=#1a1a1a gui=none
hi Operator       guifg=#ebc471 guibg=#1a1a1a gui=none
hi Type           guifg=#e3d796 guibg=#1a1a1a

"hi Identifier guifg=#7587a6
" Type d: 'class'
"hi Structure guifg=#9B859D gui=underline
"hi Function guifg=#dad085
" dylan: method, library, ... d: if, return, ...
"hi Statement guifg=#7187a1 gui=NONE
" Keywords  d: import, module...
"hi PreProc guifg=#8fbfdc
"gui=underline
"hi Operator guifg=#a07020
"hi Repeat guifg=#906040 gui=underline
"hi Type guifg=#708090

"hi Type guifg=#f9ee98 gui=NONE

"hi NonText guifg=#808080 guibg=#303030

"hi Macro guifg=#a0b0c0 gui=underline

"Tabs, trailing spaces, etc (lcs)
"hi SpecialKey guifg=#808080 guibg=#343434

"hi TooLong guibg=#ff0000 guifg=#f8f8f8

hi Search guifg=#606000 guibg=#c0c000 gui=bold

hi Directory guifg=#dad085 gui=NONE
hi Error guibg=#602020

