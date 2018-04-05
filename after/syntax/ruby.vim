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

