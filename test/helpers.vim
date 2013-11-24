function! CharacterUnderCursor()
  return getline('.')[col('.')-1]
endfunction

function! PositionToString(string)
  execute "normal /".a:string."\<CR>"
  return
endfunction
