" NVL_mac_classic.vim Vim color scheme file
"
" Name:            NVL_mac_classic.vim
" Maintainer:      Nicholas LaMuro
" Orginal Author:  Drew Neil <andrew.jr.neil@gmail.com>
" License:         public domain
" Version:         0.1
"
" This theme is a modification of the twlight256 colorscheme by Neal Milstein
" and merged with the colors of the mac_classic.vim file (by Drew Neil)
"
" The functions in this theme that convert hex color codes to the nearest
" xterm-256 color number are from the theme desert2 (desert256), developed by
" Henry So, Jr. 
"
" The colors of this theme are based on the TextMate Twilight theme

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="my_mac_classic"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
    " functions {{{
    " returns an approximate grey index for the given grey level
    fun <SID>grey_number(x)
        if &t_Co == 88
            if a:x < 23
                return 0
            elseif a:x < 69
                return 1
            elseif a:x < 103
                return 2
            elseif a:x < 127
                return 3
            elseif a:x < 150
                return 4
            elseif a:x < 173
                return 5
            elseif a:x < 196
                return 6
            elseif a:x < 219
                return 7
            elseif a:x < 243
                return 8
            else
                return 9
            endif
        else
            if a:x < 14
                return 0
            else
                let l:n = (a:x - 8) / 10
                let l:m = (a:x - 8) % 10
                if l:m < 5
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual grey level represented by the grey index
    fun <SID>grey_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 46
            elseif a:n == 2
                return 92
            elseif a:n == 3
                return 115
            elseif a:n == 4
                return 139
            elseif a:n == 5
                return 162
            elseif a:n == 6
                return 185
            elseif a:n == 7
                return 208
            elseif a:n == 8
                return 231
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 8 + (a:n * 10)
            endif
        endif
    endfun

    " returns the palette index for the given grey index
    fun <SID>grey_color(n)
        if &t_Co == 88
            if a:n == 0
                return 16
            elseif a:n == 9
                return 79
            else
                return 79 + a:n
            endif
        else
            if a:n == 0
                return 16
            elseif a:n == 25
                return 231
            else
                return 231 + a:n
            endif
        endif
    endfun

    " returns an approximate color index for the given color level
    fun <SID>rgb_number(x)
        if &t_Co == 88
            if a:x < 69
                return 0
            elseif a:x < 172
                return 1
            elseif a:x < 230
                return 2
            else
                return 3
            endif
        else
            if a:x < 75
                return 0
            else
                let l:n = (a:x - 55) / 40
                let l:m = (a:x - 55) % 40
                if l:m < 20
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual color level for the given color index
    fun <SID>rgb_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 139
            elseif a:n == 2
                return 205
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 55 + (a:n * 40)
            endif
        endif
    endfun

    " returns the palette index for the given R/G/B color indices
    fun <SID>rgb_color(x, y, z)
        if &t_Co == 88
            return 16 + (a:x * 16) + (a:y * 4) + a:z
        else
            return 16 + (a:x * 36) + (a:y * 6) + a:z
        endif
    endfun

    " returns the palette index to approximate the given R/G/B color levels
    fun <SID>color(r, g, b)
        " get the closest grey
        let l:gx = <SID>grey_number(a:r)
        let l:gy = <SID>grey_number(a:g)
        let l:gz = <SID>grey_number(a:b)

        " get the closest color
        let l:x = <SID>rgb_number(a:r)
        let l:y = <SID>rgb_number(a:g)
        let l:z = <SID>rgb_number(a:b)

        if l:gx == l:gy && l:gy == l:gz
            " there are two possibilities
            let l:dgr = <SID>grey_level(l:gx) - a:r
            let l:dgg = <SID>grey_level(l:gy) - a:g
            let l:dgb = <SID>grey_level(l:gz) - a:b
            let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
            let l:dr = <SID>rgb_level(l:gx) - a:r
            let l:dg = <SID>rgb_level(l:gy) - a:g
            let l:db = <SID>rgb_level(l:gz) - a:b
            let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
            if l:dgrey < l:drgb
                " use the grey
                return <SID>grey_color(l:gx)
            else
                " use the color
                return <SID>rgb_color(l:x, l:y, l:z)
            endif
        else
            " only one possibility
            return <SID>rgb_color(l:x, l:y, l:z)
        endif
    endfun

    " returns the palette index to approximate the 'rrggbb' hex string
    fun <SID>rgb(rgb)
        let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
        let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
        let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

        return <SID>color(l:r, l:g, l:b)
    endfun

    " sets the highlighting for the given group
    fun <SID>X(group, fg, bg, attr)
        if a:fg != ""
            exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
        endif
        if a:bg != ""
            exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
        endif
        if a:attr != ""
            exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
        endif
    endfun
    " }}}
  endif
