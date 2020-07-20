" NVL-twilight color scheme file
" Maintainer:       Nicholas LaMuro
" Original Author:  Neal Milstein
" Last Change:      2011 Aug 16
"
" This theme is a modification of the twlight256 colorscheme by Neal Milstein
" and merged with the twilight-vim file which used the vim_toCterm plugin
" (author unknown)
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
let g:colors_name="NVL_twilight"

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

    call <SID>X("DiffAdd", "000000", "8fCd6a", "")
    call <SID>X("DiffAdd", "000000", "8F9D6A", "")
    call <SID>X("DiffDelete", "000000", "CF6A4C", "")
    call <SID>X("DiffChange", "000000", "9FCD9A", "")
    call <SID>X("DiffChange", "000000", "DDFFDD", "")
    call <SID>X("DiffChange", "000000", "AAFFAA", "")
    call <SID>X("DiffText", "000000", "EEa0a0", "")
    call <SID>X("DiffText", "000000", "FFAAAA", "")

    call <SID>X("diffAdded",   "00C200", "", "")
    call <SID>X("diffRemoved", "C91B00", "", "")
    call <SID>X("diffLine",    "00C5C7", "", "")
    " call <SID>X("diffSubname", "00C5C7", "", "")
    " hi def link diffSubname diffLine
    hi def link diffFile    Identifier
    " call <SID>X("diffFile", "C7C7C7", "", "")
    call <SID>X("gitDiff", "C7C7C7", "", "")
    " call <SID>X("gitcommitDiff", "C7C7C7", "", "")
    hi def link gitcommitDiff gitDiff
    hi def link diffSubname   gitDiff

    call <SID>X("Cursor", "708090", "f0e68c", "")
    call <SID>X("Visual", "", "4b4b4b", "")
    call <SID>X("CursorLine", "", "2b2b2b", "NONE")
    call <SID>X("CursorColumn", "", "2b2b2b", "")
    call <SID>X("LineNr", "CCCCCC", "3b3b3b", "")
    call <SID>X("CursorLineNr", "", "", "None")

    call <SID>X("VertSplit", "303030", "303030", "")

    call <SID>X("MatchParen", "cda869", "", "")
    call <SID>X("StatusLine", "303030", "fffedc", "")
    call <SID>X("StatusLineNC", "303030", "605958", "")

    call <SID>X("TabLine", "f8f8f8", "3f3f3f", "NONE")

    call <SID>X("TabLineFill", "3f3f3f", "f8f8f8", "")

    call <SID>X("TabLineSel", "f8f8f8", "6f6f6f", "")
    call <SID>X("Pmenu", "9b703f", "", "")
    call <SID>X("PmenuSel", "", "3c4043", "")
    "call <SID>X("IncSearch", "", "343a44", "")
    "call <SID>X("Search", "", "343a44", "")
    call <SID>X("Directory", "cf6a4c", "", "")
    call <SID>X("Folded", "5f5a60", "141414", "")

    call <SID>X("Normal", "ffffff", "181818", "")

    call <SID>X("Boolean", "cf6a4c", "", "")
    call <SID>X("Character", "cf6a4c", "", "")
    call <SID>X("Comment", "5e5960", "", "")
    call <SID>X("Conditional", "cda869", "", "")
    call <SID>X("Constant", "cf6a4c", "", "")
    call <SID>X("Define", "cda869", "", "")
    call <SID>X("ErrorMsg", "", "", "")
    call <SID>X("WarningMsg", "", "", "")
    call <SID>X("Float", "cf6a4c", "", "")
    call <SID>X("Function", "9b703f", "", "")
    call <SID>X("Identifier", "f9ee98", "", "")
    call <SID>X("Keyword", "cda869", "", "")
    call <SID>X("Label", "8f9d6a", "", "")
    call <SID>X("NonText", "605958", "", "")

    call <SID>X("Number", "cf6a4c", "", "")
    call <SID>X("Operator", "cda869", "", "")
    call <SID>X("PreProc", "cda869", "", "")
    call <SID>X("Special", "f8f8f8", "", "")
    call <SID>X("SpecialKey", "4f4f4f", "1b1b1b", "")

    call <SID>X("Statement", "cda869", "", "")
    call <SID>X("StorageClass", "f9ee98", "", "")
    call <SID>X("String", "8f9d6a", "", "")
    call <SID>X("Tag", "9b703f", "", "")
    call <SID>X("Title", "f8f8f8", "", "bold")
    call <SID>X("Todo", "5f5a60", "", "inverse,bold,italic")
    call <SID>X("Type", "9b703f", "", "")
    call <SID>X("Underlined", "", "", "underline")

    call <SID>X("GenericColorClear", "", "", "")
    call <SID>X("GenericConstant", "9B859D", "", "")
    call <SID>X("GenericDefinition", "CF694B", "", "")
    call <SID>X("GenericCType", "F9ED97", "", "")
    call <SID>X("GenericFrameworkFunction", "DAD085", "", "")
    call <SID>X("GenericInclude", "AFC3DB", "", "")
    call <SID>X("GenericInstanceVariable", "7587A6", "", "")
    call <SID>X("GenericInterpolation", "DAEFA3", "", "")
    call <SID>X("GenericRegexp", "E9C062", "", "")

    call <SID>X("HighlightedBlock", "", "000000", "")

    call <SID>X("javaScriptFunction", "f9ee98", "", "")
    call <SID>X("javaScriptBraces", "ffffff", "", "")
    call <SID>X("javaScriptMember", "9a859c", "", "")
    call <SID>X("javaScriptNumber", "cf694b", "", "")
    call <SID>X("javaScriptType", "7587a5", "", "")

    " The following syntaxes are a part of Yi Zhao's javascript.vim syntax highlighting vim script
    call <SID>X("javaScriptParen", "ffffff", "", "")
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
