" hi link cssPseudoClassId Type
" hi link cssClassName     Type

" hi link cssValueLength   Number 
" hi link cssCommonAttr    Number  

if exists("g:colors_name") && g:colors_name == "NVL_twilight"
  hi link cssBraces       GenericColorClear
  hi link cssURL          GenericInstanceVariable
  hi link cssFunctionName GenericFrameworkFunction
  " hi link cssDefinition   GenericDefinition
end


" call <SID>X("cssColor", "ca773f", "", "")  ????
