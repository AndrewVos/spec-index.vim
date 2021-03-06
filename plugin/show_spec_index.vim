if exists('g:spec_index_loaded')
  finish
endif

let g:spec_index_loaded = 1

function ShowSpecIndex()
  call setqflist([])

  for line_number in range(1,line('$'))
    if getline(line_number) =~ '^[ \t]*\(\<[Ii]ts\?\>\|\<[Dd]escribe\>\|\<[Cc]ontext\>\|\<[Ff]eature\>\|\<[Ss]cenario\>\)'
      let expr = printf('%s:%s:%s', expand("%"), line_number, substitute(getline(line_number), '[ \t]', nr2char(160), 'g'))
      caddexpr expr
    endif
  endfor

  copen

  " hide filename and linenumber
  set conceallevel=2 concealcursor=nc
  syntax match qfFileName /^[^|]*|[^|]*| / transparent conceal
endfunction
