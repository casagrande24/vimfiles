"============================================================================
" QuickFix 関連
"============================================================================
"------------------------------------------------------------------------------
" FUNCTION: Display the next item in the quickfix list or location list.
"------------------------------------------------------------------------------
function! s:QuickFixNext()
    " 1st: quickfix
    try
        execute "cnext"
        return
    catch
    endtry

    " 2nd: location list
    try
        execute "lnext"
    catch
        echohl ErrorMsg | echo 'No quickfix list' | echohl None
    endtry
endfunction

"------------------------------------------------------------------------------
" FUNCTION: Display the previous item in the quickfix list or location list.
"------------------------------------------------------------------------------
function! s:QuickFixPrev()
    " 1st: quickfix
    try
        execute "cprev"
        return
    catch
    endtry

    " 2nd: location list
    try
        execute "lprev"
    catch
        echohl ErrorMsg | echo 'No quickfix list' | echohl None
    endtry
endfunction

command! QFNext call s:QuickFixNext()
command! QFPrev call s:QuickFixPrev()

nmap <C-n> :QFNext<CR>
nmap <C-p> :QFPrev<CR>

" vim:filetype=vim
