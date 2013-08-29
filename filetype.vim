" 独自の filetype ファイル
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.gradle setfiletype groovy
augroup END
