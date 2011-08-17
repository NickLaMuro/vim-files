" rob.robb.ns

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="vilight"

hi Normal         guifg=#b6b6b6 ctermfg=249           guibg=#212121 ctermbg=234
hi Cursor         guifg=#212121 ctermfg=234           guibg=#9ca9b7 ctermbg=248
hi CursorLine	  guifg=#ffffff		 ctermfg=15      guibg=#6c8095 ctermbg=66
hi Directory      guifg=#6c8095 ctermfg=66            guibg=NONE
hi VertSplit      guifg=#b6b6b6 ctermfg=249           guibg=#a6a6a6 ctermbg=248
hi Folded         guifg=#424242 ctermfg=238           guibg=NONE     gui=italic
hi FoldColumn	  guifg=#9ca9b7 ctermfg=248           guibg=NONE     gui=italic
hi vimFold	      guifg=#dee4ea		 ctermfg=7      guibg=NONE     gui=italic
hi IncSearch      guifg=#212121 ctermfg=234           guibg=#b6b6b6 ctermbg=249
hi LineNr         guifg=#424242 ctermfg=238           guibg=NONE
hi ModeMsg        guifg=#8f9d6a ctermfg=107           guibg=NONE
hi MoreMsg        guifg=#8f9d6a ctermfg=107           guibg=NONE
hi NonText        guifg=#424242 ctermfg=238           guibg=NONE
hi Search         guifg=#212121 ctermfg=234           guibg=#b6b6b6 ctermbg=249     gui=underline
hi StatusLine     guifg=#9ca9b7 ctermfg=248           guibg=#424242 ctermbg=238     
hi StatusLineNC   guifg=#9ca9b7 ctermfg=248           guibg=#212121 ctermbg=234     
hi Visual         guifg=#212121 ctermfg=234           guibg=#9ca9b7 ctermbg=248     gui=italic
hi WildMenu       guifg=#6c8095 ctermfg=66           guibg=#ffffff ctermbg=15
hi MatchParen	  guifg=#ffffff		 ctermfg=15      guibg=#6c8095 ctermbg=66     gui=bold
hi ErrorMsg	      guifg=#cf6a4c ctermfg=167           guibg=NONE        gui=NONE
hi WarningMsg	  guifg=#eedd82		 ctermfg=222      guibg=NONE        gui=NONE
hi Title	      guifg=#cf6a4c		 ctermfg=167      guibg=NONE

"Syntax hilight groups

hi Comment        guifg=#424242 ctermfg=238           gui=italic
hi Constant       guifg=#7587a6 ctermfg=103           gui=bold
hi Exception      guifg=#cf6a4c ctermfg=167           gui=NONE
hi String         guifg=#8f9d6a ctermfg=107           gui=NONE
hi Variable       guifg=#7587a6 ctermfg=103           gui=NONE
hi Number         guifg=#cf6a4c ctermfg=167           gui=NONE
hi Define         guifg=#7587a6 ctermfg=103           gui=NONE
hi Boolean        guifg=#CF6A4C ctermfg=167           gui=NONE
hi Float          guifg=#cf6a4c ctermfg=167           gui=NONE
hi Identifier     guifg=#7587a6 ctermfg=103           gui=NONE
hi Statement      guifg=#cda869 ctermfg=179           gui=NONE
hi Keyword        guifg=#cda869 ctermfg=179           gui=NONE
hi PreProc        guifg=#7587a6 ctermfg=103           gui=NONE
hi Type           guifg=#9b859d		 ctermfg=246      gui=NONE		
hi Typedef        guifg=#cda869 ctermfg=179           gui=NONE
hi Special        guifg=#cda869 ctermfg=179           gui=NONE
hi SpecialChar    guifg=#7587a6 ctermfg=103           gui=NONE
hi SpecialComment guifg=#4f94cd ctermfg=68           gui=NONE
hi Ignore         guifg=#848484 ctermfg=102           gui=NONE
hi Error          guifg=#cf6a4c ctermfg=167           guibg=NONE         gui=underline
hi Todo           guifg=#f9ee98		 ctermfg=228      guibg=NONE         gui=bold
hi Pmenu          guifg=#212121 ctermfg=234           guibg=#9ca9b7 ctermbg=248
hi PmenuSel       guifg=#ffffff ctermfg=15           guibg=#6c8095 ctermbg=66
hi PmenuSbar      guibg=#b6b6b6 ctermbg=249
hi PmenuThumb     guifg=#424242 ctermfg=238

"more groups
hi pythonClass  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE
hi pythonFunction  guifg=#CF6A4C ctermfg=167 guibg=NONE gui=NONE
hi pythonInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi pythonSymbol  guifg=NONE guibg=NONE gui=NONE
hi pythonBuiltin  guifg=#9ca9b7 ctermfg=248 guibg=NONE gui=NONE
hi pythonInstanceVariable  guifg=NONE guibg=NONE gui=NONE
hi pythonRequire  guifg=#8F9D6A ctermfg=107 guibg=NONE gui=NONE
hi pythonGlobalVariable  guifg=NONE guibg=NONE gui=NONE
hi pythonRegexp  guifg=#6c8095 ctermfg=66 guibg=NONE gui=NONE
hi pythonRegexpDelimiter  guifg=NONE guibg=NONE gui=NONE
hi pythonEscape  guifg=NONE guibg=NONE gui=NONE
hi pythonControl  guifg=#4f94cd ctermfg=68 guibg=NONE gui=NONE
hi pythonClassVariable  guifg=NONE guibg=NONE gui=NONE
hi pythonOperator  guifg=NONE guibg=NONE gui=NONE
hi pythonException  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE
hi pythonPseudoVariable  guifg=NONE guibg=NONE gui=NONE
hi makoDelimiter  guifg=NONE guibg=NONE gui=NONE
hi makoComment  guifg=NONE guibg=NONE gui=NONE
hi htmlTag  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE
hi htmlEndTag  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE
hi htmlTagName  guifg=#b6b6b6 ctermfg=249 guibg=NONE gui=NONE
hi htmlArg  guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#4f94cd ctermfg=68 guibg=NONE gui=NONE
hi yamlAnchor  guifg=NONE guibg=NONE gui=NONE
hi yamlAlias  guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE
hi cssURL  guifg=NONE guibg=NONE gui=NONE
hi cssFunctionName  guifg=NONE guibg=NONE gui=NONE
hi cssColor  guifg=NONE guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#7587a6 ctermfg=103 guibg=NONE gui=NONE
hi cssClassName  guifg=#cda869 ctermfg=179 guibg=NONE gui=NONE
hi cssValueLength  guifg=NONE guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#cf6a4c ctermfg=167 guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE

"diff

hi DiffAdd        guifg=#8f9d6a ctermfg=107          guibg=NONE
hi DiffChange     guifg=#cda869 ctermfg=179          guibg=NONE
hi DiffText       guifg=#b6b6b6 ctermfg=249          guibg=NONE
hi DiffDelete     guifg=#cf6a4c ctermfg=167          guibg=NONE