" ----------------------------------------------------------------------------------- "


" Colors: {{{1
" TODO figure out how to not highlight TODO
"
" #000000
" #3C4C72 - BLUE/GREY - cursor, rails helpers
" #0000A2 - D.BLUE - numbers & function names
" #1E39F6 - BLUE
" #0066FF - L.BLUE - Comments, TODOs and folds
" #6E79F1 - L.PURPLE - Booleans, Ruby Constants & CSS definitions
" #318495 - BLUE/GREEN - Ruby instance/global/pseudo variables
" #007B22 - D.GREEN - Strings, Labels and code blocks in Markdown
" #00BC41 - L.GREEN - CSS common attributes & ruby interpolation
" #990000 - BURGUNDY - Errors and Warnings
" #D51015 - RED for constants, symbols, numbers
" #E18AC7 - PINK RegularExpressions in Ruby
" #FFCE77 - ORANGE - Incremental Search
" #FFE6BB - L.ORANGE - Search
" #C6DEFF - VL.BLUE Visual, Current StatusLine & AutoComplete selection
" #808080 - Line numbers
" #CFCFCF - VerticalSplit separator
" #DFDFDF - Invisible Characters
" #EFEFEF - LineNumber & Non-Current StatusLine
" #F0F6FF - CursorLine & CursorColumn
" #FFFFFF - WHITE
" }}}

" GUI: {{{1
call <SID>X("Cursor", "AAAAAA", "3C4C72", "")
call <SID>X("Visual", "C6DEFF", "", "")
call <SID>X("CursorLine", "", "F6F6F6", "NONE")
call <SID>X("CursorColumn", "", "", "")
call <SID>X("LineNr", "808080", "EFEFEF", "")
call <SID>X("VertSplit", "EFEFEF", "CFCFCF", "")
call <SID>X("MatchParen", "0066FF", "", "bold")
call <SID>X("Pmenu", "", "EFEFEF", "")
call <SID>X("PmenuSel", "", "C6DEFF", "")
call <SID>X("Directory", "D51015", "", "bold")
call <SID>X("Folded", "0066FF", "FFFFFF", "")
" StatusLine: {{{2
call <SID>X("StatusLine", "000000", "EFEFEF", "bold")
call <SID>X("StatusLineNC", "EFEFEF", "808080", "")

" Search: {{{2
" [IncSearch is stronger than Search]
call <SID>X("IncSearch",  "", "FFCE77", "")
call <SID>X("Search", "", "FFE6BB", "")

" Syntax: {{{1
call <SID>X("Normal", "000000", "FFFFFF", "")
call <SID>X("Boolean", "6E79F1", "", "bold")
call <SID>X("Character", "D51015", "", "bold")
call <SID>X("Comment", "0066FF", "", "")
if has("gui_running")
  call <SID>X("Comment", "0066FF", "", "italic")
