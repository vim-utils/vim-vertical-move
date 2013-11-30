nnoremap <silent> <leader>] :<C-U>call vertical_move#Down('', v:count1)<CR>
nnoremap <silent> <leader>[ :<C-U>call vertical_move#Up('', v:count1)<CR>
xnoremap <silent> <leader>] :<C-U>call vertical_move#Down('v', v:count1)<CR>
xnoremap <silent> <leader>[ :<C-U>call vertical_move#Up('v', v:count1)<CR>

" Operator pending mappings
onoremap <silent> <leader>] :<C-U>call vertical_move#PendingDown(v:count1)<CR>
onoremap <silent> <leader>[ :<C-U>call vertical_move#PendingUp(v:count1)<CR>
