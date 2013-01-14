"============================================================================
" 会社固有設定
"============================================================================

if !exists("office_autocommands_loaded")

    " cjava ファイルは java ファイルとして扱う。
    au BufNewFile,BufRead *.cjava setf java

    " gmk ファイルは make ファイルとして扱う。
    au BufNewFile,BufRead *.gmk setf make

endif

" vim:filetype=vim
