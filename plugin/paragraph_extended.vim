nnoremap <silent> <leader>] :<C-U>call paragraph_extended#Down('', v:count1)<CR>
nnoremap <silent> <leader>[ :<C-U>call paragraph_extended#Up('', v:count1)<CR>
xnoremap <silent> <leader>] :<C-U>call paragraph_extended#Down('v', v:count1)<CR>
xnoremap <silent> <leader>[ :<C-U>call paragraph_extended#Up('v', v:count1)<CR>
