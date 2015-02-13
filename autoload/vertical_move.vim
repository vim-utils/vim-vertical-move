if exists('g:autoloaded_vertical_move') && g:autoloaded_vertical_move
  finish
endif
let g:autoloaded_vertical_move = 1

function! s:line_length(line)
  return strdisplaywidth(getline(a:line))
endfunction

function! s:above_line_length()
  return s:line_length(line('.')-1)
endfunction

function! s:below_line_length()
  return s:line_length(line('.')+1)
endfunction

function! s:up_bridge_gap(cursor_column)
  let next_line  = line('.')-1
  let move_count = 1

  while next_line > 1 && s:line_length(next_line) < a:cursor_column
    let next_line  -= 1
    let move_count += 1
  endwhile

  if move_count > 1 && s:line_length(next_line) >= a:cursor_column
    execute 'norm! '.move_count.'k'
  endif
endfunction

function! s:down_bridge_gap(cursor_column)
  let total_lines = line('$')
  let next_line   = line('.')+1
  let move_count  = 1

  while next_line < total_lines && s:line_length(next_line) < a:cursor_column
    let next_line  += 1
    let move_count += 1
  endwhile

  if move_count > 1 && s:line_length(next_line) >= a:cursor_column
    execute 'norm! '.move_count.'j'
  endif
endfunction

" operator pending functions
function! vertical_move#PendingDown(count)
  " norm! 'resets' the visual mode
  norm! v
  call vertical_move#Down('v', a:count)
endfunction

function! vertical_move#PendingUp(count)
  " norm! 'resets' the visual mode
  norm! v
  call vertical_move#Up('v', a:count)
endfunction

" 'public' functions below
function! vertical_move#Down(mode, count)
  norm! m'
  if a:mode ==# 'v'
    norm! gv
  endif

  let i = 0
  while i < a:count
    let i += 1
    let cursor_column = virtcol('.')
    let total_lines   = line('$')

    " first line below is shorter than cursor column, 'bridge' the gap
    if s:below_line_length() < cursor_column
      call s:down_bridge_gap(cursor_column)
    endif

    " move to the bottom of the current paragraph
    while line('.') < total_lines && s:below_line_length() >= cursor_column
      execute 'norm! j'
    endwhile
  endwhile
endfunction

function! vertical_move#Up(mode, count)
  norm! m'
  if a:mode ==# 'v'
    norm! gv
  endif


  let i = 0
  while i < a:count
    let i += 1
    let cursor_column = virtcol('.')

    " first line above is shorter than cursor column, 'bridge' the gap
    if s:above_line_length() < cursor_column
      call s:up_bridge_gap(cursor_column)
    endif

    " move to the top of the current paragraph
    while line('.') > 1 && s:above_line_length() >= cursor_column
      execute 'norm! k'
    endwhile
  endwhile
endfunction
