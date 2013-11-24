nnoremap <silent> <leader>] :<C-U>call paragraph_extended#Down('', v:count1)<CR>
nnoremap <silent> <leader>[ :<C-U>call paragraph_extended#Up('', v:count1)<CR>
xnoremap <silent> <leader>] :<C-U>call paragraph_extended#Down('v', v:count1)<CR>
xnoremap <silent> <leader>[ :<C-U>call paragraph_extended#Up('v', v:count1)<CR>

" Operator pending mappings
onoremap <silent> <leader>] :<C-U>call paragraph_extended#PendingDown(v:count1)<CR>
onoremap <silent> <leader>[ :<C-U>call paragraph_extended#PendingUp(v:count1)<CR>