endif
call <SID>X("Conditional", "1E39F6", "", "bold")
call <SID>X("Constant", "D51015", "", "bold")
call <SID>X("Define", "1E39F6", "", "bold")
call <SID>X("ErrorMsg", "FFFFFF", "990000", "")
call <SID>X("WarningMsg", "FFFFFF", "990000", "")
call <SID>X("Float", "0000A2", "", "")
call <SID>X("Function", "0000A2", "", "bold")
call <SID>X("Identifier", "1E39F6", "", "bold")
call <SID>X("Keyword", "1E39F6", "", "bold")
call <SID>X("Label", "007B22", "", "")
call <SID>X("Number", "0000A2", "", "")
call <SID>X("Operator", "1E39F6", "", "bold")
call <SID>X("PreProc", "1E39F6", "", "bold")
call <SID>X("Special", "000000", "", "")
call <SID>X("Statement", "1E39F6", "", "bold")
call <SID>X("StorageClass", "1E39F6", "", "bold")
call <SID>X("String", "007B22", "", "")
call <SID>X("Title", "000000", "", "bold")
call <SID>X("Todo", "0066FF", "", "inverse,bold,italic")
call <SID>X("Underlined", "", "", "underline")

" Invisible character colors
call <SID>X("NonText", "DFDFDF", "FFFFFF", "")
call <SID>X("SpecialKey", "DFDFDF", "FFFFFF", "")

" Diff styles {{{1
call <SID>X("diffAdded", "007B22", "FFFFFF", "")
call <SID>X("diffRemoved", "D51015", "FFFFFF", "")
call <SID>X("diffFile", "6E79F1", "FFFFFF", "")
call <SID>X("diffNewFile", "6E79F1", "FFFFFF", "")
call <SID>X("diffLine", "000000", "FFFFFF", "")

call <SID>X("diffAdd", "007B22", "FFFFFF", "")
call <SID>X("diffChange", "007B22", "FFFFFF", "")
call <SID>X("diffText", "007B22", "FFFFFF", "")
hi link diffDelete diffRemoved
" Git styles {{{1
call <SID>X("gitcommitFirstLine", "000000", "FFFFFF", "")
call <SID>X("gitcommitSelectedType", "007B22", "FFFFFF", "")
hi link gitcommitSelectedFile gitcommitSelectedType
call <SID>X("gitcommitDiscardedType", "D51015", "FFFFFF", "")

hi link gitcommitDiscardedFile gitcommitDiscardedType
call <SID>X("gitcommitUntrackedFile", "6E79F1", "FFFFFF", "")

" Ruby styles {{{1
call <SID>X("rubyClass", "1E39F6", "", "bold")
call <SID>X("rubyFunction", "0000A2", "", "bold")
call <SID>X("rubyInterpolationDelimiter", "00BC41", "", "")
call <SID>X("rubyInterpolation", "00BC41", "", "")
call <SID>X("rubySymbol", "D51015", "", "bold")
call <SID>X("rubyConstant", "6E79F1", "", "bold")
call <SID>X("rubyStringDelimiter", "007B22", "", "")
call <SID>X("rubyInstanceVariable", "318495", "", "")
call <SID>X("rubyInclude", "1E39F6", "", "bold")
call <SID>X("rubyGlobalVariable", "318495", "", "")
call <SID>X("rubyRegexp", "E18AC7", "", "")
call <SID>X("rubyRegexpAnchor", "E18AC7", "", "")
call <SID>X("rubyRegexpQuantifier", "E18AC7", "", "")
call <SID>X("rubyRegexpParens", "E18AC7", "", "")
call <SID>X("rubyRegexpEscape", "00BC41", "", "")
call <SID>X("rubyRegexpCharClass", "00BC41", "", "")
call <SID>X("rubyRegexpDelimiter", "E18AC7", "", "")
call <SID>X("rubyEscape", "00BC41", "", "")
call <SID>X("rubyControl", "1E39F6", "", "bold")
call <SID>X("rubyOperator", "1E39F6", "", "bold")
call <SID>X("rubyException", "1E39F6", "", "bold")
call <SID>X("rubyPseudoVariable", "318495", "", "")
call <SID>X("rubyRailsUserClass", "6E79F1", "", "bold")
call <SID>X("rubyRailsARAssociationMethod", "3C4C72", "", "bold")
call <SID>X("rubyRailsARMethod", "3C4C72", "", "bold")
call <SID>X("rubyRailsRenderMethod", "3C4C72", "", "bold")
call <SID>X("rubyRailsMethod", "3C4C72", "", "bold")
hi link erubyComment Comment
call <SID>X("erubyRailsMethod", "3C4C72", "", "bold")

