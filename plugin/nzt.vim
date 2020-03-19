function! s:insertLink(path)
    let l:link = "* " . a:path
    " paste path to the current cursor position
    exe "normal! a" . link . "\<Esc>"
endfunction

function! s:linkZettel()
    " calls FZF and feeds resulting filename to the insertLink function
    call fzf#run({'sink': function('s:insertLink')})
endfunction

command! -nargs=1 Nzt lua require'nzt'.newZettel(<q-args>)
command! NztRefer call s:linkZettel()
