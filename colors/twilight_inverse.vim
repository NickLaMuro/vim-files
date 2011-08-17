" twilight256 color scheme file
" Maintainer: Neal Milstein - neal dot milstein at gmail dot com
" Last Change: 2011 Feb 1
"
" This theme copies the colors from the TextMate theme Twilight.
"
" The theme is designed to be used on a black background. I only tested it
" using a 256-color terminal; I do not think it will work on much else (gvim,
" 8-color terminal, etc.).
"
" The functions in this theme that convert hex color codes to the nearest
" xterm-256 color number are from the theme desert2 (desert256), developed by Henry So, Jr. 
"
" The colors of this theme are based on the TextMate Twilight theme
" – www.macromates.com

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="my_twilight"

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

" ----------------------------------------------------------------------------------- "

		call <SID>X("Cursor", "8F7F6F", "0F1973", "")  
		call <SID>X("Visual", "", "B4B4B4", "") 
		call <SID>X("CursorLine", "", "D4D4D4", "NONE")
		call <SID>X("CursorColumn", "", "D4D4D4", "")  
		call <SID>X("LineNr", "333333", "C4C4C4", "") 

		call <SID>X("VertSplit", "CFCFCF", "CFCFCF", "") 

		call <SID>X("MatchParen", "325796", "", "")  
		call <SID>X("StatusLine", "CFCFCF", "000123", "")
		call <SID>X("StatusLineNC", "CFCFCF", "9FA6A7", "")

		call <SID>X("TabLine", "070707", "C0C0C0", "") 

		call <SID>X("TabLineFill", "070707", "C0C0C0", "")

		call <SID>X("TabLineSel", "070707", "C0C0C0", "bold")
		call <SID>X("Pmenu", "648FC0", "", "")  
		call <SID>X("PmenuSel", "", "C3BFBC", "")  
		"call <SID>X("IncSearch", "", "CBC5BB", "")  
		"call <SID>X("Search", "", "CBC5BB", "")  
		call <SID>X("Directory", "3095B3", "", "")  
		call <SID>X("Folded", "A0A59F", "EBEBEB", "") 

    call <SID>X("Normal", "000000", "E7E7E7", "")

		call <SID>X("Boolean", "3095B3", "", "")  
		call <SID>X("Character", "3095B3", "", "")  
		call <SID>X("Comment", "A1A69F", "", "")
		call <SID>X("Conditional", "325796", "", "")  
		call <SID>X("Constant", "3095B3", "", "")  
		call <SID>X("Define", "325796", "", "")  
		call <SID>X("ErrorMsg", "", "", "")  
		call <SID>X("WarningMsg", "", "", "")  
		call <SID>X("Float", "3095B3", "", "")  
		call <SID>X("Function", "648FC0", "", "")  
		call <SID>X("Identifier", "061167", "", "")  
		call <SID>X("Keyword", "325796", "", "")  
		call <SID>X("Label", "706295", "", "")  
		call <SID>X("NonText", "9FA6A7", "", "") 

		call <SID>X("Number", "3095B3", "", "")  
		call <SID>X("Operator", "325796", "", "")  
		call <SID>X("PreProc", "325796", "", "")  
		call <SID>X("Special", "070707", "", "")  
		call <SID>X("SpecialKey", "B0B0B0", "E4E4E4", "")

		call <SID>X("Statement", "325796", "", "")  
		call <SID>X("StorageClass", "061167", "", "")  
		call <SID>X("String", "706295", "", "")  
		call <SID>X("Tag", "648FC0", "", "")  
		call <SID>X("Title", "070707", "", "bold")
		call <SID>X("Todo", "A0A59F", "", "inverse,bold,italic")
		call <SID>X("Type", "648FC0", "", "")  
		call <SID>X("Underlined", "", "", "underline")
		call <SID>X("erubyExpression", "", "", "")
		call <SID>X("rubyClass", "325796", "", "")  
		call <SID>X("rubyFunction", "648FC0", "", "")  
		call <SID>X("rubyInterpolation", "DAEFA3", "", "")  
		call <SID>X("rubyInterpolationDelimiter", "DAEFA3", "", "")  
		call <SID>X("rubySymbol", "3095B3", "", "")  
		call <SID>X("rubyConstant", "9b859d", "", "")  
		call <SID>X("rubyStringDelimiter", "706295", "", "") 

		call <SID>X("rubyBlockParameter", "7587a6", "", "") 

		call <SID>X("rubyInstanceVariable", "7587a6", "", "") 

		call <SID>X("rubyInclude", "325796", "", "")  
		call <SID>X("rubyGlobalVariable", "7587a6", "", "") 

		call <SID>X("rubyRegexp", "e9c062", "", "")  
		call <SID>X("rubyRegexpDelimiter", "e9c062", "", "")
		call <SID>X("rubyRegexpSpecial", "e9c062", "", "")
    call <SID>X("rubyRegexpAnchor", "648FC0", "", "")
    call <SID>X("rubyRegexpCharClass", "648FC0", "", "")
    call <SID>X("rubyRegexpQuantifier", "648FC0", "", "")
    call <SID>X("rubyRegexpEscape", "648FC0", "", "")

		call <SID>X("rubyEscape", "3095B3", "", "")  
		call <SID>X("rubyControl", "325796", "", "")  
		call <SID>X("rubyClassVariable", "7587a6", "", "") 

		call <SID>X("rubyOperator", "325796", "", "")  
		call <SID>X("rubyException", "325796", "", "")  
		call <SID>X("rubyPseudoVariable", "7587a6", "", "") 

		call <SID>X("rubyRailsUserClass", "9b859d", "", "") 

		call <SID>X("rubyRailsARAssociationMethod", "dad085", "", "")

		call <SID>X("rubyRailsARMethod", "dad085", "", "") 

		call <SID>X("rubyRailsRenderMethod", "dad085", "", "") 

		call <SID>X("rubyRailsMethod", "dad085", "", "") 

		call <SID>X("erubyDelimiter", "000000", "", "")  
		call <SID>X("erubyComment", "A1A69F", "", "")
		call <SID>X("erubyRailsMethod", "dad085", "", "") 

		call <SID>X("htmlTag", "ac885b", "", "")
		call <SID>X("htmlTagN", "000000", "", "")
		call <SID>X("htmlEndTag", "ac885b", "", "")  
		call <SID>X("htmlTagName", "ac885b", "", "")  
		call <SID>X("htmlArg", "ac885b", "", "")  
		call <SID>X("htmlSpecialChar", "3095B3", "", "") 

		call <SID>X("javaScriptFunction", "061167", "", "") 

		call <SID>X("javaScriptRailsFunction", "dad085", "", "") 

		call <SID>X("javaScriptBraces", "000000", "", "")
		call <SID>X("javaScriptMember", "9a859c", "", "")
		call <SID>X("javaScriptNumber", "cf694b", "", "")
		call <SID>X("javaScriptType", "7587a5", "", "")

		" The following syntaxes are a part of Yi Zhao's javascript.vim syntax highlighting vim script
		call <SID>X("javaScriptParen", "000000", "", "")


		call <SID>X("yamlKey", "648FC0", "", "")  
		call <SID>X("yamlAnchor", "7587a6", "", "")  
		call <SID>X("yamlAlias", "7587a6", "", "")  
		call <SID>X("yamlDocumentHeader", "706295", "", "") 

		call <SID>X("cssURL", "7587a6", "", "")  
		call <SID>X("cssFunctionName", "dad085", "", "")
		call <SID>X("cssDefinition", "cf694b", "", "") 

		call <SID>X("cssColor", "ca773f", "", "")  
		call <SID>X("cssPseudoClassId", "648FC0", "", "") 

		call <SID>X("cssClassName", "648FC0", "", "")  
		call <SID>X("cssValueLength", "3095B3", "", "") 

		call <SID>X("cssCommonAttr", "3095B3", "", "")  
		call <SID>X("cssBraces", "", "", "")  

		call <SID>X("cInclude", "afc3db", "", "")
		call <SID>X("cType", "f9ed97", "", "")
		call <SID>X("cSpecial", "daefa3", "", "")
		call <SID>X("cppStructure", "f9ed97", "", "")

" ----------------------------------------------------------------------------------- "

    " delete functions {{{
    delf <SID>X
    delf <SID>rgb
    delf <SID>color
    delf <SID>rgb_color
    delf <SID>rgb_level
    delf <SID>rgb_number
    delf <SID>grey_color
    delf <SID>grey_level
    delf <SID>grey_number
    " }}}
endif

" vim: set fdl=0 fdm=marker:
