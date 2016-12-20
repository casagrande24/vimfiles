"============================================================================
" Java 関連
"============================================================================
" ネイティブメソッドへのタグジャンプ
nmap <F9> :execute "ta /^Java_.*_" . substitute(expand("<cword>"), "_", "_1", "g")<CR>
" file name = class name
nmap <F10> :execute "ta /^Java_.*_" . substitute(expand("%:t:r"), "_", "_1", "g") . "_" . substitute(expand("<cword>"), "_", "_1", "g")<CR>

" print function name
"nmap <C-j> :echo FunctionName()<CR>

" メソッド単位でジャンプ
nmap <buffer> [[ [mzz
nmap <buffer> ]] ]mzz

" vim:filetype=vim
