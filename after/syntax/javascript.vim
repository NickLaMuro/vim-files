hi link javaScriptFunction Identifier
hi link javaScriptNumber Number
hi link javaScriptBraces Normal

" The following syntaxes are a part of Yi Zhao's javascript.vim syntax
" highlighting vim script
hi link javaScriptParen Normal

if hlexists('GenericInstanceVariable')
  hi link javaScriptMember GenericInstanceVariable
  hi link javaScriptType   GenericInstanceVariable
endif
