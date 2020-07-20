" syn region rubyHeredocStart matchgroup=rubyStringDelimiter start=+\%(\%(class\s*\|\%([]})"'.]\|::\)\)\_s*\|\w\)\@<!<<\~\=\zs\%(\h\w*\)+	 end=+$+ oneline contains=ALLBUT,@rubyNotTop

syn region rubyString start=+\%(^.*\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<\z(\%(\h\|[^\x00-\x7F]\)\%(\w\|[^\x00-\x7F]\)*\).*$\)\@<=\n+     matchgroup=rubyStringDelimiter end=+^\z1$+       contains=@rubyStringSpecial keepend fold
syn region rubyString start=+\%(^.*\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<"\z([^"]*\)".*\)\@<=\n+                                          matchgroup=rubyStringDelimiter end=+^\z1$+       contains=@rubyStringSpecial keepend fold
syn region rubyString start=+\%(^.*\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<'\z([^']*\)'.*\)\@<=\n+                                          matchgroup=rubyStringDelimiter end=+^\z1$+                                   keepend fold
syn region rubyString start=+\%(^.*\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<`\z([^`]*\)`.*\)\@<=\n+                                          matchgroup=rubyStringDelimiter end=+^\z1$+       contains=@rubyStringSpecial keepend fold

syn region rubyString start=+\%(^.*\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]\z(\%(\h\|[^\x00-\x7F]\)\%(\w\|[^\x00-\x7F]\)*\).*$\)\@<=\n+ matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=@rubyStringSpecial keepend fold
syn region rubyString start=+\%(^.*\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]"\z([^"]*\)".*\)\@<=\n+                                      matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=@rubyStringSpecial keepend fold
syn region rubyString start=+\%(^.*\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]'\z([^']*\)'.*\)\@<=\n+                                      matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+                             keepend fold
syn region rubyString start=+\%(^.*\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]`\z([^`]*\)`.*\)\@<=\n+                                      matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=@rubyStringSpecial keepend fold

syn region rubyString matchgroup=rubyStringDelimiter start=+\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<\zs\z(\%(\h\|[^\x00-\x7F]\)\%(\w\|[^\x00-\x7F]\)*\)$+                  end=+^\z1$+       contains=@rubyStringSpecial keepend fold
syn region rubyString matchgroup=rubyStringDelimiter start=+\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<\zs"\z([^"]*\)"$+                                                      end=+^\z1$+       contains=@rubyStringSpecial keepend fold
syn region rubyString matchgroup=rubyStringDelimiter start=+\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<\zs'\z([^']*\)'$+                                                      end=+^\z1$+                                   keepend fold
syn region rubyString matchgroup=rubyStringDelimiter start=+\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<\zs`\z([^`]*\)`$+                                                      end=+^\z1$+       contains=@rubyStringSpecial keepend fold

syn region rubyString matchgroup=rubyStringDelimiter start=+\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]\zs\z(\%(\h\|[^\x00-\x7F]\)\%(\w\|[^\x00-\x7F]\)*\)$+              end=+^\s*\zs\z1$+ contains=@rubyStringSpecial keepend fold
syn region rubyString matchgroup=rubyStringDelimiter start=+\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]\zs"\z([^"]*\)"$+                                                  end=+^\s*\zs\z1$+ contains=@rubyStringSpecial keepend fold
syn region rubyString matchgroup=rubyStringDelimiter start=+\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]\zs'\z([^']*\)'$+                                                  end=+^\s*\zs\z1$+                             keepend fold
syn region rubyString matchgroup=rubyStringDelimiter start=+\%(\%(class\|::\)\s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]\zs`\z([^`]*\)`$+                                                  end=+^\s*\zs\z1$+ contains=@rubyStringSpecial keepend fold

" Custom tweaks

hi link rubyRegexpAnchor     rubyFunction
hi link rubyRegexpCharClass  rubyFunction
hi link rubyRegexpQuantifier rubyFunction
hi link rubyRegexpEscape     rubyFunction

hi link rubySymbol           Number
hi link rubyEscape           Number

hi link rubyInclude          Operator
hi link rubyControl          Operator
hi link rubyOperator         Operator
hi link rubyException        Operator

hi link rubyStringDelimiter  String

" Specific extra additions that require NVL_twilight
if exists("g:colors_name") && g:colors_name == "NVL_twilight"
  hi link rubyConstant               GenericConstant

  hi link rubyInstanceVariable       GenericInstanceVariable
  hi link rubyBlockParameter         GenericInstanceVariable
  hi link rubyClassVariable          GenericInstanceVariable
  hi link rubyGlobalVariable         GenericInstanceVariable
  hi link rubyPseudoVariable         GenericInstanceVariable

  hi link rubyInterpolation          GenericInterpolation
  hi link rubyInterpolationDelimiter GenericInterpolation

  hi link rubyRegexp                 GenericRegexp
  hi link rubyRegexpDelimiter        GenericRegexp
  hi link rubyRegexpSpecial          GenericRegexp
end