" XML: {{{1
hi link xmlEndTag xmlTag
" HTML: {{{1
call <SID>X("htmlTag", "1E39F6", "", "")
hi link htmlEndTag htmlTag
hi link htmlTagName htmlTag
hi link htmlArg htmlTag
call <SID>X("htmlSpecialChar", "D51015", "", "bold")
call <SID>X("htmlH1", "", "", "bold")
hi link htmlH2 htmlH1
hi link htmlH3 htmlH1
hi link htmlH4 htmlH1
hi link htmlH5 htmlH1
hi link htmlH6 htmlH1

" JavaScript: {{{1
call <SID>X("javaScriptFunction", "1E39F6", "", "bold")
call <SID>X("javaScriptFuncName", "318495", "", "italic")
call <SID>X("javaScriptLabel", "0000A2", "", "bold")
call <SID>X("javaScriptRailsFunction", "3C4C72", "", "bold")
call <SID>X("javaScriptType", "318495", "", "")
call <SID>X("javaScriptArgument", "318495", "", "italic")
call <SID>X("javaScriptRegexpString", "E18AC7", "", "")
call <SID>X("javaScriptSpecial", "00BC41", "", "")
" NOTE: Syntax Highlighting for javascript doesn't match the
" TextMate version very accurately, because the javascript
" syntax file does not create matches for some items. In
" particular:
" * javaScriptArgument - e.g. function(argument)
" * javaScriptFuncName for object literal style functions - e.g.: 
"     myFunction: function() { ... }

" YAML: {{{1
call <SID>X("yamlAnchor", "318495", "", "")
call <SID>X("yamlAlias", "318495", "", "")
call <SID>X("yamlDocumentHeader", "", "F2F2F2", "")

" CSS: {{{1
call <SID>X("cssTagName", "", "", "bold")
call <SID>X("cssIdentifier", "", "", "")
if has("gui_running")
  call <SID>X("cssIdentifier", "", "", "italic")
endif
hi link cssClassName cssIdentifier
call <SID>X("cssDefinition", "6E79F1", "", "")
hi link cssRenderProp cssDefinition
hi link cssTableProp cssDefinition
hi link cssTextProp cssDefinition
hi link cssFontProp cssDefinition
hi link cssColorProp cssDefinition
hi link cssBoxProp cssDefinition
hi link cssGeneratedContentProp cssDefinition
hi link cssUIProp cssDefinition
call <SID>X("cssCommonAttr", "00BC41", "", "")
hi link cssRenderAttr cssCommonAttr
hi link cssTextAttr cssCommonAttr
hi link cssFontAttr cssCommonAttr
hi link cssGeneratedContentAttr cssCommonAttr
call <SID>X("cssURL", "007B22", "", "")
call <SID>X("cssFunctionName", "3C4C72", "", "bold")
call <SID>X("cssColor", "D51015", "", "bold")
call <SID>X("cssValueLength", "0000A2", "", "")
call <SID>X("cssImportant", "1E39F6", "", "bold")

" Vimscript: {{{1
call <SID>X("vimGroup", "007B22", "", "bold")
hi link vimHiGroup vimGroup
call <SID>X("vimCommentTitle", "3C4C72", "", "bold")
call <SID>X("helpSpecial", "6E79F1", "", "")

" Markdown: {{{1
call <SID>X("markdownBold", "", "", "bold")
call <SID>X("markdownItalic", "", "", "italic")
call <SID>X("markdownCode", "007B22", "", "")
hi link markdownCodeBlock markdownCode

" Outliner: {{{1
call <SID>X("BT1", "808080", "", "italic")
call <SID>X("OL1", "000000", "", "bold")
call <SID>X("OL2", "0000A2", "", "bold")
call <SID>X("OL3", "007B22", "", "bold")
call <SID>X("OL4", "6E79F1", "", "")
