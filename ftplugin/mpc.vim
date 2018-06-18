setlocal buftype=nofile
setlocal cursorline
setlocal nomodifiable
setlocal nowrap
setlocal startofline
" setlocal conceallevel=3
" setlocal concealcursor=nvic

command! -buffer MPCPlay call mpc#PlayByPosition(line("."))

nnoremap <silent> <buffer> <cr>  :MPCPlay<cr>
nnoremap <silent> <buffer> q     :bdelete<cr>
nnoremap <silent> <buffer> <esc> :bdelete<cr>

