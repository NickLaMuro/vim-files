if hlexists('diffAddedColor')
  hi link diffAdded diffAddedColor
endif
if hlexists('diffRemovedColor')
  hi link diffRemoved diffRemovedColor
endif
if hlexists('diffLineColor')
  hi link diffLine diffLineColor
endif
if hlexists('gitDiffColor')
  hi link diffSubname gitDiffColor
endif

hi link diffFile Identifier
